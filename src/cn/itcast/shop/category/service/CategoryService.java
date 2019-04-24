package cn.itcast.shop.category.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.category.dao.CategoryDao;
import cn.itcast.shop.category.vo.Category;
@Transactional
public class CategoryService {
	//service注入dao
	private CategoryDao categoryDao;
	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	public List<Category> findAll() {
		return categoryDao.findAll();
	}
	// 业务层保存一级分类的操作
		public void save(Category category) {
			categoryDao.save(category);
		}

		// 业务层根据一级分类id查询一级分类
		public Category findByCid(Integer cid) {
			return categoryDao.findByCid(cid);
		}
		public void delete(Category category) {
			// TODO Auto-generated method stub
			categoryDao.delete(category);
		}
		public void update(Category category) {
			// TODO Auto-generated method stub
			categoryDao.update(category);
		}
}
