package cn.itcast.shop.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.order.vo.Order;
import cn.itcast.shop.order.vo.OrderItem;
import cn.itcast.shop.utils.PageHibernateCallback;

public class OrderDao extends HibernateDaoSupport{

	public void save(Order order) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(order);
	}

	// Dao层查询我的订单分页查询:统计个数
		public int findCountByUid(Integer uid) {
			String hql = "select count(*) from Order o where o.user.uid = ?";
			List<Long> list = this.getHibernateTemplate().find(hql, uid);
			if (list != null && list.size() > 0) {
				return list.get(0).intValue();
			}
			return 0;
		}

		// Dao层查询我的订单分页查询:查询数据
		public List<Order> findPageByUid(Integer uid, int begin, int limit) {
			String hql = "from Order o where o.user.uid = ? order by o.ordertime desc";
			List<Order> list = this.getHibernateTemplate().execute(
					new PageHibernateCallback<Order>(hql, new Object[] { uid },
							begin, limit));
			if (list != null && list.size() > 0) {
				return list;
			}
			return null;
		}

		// DAO层根据订单id查询订单
		public Order findByOid(Integer oid) {
			return this.getHibernateTemplate().get(Order.class, oid);
		}

		public void update(Order currOrder) {
			// TODO Auto-generated method stub
			this.getHibernateTemplate().update(currOrder);
		}

		public List<Order> findByPage(int begin, int limit) {
			String hql = "from Order order by ordertime desc";
			List<Order> list = this.getHibernateTemplate().execute(
					new PageHibernateCallback<Order>(hql, null, begin, limit));
			return list;
		}

		public int findCount() {
			String hql = "select count(*) from Order";
			List<Long> list = this.getHibernateTemplate().find(hql);
			if (list != null && list.size() > 0) {
				return list.get(0).intValue();
			}
			return 0;
		}

		public List<OrderItem> findOrderItem(Integer oid) {
			String hql = "from OrderItem oi where oi.order.oid = ?";
			List<OrderItem> list = this.getHibernateTemplate().find(hql, oid);
			if (list != null && list.size() > 0) {
				return list;
			}
			return null;
		}
	
}
