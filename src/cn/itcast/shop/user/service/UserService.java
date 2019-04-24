package cn.itcast.shop.user.service;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.user.dao.UserDao;
import cn.itcast.shop.user.vo.User;
import cn.itcast.shop.utils.MailUtils;
import cn.itcast.shop.utils.UUIDUtil;

/**
 * 用户模块业务层的代码
 * @author Administrator
 *
 */
@Transactional
public class UserService {
	//注入UserDao
	private UserDao userDao;
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	//调用dao层的findbyname方法
	public User findByUsername(String username){
		return userDao.findByUsername(username);
	}

	public void save(User user) {
		// TODO Auto-generated method stub
		user.setState(0);	//0表示用户未激活
		String code = UUIDUtil.getUUID()+UUIDUtil.getUUID();
		user.setCode(code);
		userDao.save(user);
		//发送激活邮件
		MailUtils.sendMail(user.getEmail(), code);
	}

	public User findByCode(String code) {
		// TODO Auto-generated method stub
		return userDao.findByCode(code);
	}
	
	//修改用户状态的方法
	public void update(User exitUser) {
		// TODO Auto-generated method stub
		userDao.update(exitUser);
	}
	//用户登录的方法
	public User login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}
}
