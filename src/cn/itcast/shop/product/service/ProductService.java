package cn.itcast.shop.product.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.categorysecond.vo.CategorySecond;
import cn.itcast.shop.product.dao.ProductDao;
import cn.itcast.shop.product.vo.Product;
import cn.itcast.shop.uservisit.vo.Record;
import cn.itcast.shop.uservisit.vo.Similar;
import cn.itcast.shop.uservisit.vo.Uservisit;
import cn.itcast.shop.utils.PageBean;
@Transactional
public class ProductService {
	// 注入ProductDao
		private ProductDao productDao;

		public void setProductDao(ProductDao productDao) {
			this.productDao = productDao;
		}

		// 首页上热门商品查询
		public List<Product> findHot() {
			return productDao.findHot();
		}

		// 首页上最新商品的查询
		public List<Product> findNew() {
			return productDao.findNew();
		}

		// 根据商品ID查询商品
		public Product findByPid(Integer pid) {
			return productDao.findByPid(pid);
		}

		// 根据一级分类的cid带有分页查询商品
		public PageBean<Product> findByPageCid(Integer cid, int page) {
			PageBean<Product> pageBean = new PageBean<Product>();
			// 设置当前页数:
			pageBean.setPage(page);
			// 设置每页显示记录数:
			int limit = 8;
			pageBean.setLimit(limit);
			// 设置总记录数:
			int totalCount = 0;
			totalCount = productDao.findCountCid(cid);
			pageBean.setTotalCount(totalCount);
			// 设置总页数:
			int totalPage = 0;
			// Math.ceil(totalCount / limit);
			if (totalCount % limit == 0) {
				totalPage = totalCount / limit;
			} else {
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			// 每页显示的数据集合:
			// 从哪开始:
			int begin = (page - 1) * limit;
			List<Product> list = productDao.findByPageCid(cid, begin, limit);
			pageBean.setList(list);
			return pageBean;
		}

		// 根据二级分类查询商品信息
		public PageBean<Product> findByPageCsid(Integer csid, int page) {
			PageBean<Product> pageBean = new PageBean<Product>();
			// 设置当前页数:
			pageBean.setPage(page);
			// 设置每页显示记录数:
			int limit = 8;
			pageBean.setLimit(limit);
			// 设置总记录数:
			int totalCount = 0;
			totalCount = productDao.findCountCsid(csid);
			pageBean.setTotalCount(totalCount);
			// 设置总页数:
			int totalPage = 0;
			// Math.ceil(totalCount / limit);
			if (totalCount % limit == 0) {
				totalPage = totalCount / limit;
			} else {
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			// 每页显示的数据集合:
			// 从哪开始:
			int begin = (page - 1) * limit;
			List<Product> list = productDao.findByPageCsid(csid, begin, limit);
			pageBean.setList(list);
			return pageBean;
		}

		// 后台查询所有商品带分页
		public PageBean<Product> findByPage(Integer page) {
			PageBean<Product> pageBean = new PageBean<Product>();
			// 设置当前页数:
			pageBean.setPage(page);
			// 设置每页显示记录数:
			int limit = 10;
			pageBean.setLimit(limit);
			// 设置总记录数:
			int totalCount = 0;
			totalCount = productDao.findCount();
			pageBean.setTotalCount(totalCount);
			// 设置总页数:
			int totalPage = 0;
			// Math.ceil(totalCount / limit);
			if (totalCount % limit == 0) {
				totalPage = totalCount / limit;
			} else {
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			// 每页显示的数据集合:
			// 从哪开始:
			int begin = (page - 1) * limit;
			List<Product> list = productDao.findByPage(begin, limit);
			pageBean.setList(list);
			return pageBean;
		}

		public void save(Product product) {
			// TODO Auto-generated method stub
			productDao.save(product);
		}

		public void delete(Product product) {
			// TODO Auto-generated method stub
			productDao.delete(product);
		}

		public void update(Product product) {
			// TODO Auto-generated method stub
			productDao.update(product);
		}
		/**
		 * 更新+1操作
		 * @param product
		 */
		public void updatePvisitCount(Product product) {
			// TODO Auto-generated method stub
			productDao.updatePvisitCount(product);
		}
		/**
		 * 执行往uservisit表里添加操作
		 * @param uservisit
		 */
		public void updateUV(Uservisit uservisit) {
			// TODO Auto-generated method stub
			productDao.updateUV(uservisit);
		}

		/**
		 * 执行从uservisit表里取出 obj对象数据
		 */
		public Uservisit getObj(Integer uvuserid){
			return productDao.getObj(uvuserid);
		}
		/*public Uservisit getObj(){
			return productDao.getObj();
		}*/

		public void updateLog(Uservisit obj) {
			// TODO Auto-generated method stub
			productDao.updateLog(obj);
		}

		/*public Record getCsCount(Integer csid) {
			return productDao.getCsCount(csid);
		}*/

		public void saveCsidVisit(Record record) {
			// TODO Auto-generated method stub
			productDao.saveCsidVisit(record);
		}

		public Record getCsCount(Integer csid, Integer uid) {
			// TODO Auto-generated method stub
			return productDao.getCsCount(csid,uid);
		}

		public List<Record> findByRecordUid(Integer uid) {
			// TODO Auto-generated method stub
			return productDao.findByRecordUid(uid);
		}

		public List<Record> findByRecordOtherUid(Integer uid) {
			// TODO Auto-generated method stub
			return productDao.findByRecordOtherUid(uid);
		}

		public List<Integer> findOtherUidByUid(Integer uid) {
			// TODO Auto-generated method stub
			return productDao.findOtherUidByUid(uid);
		}
		/**
		 * 判断similar表中是否有该uid的记录
		 * @param uid
		 */
		/*public Similar findSimilar(Integer uid) {
			// TODO Auto-generated method stub
			return productDao.findSimilar(uid);
		}
*/
		/*public void saveSimilar(Similar similar) {
			// TODO Auto-generated method stub
			productDao.saveSimilar(similar);
		}

		public void updeSimilar(Similar similar) {
			// TODO Auto-generated method stub
			productDao.updaSimilar(similar);
		}*/

		public List<Similar> findSimilar(Integer uid) {
			// TODO Auto-generated method stub
			return productDao.findSimilar(uid);
		}

		public void saveSimilar(Similar similar) {
			// TODO Auto-generated method stub
			productDao.saveSimilar(similar);
		}

		public void updateSimilar(Similar similar) {
			// TODO Auto-generated method stub
			productDao.updateSimilar(similar);
		}
		/**
		 * 取出csid
		 */
		public List<Long> getCsid() {
			// TODO Auto-generated method stub
			return productDao.getCsid();
		}
		/**
		 * 搜索
		 * @param searchPname
		 */
	/*	public List<Product> findBySearchPname(String searchPname) {
			// TODO Auto-generated method stub
			return productDao.findBySearchPname(searchPname);
		}*/

		public PageBean<Product> findByPageSearchPname(String searchPname,
				int page) {
			PageBean<Product> pageBean = new PageBean<Product>();
			// 设置当前页数:
			pageBean.setPage(page);
			// 设置每页显示记录数:
			int limit = 8;
			pageBean.setLimit(limit);
			// 设置总记录数:
			int totalCount = 0;
			totalCount = productDao.findCountSearchProduct(searchPname);
			pageBean.setTotalCount(totalCount);
			// 设置总页数:
			int totalPage = 0;
			// Math.ceil(totalCount / limit);
			if (totalCount % limit == 0) {
				totalPage = totalCount / limit;
			} else {
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			// 每页显示的数据集合:
			// 从哪开始:
			int begin = (page - 1) * limit;
			List<Product> list = productDao.findByPageSearchPname(searchPname, begin, limit);
			pageBean.setList(list);
			return pageBean;
		}

		public void saveUservisit(Uservisit uservisit) {
			// TODO Auto-generated method stub
			productDao.saveUservisit(uservisit);
		}

		public List<Uservisit> getVisitpid(Integer uid) {
			// TODO Auto-generated method stub
			return productDao.getVisitpid(uid);
		}

		/*public void upteSimilar(Double similarvalue, Integer uid, Integer refuid) {
			// TODO Auto-generated method stub
			productDao.updateSimilar(similarvalue,uid,refuid);
		}*/

		

		/*public void updateSimilar(Similar similar) {
			// TODO Auto-generated method stub
			productDao.updateSimilar(similar);
		}*/
		/*public List<Product> findRefUid(){
			return productDao.findRefuid();
		}
*/
		
}
