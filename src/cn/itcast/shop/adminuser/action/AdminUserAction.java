package cn.itcast.shop.adminuser.action;
/**
 * 1、继承acitonsupport 实现 modelDriven<T>接口
 * 2、对<T>进行实例化而不是初始化，T是action的命名对象的vo类的实例
 * 3、实现模型驱动，返回实例[接收过来的用户名和密码都存放在模型驱动里边]
 * 4、注入service，对其提供set方法，方便使用service.Method();
 * 5、在service中注入dao，并且进行事物化，@transaction ,提供set方法，方便使用dao.Method();
 * 6、在dao中继承HibernateDaoSupport类
 * 7、在spring中进行 action dao service 的 id  class scope property的配置
 * 8、根据页面的action路径对struts进行action的配置 name class method result+方法名+路径,至此，配置完成。
 * 
 * 
 * 1、进行action的方法的配置 类型为String 返回值配置到struts中
 * 2、使用vo对象接收提交的对象，网页只提交了用户名和密码两个参数
 * 3、提交到service层，在提交到dao层
 * 4、在dao层 用hql【from 表 where 参数1=？and参数2=？】
 * 			进行数据库的查询 this.gethibernatetemplate.find/execute(hql,提交的参数1，提交的参数2);
 * 5、hibernate查询返回的是list集合，返回list.get(0)得到对象，至此action方法中得到了对象
 * 6、对action方法中得到的对象进行判断,登陆成功建立session存起来
 * 				ServletActionContext.getRequest().getSession().setAttribute("existAdminUser",existAdminUser);
 * 7、如此，在登录后的主页中就可以使用<s:property value="#session.existAdminUser.username"/>的用户名value了
 */
import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.adminuser.service.AdminUserService;
import cn.itcast.shop.adminuser.vo.AdminUser;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser>{
	//模型驱动使用的对象 
	private AdminUser adminUser = new AdminUser();
	public AdminUser getModel() {
		
		return adminUser;
	}
	private AdminUserService adminUserService;
	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}
	public String login(){
		AdminUser existAdminUser = adminUserService.login(adminUser);		//用AdminUser进行接收
		if(existAdminUser==null){
			this.addActionError("用户名和密码登陆错误");
			return "loginFail";
		}else{
			//登陆成功，把后台用户登陆成功的信息用session存起来
			ServletActionContext.getRequest().getSession().setAttribute("existAdminUser",existAdminUser);
		}
		return "loginSuccess";
	}
}
