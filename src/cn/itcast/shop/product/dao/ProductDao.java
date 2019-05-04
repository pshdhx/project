package cn.itcast.shop.product.dao;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.product.vo.Product;
import cn.itcast.shop.user.vo.User;
import cn.itcast.shop.uservisit.vo.Record;
import cn.itcast.shop.uservisit.vo.Similar;
import cn.itcast.shop.uservisit.vo.Uservisit;
import cn.itcast.shop.utils.PageHibernateCallback;

public class ProductDao extends HibernateDaoSupport{

	// 首页上热门商品查询
	public List<Product> findHot() {
		// 使用离线条件查询.
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		// 查询热门的商品,条件就是is_host = 1
		criteria.add(Restrictions.eq("is_hot", 1));
		// 倒序排序输出:
		criteria.addOrder(Order.desc("pdate"));
		// 执行查询:
		List<Product> list = this.getHibernateTemplate().findByCriteria(
				criteria, 0, 10);
		return list;
	}
	
	
	
	

	// 首页上最新商品的查询
	public List<Product> findNew() {
		// 使用离线条件查询:
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		// 按日期进行倒序排序:
		criteria.addOrder(Order.asc("pdate"));
		// 执行查询:
		List<Product> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}
	
	
	
	// 根据商品ID查询商品
	public Product findByPid(Integer pid) {
		return this.getHibernateTemplate().get(Product.class, pid);
	}
	
	
	

	// 根据分类id查询商品的个数
	public int findCountCid(Integer cid) {
		String hql = "select count(*) from Product p where p.categorySecond.category.cid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql,cid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	// 根据分类id查询商品的集合
	public List<Product> findByPageCid(Integer cid, int begin, int limit) {
		// select p.* from category c,categorysecond cs,product p where c.cid = cs.cid and cs.csid = p.csid and c.cid = 2
		// select p from Category c,CategorySecond cs,Product p where c.cid = cs.category.cid and cs.csid = p.categorySecond.csid and c.cid = ?
		String hql = "select p from Product p join p.categorySecond cs join cs.category c where c.cid = ?";
		// 分页另一种写法:
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{cid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
		
	}

	// 根据二级分类查询商品个数
	public int findCountCsid(Integer csid) {
		String hql = "select count(*) from Product p where p.categorySecond.csid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, csid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	// 根据二级分类查询商品信息
	public List<Product> findByPageCsid(Integer csid, int begin, int limit) {
		String hql = "select p from Product p join p.categorySecond cs where cs.csid = ?";
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{csid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	// 后台统计商品个数的方法
	public int findCount() {
		String hql = "select count(*) from Product";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	// 后台查询所有商品的方法
	public List<Product> findByPage(int begin, int limit) {
		String hql = "from Product order by pdate desc";
		List<Product> list =  this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, null, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}





	public void save(Product product) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(product);
	}





	public void delete(Product product) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(product);
	}





	public void update(Product product) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(product);
	}



	
	/**
	 * 执行+1更新操作
	 * @param product
	 */
	public void updatePvisitCount(Product product) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(product);
	}




	/**
	 * 往uservisit表里边添加数据【从action->service->dao】
	 * @param uservisit
	 */
	public void updateUV(Uservisit uservisit) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(uservisit);
	}
	
	
	
	
	/**
	 * 从uservisit表里边取出数据【从dao->service->action】,返回值是一个Uservisit对象
	 */
	/*public Uservisit getObj(Integer uvuserid){
		//String hql = "from uservisit where uvuserid  = ?";
		List<Uservisit> uvList = this.getHibernateTemplate().find(hql, uvuserid);
		if(uvList !=null && uvList.size()>0){
			return uvList.get(0);
		}
		return null;
		return this.getHibernateTemplate().get(Uservisit.class, uvuserid);
	}*/
	public Uservisit getObj(Integer uvuserid){
		//return this.getHibernateTemplate().get(Uservisit.class);
		//return (Uservisit) this.getHibernateTemplate().find("from Uservisit where uvuserid = ?", 14);
		String hql = "from Uservisit where uvuserid  = ?";
		List<Uservisit> uvList = this.getHibernateTemplate().find(hql, uvuserid);
		if(uvList !=null && uvList.size()>0){
			return uvList.get(0);
		}
		return null;
	}





	public void updateLog(Uservisit obj) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(obj);
	}





	/*public Record getCsCount(Integer csid) {
		String hql ="from Record where csid = ?";
		List<Record> list  = this.getHibernateTemplate().find(hql, csid);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}*/





	public void saveCsidVisit(Record record) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(record);
	}





	public Record getCsCount(Integer csid, Integer uid) {
		String hql ="from Record where csid = ? and uid = ?";
		List<Record> list  = this.getHibernateTemplate().find(hql, csid,uid);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}





	public List<Record> findByRecordUid(Integer uid) {
		// TODO Auto-generated method stub
		String hql = "from Record where uid = ?";
		List<Record> existUserList = this.getHibernateTemplate().find(hql, uid);
		return existUserList;
	}





	public List<Record> findByRecordOtherUid(Integer uid) {
		// TODO Auto-generated method stub
		String hql = "from Record where uid != ?";
		List<Record> otherUidRecord = this.getHibernateTemplate().find(hql, uid);
		return otherUidRecord;
	}





	public List<Integer> findOtherUidByUid(Integer uid) {
		// TODO Auto-generated method stub
		String hql = "select distinct(uid) from Record where uid != ?";
		List<Integer> otherUidRecord = this.getHibernateTemplate().find(hql, uid);
		return otherUidRecord;
	}





	public List<Similar> findSimilar(Integer uid) {
		// TODO Auto-generated method stub
		List<Similar> list = this.getHibernateTemplate().find("from Similar where uid = ?", uid);
		if(list!=null && list.size()>0){
			return list;
		}
		return null;
	}





	public void saveSimilar(Similar similar) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(similar);
	}





	public void updateSimilar(Similar similar) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(similar);
	}





	public List<Long> getCsid() {
		// TODO Auto-generated method stub
		List<Long> list = this.getHibernateTemplate().find("select distinct(csid) from Product");
		return list;
	}





/*	public List<Product> findBySearchPname(String searchPname) {
		// TODO Auto-generated method stub
		String hql = "from  Product p where p.pname  like ?";
		List<Product> searchProductList = this.getHibernateTemplate().find(hql,"%"+searchPname+"%");
		return searchProductList;
	}
*/




	public List<Product> findByPageSearchPname(String searchPname, int begin,
			int limit) {
		String hql = "from  Product p where p.pname  like ?";
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{"%"+searchPname+"%"}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		//System.out.println("模糊查询的大小为"+list.size());
		return null;
		
	}





	public int findCountSearchProduct(String searchPname) {
		String hql = "from  Product p where p.pname  like ?";
		List<Product> searchProductList = this.getHibernateTemplate().find(hql,"%"+searchPname+"%");
		System.out.println("搜索：==============="+searchPname);
		System.out.println("模糊查询的大小为"+searchProductList.size());
		return searchProductList.size();
	}





	public void saveUservisit(Uservisit uservisit) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(uservisit);
	}





	public List<Uservisit> getVisitpid(Integer uid) {
		// TODO Auto-generated method stub
		List<Uservisit> list = this.getHibernateTemplate().find("from Uservisit where uvuid = ?", uid);
		return list;
	}


	/**
	 * 首页上推荐的商品的查询
	 * 
	 */
	/*public List<Product> findRefuid(){
		String hql1 = "select max(similarvalue) from  Similar";
		 List<Double> maxValue = this.getHibernateTemplate().find(hql1);
		 System.out.println(maxValue.get(0)+"====max");
		 String hql2 = "from Similar where similarvalue = ?";
		 List<Similar> similarList = this.getHibernateTemplate().find(hql2, maxValue.get(0));	//返回的是一行sililar对象
		 //得到用户相似度最大的refuid 为 similarList.get(0).getRefuid();
		 String hql3 = "select csid from Record where uid = ?" +				//为similarList.get(0).getRefuid();
		 		" and csid in(select csid from Record where uid = ? " +		//为当前用户的ID
		 		"and csidvisit =0) and csidvisit !=0";
		 User user = (User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
		 List<Record> recordList = this.getHibernateTemplate().find(hql3, similarList.get(0).getRefuid(),user.getUid());
		 recordList.get(0).getCsid();
		 String hql4 = "select * from product where csid = ? order by pvisitcount desc limit 0,5";
		 List<Product> productList  = this.getHibernateTemplate().find(hql4,recordList.get(0).getCsid());
		 return productList;
		 //返回的是一系列的csid位于Record表的
		 // (User)ServletActionContext.getRequest().getSession().getAttribute("existUser").getUid()
	}*/
	


	/*public void updateSimilar(Double similarvalue, Integer uid, Integer refuid) {
		// TODO Auto-generated method stub
		String hql = "update Similar set similarvalue =? where uid = ? and refuid = ?";
		//this.getHibernateTemplate().find(queryString, value);
		//this.getHibernateTemplate().update(hql, entity)
		
	}*/





	



	/**
	 * 判断Similar表中是否有该uid的记录
	 * @param uid
	 */
	/*public Similar findSimilar(Integer uid) {
		// TODO Auto-generated method stub
		String hql = "from Similar where uid = ?";
		List<Similar> list = this.getHibernateTemplate().find(hql, uid);
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}





	public void saveSimilar(Similar similar) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(similar);
	}*/




/*
	public void updaSimilar(Similar similar) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(similar);
	}
*/



	/**
	 * 记录或者更新Similar数据表的值
	 * @param similar
	 */
	/*public void updateSimilar(Similar similar) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(similar);
	}*/
}
