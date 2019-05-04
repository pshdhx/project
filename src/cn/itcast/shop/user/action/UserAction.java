package cn.itcast.shop.user.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.product.vo.Product;
import cn.itcast.shop.user.service.UserService;
import cn.itcast.shop.user.vo.User;
import cn.itcast.shop.uservisit.vo.Record;
import cn.itcast.shop.uservisit.vo.Similar;
import cn.itcast.shop.uservisit.vo.Uservisit;
import cn.itcast.shop.utils.Arithmetic;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction  extends ActionSupport implements ModelDriven<User>{
	//模型驱动使用的对象
	private User user = new User();
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	
	
	//注入一个UserService ，提供一个set方法进行调用
	private UserService userService;
	public void setUserService(UserService userService){
		this.userService= userService;
	}
	private ProductService productService;
	
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}



	//接受验证码
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public String registPage(){
		return "registPage";
	}
	/*private Uservisit uv;
	
	public Uservisit getUv() {
		return uv;
	}
	public void setUv(Uservisit uv) {
		this.uv = uv;
	}*/
	public String findByName() throws IOException{
		//调用service进行查询
		User exitUser = userService.findByUsername(user.getUsername());
		//获得response对象，向页面输出
		HttpServletResponse response  = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(exitUser!=null){	//用户名已经存在
			response.getWriter().print("<font color='#ff0000'>用户名已经存在</font>");
		}else{	//用户名不存在，可以使用
			response.getWriter().print("<font color=‘green’>用户名可以使用</font>");
		}
		return NONE;
	}
	public String regist(){
		// 判断验证码程序:
				// 从session中获得验证码的随机值:
				String checkcode1 = (String) ServletActionContext.getRequest()
						.getSession().getAttribute("checkcode");
				if(!checkcode.equalsIgnoreCase(checkcode1)){
					this.addActionError("验证码输入错误!");
					return "checkcodeFail";
				}
				userService.save(user);
				this.addActionMessage("注册成功!请去邮箱激活!");
				/**
				 * 注册时到record表中添加记录
				 */
				/*List<Long> csidList = productService.getCsid();
				for(int i=0;i<csidList.size();i++){
					userService.addRecord(user.getUid(),csidList.get(i));
				}*/
				
				
				
				return "msg";
	}
	/**
	 * 用户激活的方法
	 */
	public String active(){
		//根据激活码查询用户
		User exitUser = userService.findByCode(user.getCode());
		if(exitUser==null ){
			this.addActionMessage("激活失败：激活码错误或者过期");
		}else{
			//修改用户状态
			exitUser.setState(1);
			exitUser.setCode(null);
			userService.update(exitUser);
			this.addActionMessage("激活成功!!!");
		}
		return "msg";
	}
	
	/**
	 * 跳转到登录页面
	 * 
	 */
	public String loginPage(){
		return "loginPage";
	}
	/**
	 * 进行用户登录操作[进行用户名 密码 状态的查询]
	 */
	
	public String login(){
		String checkcode1 = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("checkcode");
		if(!checkcode.equalsIgnoreCase(checkcode1)){
			this.addActionError("验证码输入错误!");
			/**
			 * 可以插入到record表里边
			 */
			
			return "checkcodeFailLogin";
		}
		
		User existUser = userService.login(user);
		// 判断
		if (existUser == null) {
			// 登录失败
			this.addActionError("登录失败:用户名或密码错误或用户未激活!");
			return LOGIN;
		} else {
			// 登录成功
			// 将用户的信息存入到session中
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			/**
			 * 用户进行登录之后，就有了浏览记录，此时应该往uservisit表里添加数据，每次登录不能进行每次添加记录，所以进行判断
			 */
			
		/*	//1、首先判断表里有没有记录，避免空指针，先传递测试值
			Uservisit uservisit = userService.findByUvuserid(14);
			if(uservisit!=null){
				System.out.println("======================用户记录已经存在============================================");
				System.out.println("======================"+uservisit.getUvusername()+"==============================");
			}else{
				System.out.println("======================用户记录不存在==============================================");
			}【正常运行】
			
			//2、下面用session中的用户的id进行测试
			
			Uservisit uservisit = userService.findByActuralUvuserid(existUser.getUid());
			if(uservisit!=null){
				System.out.println("======================用户记录已经存在============================================");
				System.out.println("======================"+uservisit.getUvusername()+"==============================");
			}else{
				System.out.println("======================用户记录不存在==============================================");
				//3、需要对数据库进行记录添加
				
				Uservisit saveUservisit = new Uservisit();
				saveUservisit.setUvuserid(existUser.getUid());
				saveUservisit.setUvusername(existUser.getUsername());
				saveUservisit.setVisitpid("");
				userService.saveUservisit(saveUservisit);
				
			}	//【正常运行】
			
			*/
			
			/**
			 * //在登录的同时，进行了record表的初始化
			 */
			//用户登录需要往record表里边插入数据,先判断该表有没有用户的记录
			Record record = userService.findByRUid(existUser.getUid());
			
			if(record!=null){
				System.out.println("================用户已经存在"+existUser.getUsername());
			}else{
				System.out.println("=================用户不存在"+existUser.getUsername());
				//需要对数据库进行添加 36行的记录
				//先传回csid的总的个数
				int csidcount = 0;
				csidcount = userService.findCount();
				System.out.println(csidcount);
				//然后进行添加操作了  uid  csid
				Record saveRecord = new Record();
				for(int i=1;i<=csidcount;i++){
					saveRecord.setCsid(i);
					saveRecord.setUid(existUser.getUid());
					saveRecord.setCsidvisit(0);
					userService.saveRecord(saveRecord);
				}
			}//[record记录插入成功]
			
			
			
	
				
				/**
				 * 对similar表进行初始化
				 * 1、先得到其他的refid的个数，这就是循环添加的次数
				 * 2、但是之前添加过的uid，如果全部循环执行，造成了行数的冗余
				 * 3、通过uid=18 refuid=23 和 = 14的两行记录，如果之前表中的refuid有了18的记录，找到对应的ui=14，则不执行uid=18 refuid=14的添加操作。
				 */
				//1、先查询在record表中有多少个uid
				Integer userCountRecord = userService.getUserCount();
				System.out.println("record表中不同的uid个数为"+userCountRecord);
				//2、查询uid是否在similar里边
				List<Similar> existUidList = userService.existSimilarByUid(existUser.getUid());
				//3、取出其他的uid作为refuid
				List<Integer> otherUidRecordList = userService.getOtherUidRecord(existUser.getUid());
				System.out.println("record的非当前的uid的个数为"+otherUidRecordList.size());
				
				/**
				 * 这一部分有问题，因为每个新登录的用户登录之后，产生了uid为登录用户的记录，条数为新的条数，但是以前登录的用户的条数不变了【所以是判断有问题】
				 * 0 应该改为 非当前用户的个数
				 */
				
				if(existUidList.size()==0){
					//3、进行similar表的初始化
					for(int i=0;i<userCountRecord-1;i++){
						Similar similar = new Similar();
						similar.setUid(existUser.getUid());
						//取出其他的uid作为refuid
						similar.setRefuid(otherUidRecordList.get(i));
						similar.setSimilarvalue(0.0);
						//保存初始化的Record
						userService.initSimilar(similar);
						System.out.println("当前用户对第"+i+"个新用户的相似度的值进行了初始化？？？");
					}
				}//【初始化成功，每次新登录用户之后，进行的初始化】
				
				System.out.println(existUidList.size()+"这是当前用户在similar的记录的条数,"+otherUidRecordList.size()+"这是应该的条数，");
				
				//对老用户和新用户之间的相似度进行初始化
				if(existUidList.size()!=otherUidRecordList.size()){
					//从这里返回addcount = 其他用户的记录数<Record> - 当前用户的条数<Similar>
					/*System.out.println(existUidList.get(0).getRefuid());
					System.out.println(existUidList.get(1).getRefuid());*/
					//3、进行similar表的初始化 此时需要往里边添加 一条记录 就是 最新登录的用户【可能为好几个】 和 当前用户的相似度记录
					//取出要存取的refuid的记录表 otherUidRecordList.size()-existUidList.size()
					List<Integer> addRefList = userService.getAddRef(existUser.getUid());
					
					
					System.out.println(addRefList.size()+"，这是在siliar表中由于更新登录用户增加的老用户的条数"); //为什么会是0呢
					for(int i=0;i<addRefList.size();i++){
						Similar similar = new Similar();
						similar.setUid(existUser.getUid());
						//取出其他的uid作为refuid
						similar.setRefuid(addRefList.get(i));
						similar.setSimilarvalue(0.0);
						//保存初始化的Record
						userService.initSimilar(similar);
						System.out.println("当前用户对第"+i+"个新用户的相似度的值进行了初始化？？？");
					}
					
					
				}//【初始化完全成功，每次新登录用户之后，在登录之前用户,也可以对之前用户进行初始化操作】
				
				
				
				
				//判断该用户下的 similar表中是否有similarvalue记录。
				List<Similar> existUserSimilarList = userService.findSimilarvalueByUid(existUser.getUid());
				//老用户进行二次登录取出了和新用户的映射记录，但是为与新用户的相似度记录为null/0.0;
				System.out.println("当前用户的第一个similarvalue值为"+existUserSimilarList.get(0).getSimilarvalue());
				if(existUserSimilarList.get(0).getSimilarvalue()!=0.0){		//说明similar有值存在可以进行推荐。
					//得到当前用户下的相似度最大的【几个】refuid
					System.out.println("当前用户的similar表中有 相似度记录。");
					List<Similar> maxSimilarValueList = Arithmetic.getMaxSimilarValue(existUserSimilarList, 1);
					//拿到最大值的refuid 作为参数，查询Record表的记录，方式为查询当前用户csidvisit=0但是refuid不为0的记录表。
					List<Record> targetRecordList = userService.getRecordList(maxSimilarValueList.get(0).getRefuid(),existUser.getUid());
					System.out.println("判断相似度最大的用户的当前用户的csid=0并且refuid用户的csid！=0的记录的条数，应该很大，但是表中缺少数据，所以自定义个测试数据，结果正常测试"+targetRecordList.size());
					/**
					 * 这是出现了数据的错误，检查数据，缺少数据的原因
					 * 但是这里出现了问题，需要进行算法的改进【问题是 当前用户的csid为0的记录，相似度最大的用户的csid的记录也为0，那么就出现了空值】
					 * 【改进：如果为空值，就取值相似度最大用户的csid点击量最大的一行记录】
					 */
					if(targetRecordList.size()!=0){
						if(targetRecordList.get(0).getCsidvisit()!=0){
							System.out.println("相似度最大的用户为"+maxSimilarValueList.get(0).getRefuid() +"当前用户为"+existUser.getUid());//数据正确，那就是hql语句有问题
							//在数据库中进行sql查询，缺少数据的原因，hql没错
							//得到了该【几条】条Record记录的csid，根据csid的值去product表中找到pvisitcount点击量最高的5个值
							System.out.println("需要推荐的csid为"+targetRecordList.get(0).getCsid());
							List<Product> recommendProductList1 = userService.getTopNProduct(targetRecordList.get(0).getCsid());
							
							System.out.println(recommendProductList1.get(0).getPname()+"数量为"+recommendProductList1.get(0).getPvisitcount());
							System.out.println("这是要推荐商品的数量"+recommendProductList1.size());
							ServletActionContext.getRequest().getSession().setAttribute("RecommendProductList", recommendProductList1);
							//ActionContext.getContext().getValueStack().set("recommendList",recommendProductList1);
							System.out.println("把推荐商品列表放入到了session中，用forEach显示商品图片");
							
						}else{
							//找到refuid下csid数量最大的csid两个csidvisit最大的记录 的csid 该list.size()应该=2
							List<Record> maxTopCisdInRecordList = userService.getMaxCsidInRecordByCsidvisit(existUser.getUid());
							List<Product> topNProduct2_1 = userService.getTopNProduct(maxTopCisdInRecordList.get(0).getCsid());
							List<Product> topNProduct2_2 = userService.getTopNProduct(maxTopCisdInRecordList.get(0).getCsid());
							topNProduct2_1.addAll(topNProduct2_2);
							ServletActionContext.getRequest().getSession().setAttribute("recommendProductList2", topNProduct2_1);
						}			
					}else{
						List<Record> targetUser = userService.getNullProduct(maxSimilarValueList.get(0).getRefuid());
						
						System.out.println("结果为空时，csidvisit最大的用户"+","+targetUser.get(0).getUid()+",csid为"+targetUser.get(0).getCsid()+","+"数量为"+targetUser.get(0).getCsidvisit());
						List<Product> recommendProductList = userService.getRecommendProductList(targetUser.get(0).getCsid());
						ServletActionContext.getRequest().getSession().setAttribute("RecommendProductList", recommendProductList);
					}		
				}else{
					/**
					 * 如果用户进行了登录，但是similar表中没有相似度的记录时，即该用户并没有进行浏览操作时，应该返回product的hits数量最大的值
					 */
					List<Product> maxHit = userService.getMaxHit();
					ServletActionContext.getRequest().getSession().setAttribute("RecommendProductList", maxHit);
				}
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			
			
			
			return "loginSuccess";
		}
	}
	
	/**
	 * 用户退出的方法 ，只要action操作销毁session即可
	 */
	public String quit(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
}
