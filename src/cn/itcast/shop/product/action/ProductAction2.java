package cn.itcast.shop.product.action;

import java.util.Arrays;
import java.util.List;
import java.util.Enumeration;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.category.service.CategoryService;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.product.vo.Product;
import cn.itcast.shop.user.vo.User;
import cn.itcast.shop.uservisit.vo.Record;
import cn.itcast.shop.uservisit.vo.Similar;
import cn.itcast.shop.uservisit.vo.Uservisit;
import cn.itcast.shop.utils.Arithmetic;
import cn.itcast.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 *  商品的action对象
 * @author Administrator
 *
 */
public class ProductAction2 extends ActionSupport implements ModelDriven<Product>{
	// 用于接收数据的模型驱动.
		private Product product = new Product();
		public Product getModel() {
			return product;
		}
		
		//private Uservisit uservisit = new Uservisit();
		
		// 注入商品的Service
		private ProductService productService; 
		// 接收分类cid
		private Integer cid;
		// 接收二级分类id
		private Integer csid;

		public Integer getCsid() {
			return csid;
		}

		public void setCsid(Integer csid) {
			this.csid = csid;
		}

		// 注入一级分类的Service
		private CategoryService categoryService;
		// 接收当前页数:
		private int page;

		public void setPage(int page) {
			this.page = page;
		}

		public void setCategoryService(CategoryService categoryService) {
			this.categoryService = categoryService;
		}

		public void setCid(Integer cid) {
			this.cid = cid;
		}

		public Integer getCid() {
			return cid;
		}

		public void setProductService(ProductService productService) {
			this.productService = productService;
		}

		
		
		private User user;
		

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}
		

		// 根据商品的ID进行查询商品:执行方法:
		public String findByPid() {
			// 调用Service的方法完成查询.
			product = productService.findByPid(product.getPid());
			/**
			 * 对数据表的pvisitcount进行+1操作
			 */
			product.setPvisitcount(product.getPvisitcount()+1);
			productService.updatePvisitCount(product);
			
			
			if((User)ServletActionContext.getRequest().getSession().getAttribute("existUser")==null){
				return "findByPid";
			}
				/**
				 * 登录的用户点击商品，record表里边的csidvisit+1
				 */
		
			
				Record record = productService.getCsCount(product.getCategorySecond().getCsid(),user.getUid());
				record.setCsidvisit(record.getCsidvisit()+1);
				productService.saveCsidVisit(record);
				
				
				
			
			/**
			 * 在进行浏览操作之后，Record表的csidvisit进行了更新操作，那么此时就可以使用Record表来计算用户之间的相似度，
			 * 把得出来的值弄到Similar表中去 表中字段为 uid，csid similar(double)
			 * 1、建表 实体类+映射+配置映射。
			 * 2、返回List<Record>的对象，作为算法类的参数
			 * 3、调用算法类，参数为返回对象，根据返回值取出数据【更新到数据库】，若没有数据，则【添加到数据库】
			 * 4、根据返回值的参数，查询product数据库，取出pvisitcount数量最多的几个product组成链表，返回，添加到session中，首页取出
			 */
			
			
			//2、取到算法模板的参数
				//1、取出当前user的Record对象【作为参数】
 				List<Record> uidRecordList = productService.findByRecordUid(user.getUid());
				//2、取出其他user的Record对象【作为参数】
				List<Record> otherUidRecordList = productService.findByRecordOtherUid(user.getUid());
				//System.out.println(otherUidRecordList.size()+"===========================");
				//3、取出其他User对象的实体的个数，即为本次要得到的similar的个数
				List<Integer> otherUidIntegerList = productService.findOtherUidByUid(user.getUid());
				//System.out.println(otherUidIntegerList.size()+"=========="+otherUidIntegerList.get(0));
				
				//4、调用了算法类，返回List<Similar>对象。
				List<Similar> similarList = Arithmetic.getSimilar(uidRecordList, otherUidRecordList,otherUidIntegerList.size());
				System.out.println(similarList.size());
				System.out.println(similarList.get(0).getSimilarvalue()+"这是"+similarList.get(0).getRefuid()+"和当前对象的相似度的值");
				System.out.println(similarList.get(1).getSimilarvalue()+"这是"+similarList.get(1).getRefuid()+"和当前对象的相似度的值");
				
				
				/**
				 * 用户之间的相似度的值成功得到，那么就得往Similar中存取记录
				 */
				
				
				
				
				//5、similar记录保存[???,或者是更新]，假设本来的都是0
				/*for(int i=0;i<similarList.size();i++){
					if(){
						productService.saveSimilar(similarList.get(i));
						System.out.println("保存或者方法执行"+i+"次");
					}else{
						productService.updateSimilar(similarList.get(i));
						System.out.println("保存或者方法执行"+i+"次");
					}
					
				}*/
				/**
				 * 先判断表中是否有值，若没有值，则插入，若有值，则进行更新。
				 */
				/*for(int i=0;i<similarList.size();i++){
					Similar existSimilar = productService.findSimilar(similarList.get(i).getRefuid());
					if(existSimilar==null){
						productService.saveSimilar(similarList.get(i));
					}else{
						productService.updeSimilar(similarList.get(i));
					}
				}*/
				
				
				
				//1、先往similar表中插入值 uid 和 refuid
				List<Similar> findSimilarList = productService.findSimilar(user.getUid());
				Similar similar = new Similar();
				if(findSimilarList==null){
					for(int i=0;i<similarList.size();i++){
						
						similar.setUid(user.getUid());
						similar.setRefuid(similarList.get(i).getRefuid());
						similar.setSimilarvalue(similarList.get(i).getSimilarvalue());
						productService.saveSimilar(similar);
					}
				}else{
					//如果表中记录存在,返回那两个对象，此时都有了id值，可以进行更新。
					System.out.println(findSimilarList.size());  //2
					for(int i=0;i<findSimilarList.size();i++){
						similar.setSimilarid(findSimilarList.get(i).getSimilarid());
						similar.setUid(findSimilarList.get(i).getUid());
						similar.setRefuid(similarList.get(i).getRefuid());
						similar.setSimilarvalue(similarList.get(i).getSimilarvalue());
						productService.updateSimilar(similar);
					}
					
				}
			
				
				
			/*	List<Product> recommendList = productService.findRefUid();
				for(int i=0;i<recommendList.size();i++){
					System.out.println(recommendList.get(i).getPname());
				}*/
				
				
				
				
				
			
			return "findByPid";
		}

		// 根据分类的id查询商品:
		public String findByCid() {
			// List<Category> cList = categoryService.findAll();
			PageBean<Product> pageBean = productService.findByPageCid(cid, page);// 根据一级分类查询商品,带分页查询
			// 将PageBean存入到值栈中:
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByCid";
		}

		// 根据二级分类id查询商品:
		public String findByCsid() {
			// 根据二级分类查询商品
			PageBean<Product> pageBean = productService.findByPageCsid(csid, page);
			// 将PageBean存入到值栈中:
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByCsid";
		}
}
