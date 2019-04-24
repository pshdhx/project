package cn.itcast.shop.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.user.service.UserService;
import cn.itcast.shop.user.vo.User;

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
	
	//接受验证码
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public String registPage(){
		return "registPage";
	}
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
			// 页面跳转
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
