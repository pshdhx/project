package cn.itcast.shop.category.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.category.vo.Category;

public class CategoryDao extends HibernateDaoSupport{

	//DAO层的查询所有一级分类的方法
		public List<Category> findAll() {
			String hql = "from Category";
			List<Category> list = this.getHibernateTemplate().find(hql);
			return list;
		}

		// Dao中的保存一级分类的方法
		public void save(Category category) {
			this.getHibernateTemplate().save(category);
		}

		// Dao中根据一级分类id查询一级分类
		public Category findByCid(Integer cid) {
			return this.getHibernateTemplate().get(Category.class, cid);
		}

		public void delete(Category category) {
			// TODO Auto-generated method stub
			this.getHibernateTemplate().delete(category);
		}

		public void update(Category category) {
			// TODO Auto-generated method stub
			this.getHibernateTemplate().update(category);
		}

}
