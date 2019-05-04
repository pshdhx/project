package cn.itcast.shop.product.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.List;
import java.util.Enumeration;

import javafx.application.Application;

import javax.servlet.Servlet;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;

import sun.io.CharacterEncoding;

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
import com.sun.corba.se.spi.extension.RequestPartitioningPolicy;

/**
 *  商品的action对象
 * @author Administrator
 *
 */
public class ProductAction extends ActionSupport implements ModelDriven<Product>{
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
		//接收 uservisit查询所返回 的对象
		private Uservisit uservisitShow ;
		public void setUservisitShow(Uservisit uservisitShow) {
			this.uservisitShow = uservisitShow;
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
			
			
			/**
			 * 对uservisit表进行更新操作，首先先取得数据
			 */
			
			if((User)ServletActionContext.getRequest().getSession().getAttribute("existUser")==null){
				return "findByPid";
			}
			user = (User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
			//System.out.println(user.getUid()+"===================================");
			Integer existUserid = user.getUid();
			String visitpid = product.getPid().toString();		
			System.out.println(existUserid+"----"+visitpid);			//【这是输出得到的值】
		
			Uservisit uservisit = new Uservisit();
			uservisit.setUvuserid(existUserid);
			uservisit.setUvusername(user.getName());
			uservisit.setVisitpid(visitpid+",");
			/**
			 *	先把 uservisit 存入数据库  
			 */
			
			Uservisit obj = productService.getObj(uservisit.getUvuserid());
			if(obj==null){
				productService.saveUservisit(uservisit);
			}//插入数据成功
			/**
			 * 取出数据来
			 */
			
			Uservisit obj2 = productService.getObj(uservisit.getUvuserid());
			String charValue = obj2.getVisitpid();
			if(charValue!=null){
				String arrs[] = charValue.split(",");
				List<String> asList = Arrays.asList(arrs);
				if(!asList.contains(visitpid)){
					obj2.setVisitpid(obj2.getVisitpid()+""+visitpid+",");
					productService.updateLog(obj2);
				}
			}else{
				//出现了null+ visitpid 得过滤掉null
				
				obj2.setVisitpid(obj2.getVisitpid()+""+visitpid+",");
				String filter = obj2.getVisitpid()+""+visitpid+",";
				if(filter.substring(0, 4)=="null"){
					filter.substring(4);
					obj2.setVisitpid(filter);
				}
				productService.updateLog(obj2);
			}
			
			
		
			
				Record record = productService.getCsCount(product.getCategorySecond().getCsid(),user.getUid());
				record.setCsidvisit(record.getCsidvisit()+1);
				productService.saveCsidVisit(record);
			
			
			/**
			 * 下边出现了问题
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
				
				//4、调用了算法类，返回List<Similar>对象。【应该有两条数据，大小为2，进行测试验证】
				List<Similar> similarList = Arithmetic.getSimilar(uidRecordList, otherUidRecordList,otherUidIntegerList.size());
				System.out.println(similarList.size());
				System.out.println(similarList.get(0).getSimilarvalue()+"这是"+similarList.get(0).getRefuid()+"和当前对象的相似度的值");
				System.out.println(similarList.get(1).getSimilarvalue()+"这是"+similarList.get(1).getRefuid()+"和当前对象的相似度的值");
				System.out.println("得到用户之间的相似度之后，要往similar表中插入的值的个数为"+similarList.size());
				for(int i=0;i<similarList.size();i++){
					System.out.println(similarList.get(i).getSimilarvalue());
				}//最后一次循环除了NaN 说明算法出了问题
				
				
				/**
				 * 用户之间的相似度的值成功得到，那么就得往Similar中存取记录
				 */
				
				
				/**
				 * 直接再表里边修改前两条记录，插入后5条记录 此时前两条记录不为空，后5条记录为0，这是登录后创建好的
				 * 试试能不能saveorupdate
				 */
				
				
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
						similar.setSimilarvalue(similarList.get(i).getSimilarvalue());		//最后一次循环除了NaN？？？？
						productService.updateSimilar(similar);
					}
					
				}
			
				
				
			
			return "findByPid";
		}

		private static String searchpname;
		
		
	

		public static String getSearchpname() {
			return searchpname;
		}

		public static void setSearchpname(String searchpname) {
			ProductAction.searchpname = searchpname;
		}

		//根据pname进行搜索
		public String searchform() throws UnsupportedEncodingException{
			searchpname =URLDecoder.decode( ServletActionContext.getRequest().getParameter("searchpname"),"utf-8");	//第一次取值时，正确得到了该值
			//page = (Integer) ServletActionContext.getRequest().getSession().getAttribute("page");
			
			PageBean<Product> pageBeanSearch = productService.findByPageSearchPname(searchpname, page);
			
			
			ServletActionContext.getRequest().getSession().setAttribute("searchpname", searchpname);		//jsp可以从session中取得该值
		//	ServletActionContext.getRequest().getSession().setAttribute("pageBeanSearch", pageBeanSearch);
			ActionContext.getContext().getValueStack().set("pageBeanSearch", pageBeanSearch);		//真正起作用，用户图片显示
		//	ActionContext.getContext().getValueStack().set("searchpname", searchpname);
			return "findBySearchPname";
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
