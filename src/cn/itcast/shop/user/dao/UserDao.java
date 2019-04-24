package cn.itcast.shop.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.user.vo.User;

/**
 * 用户模块持久层的代码
 * @author Administrator
 *
 */
public class UserDao extends HibernateDaoSupport {	//继承的好处：直接提供hibernate的模板
	// 按名次查询是否有该用户:
		public User findByUsername(String username) {
			String hql = "from User where username = ?";
			List<User> list = this.getHibernateTemplate().find(hql, username);
			if (list != null && list.size() > 0) {
				return list.get(0);
			}
			return null;
		}

		public void save(User user) {
			// TODO Auto-generated method stub
			this.getHibernateTemplate().save(user);
		}

		public User findByCode(String code) {
			String hql = "from User where code  = ?";
			List<User> list = this.getHibernateTemplate().find(hql,code);
			if (list != null && list.size() > 0) {
				return list.get(0);
			}
			return null;
		}

		public void update(User exitUser) {
			// TODO Auto-generated method stub
			this.getHibernateTemplate().update(exitUser);
		}
		//用户登录的方法
		public User login(User user) {
			// TODO Auto-generated method stub
			String hql = "from User where username = ? and password = ? and state = ?";
			List<User> list = this.getHibernateTemplate().find(hql,user.getUsername(), user.getPassword(), 1);
			if (list != null && list.size() > 0) {
				return list.get(0);
			}
			return null;
		}
}
