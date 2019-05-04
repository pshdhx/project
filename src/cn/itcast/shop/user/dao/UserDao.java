package cn.itcast.shop.user.dao;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.product.vo.Product;
import cn.itcast.shop.user.vo.User;
import cn.itcast.shop.uservisit.vo.Record;
import cn.itcast.shop.uservisit.vo.Similar;
import cn.itcast.shop.uservisit.vo.Uservisit;

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

		public Uservisit findByUvuserid(int i) {
			// TODO Auto-generated method stub
			String hql = "from Uservisit where uvuserid = ?";
			List<Uservisit> list = this.getHibernateTemplate().find(hql, i);
			if (list != null && list.size() > 0) {
				return list.get(0);
			}
			return null;
		}

		public Uservisit findByActuralUvuserid(Integer uid) {
			// TODO Auto-generated method stub
			String hql = "from Uservisit where uvuserid = ?";
			List<Uservisit> list = this.getHibernateTemplate().find(hql, uid);
			if (list != null && list.size() > 0) {
				return list.get(0);
			}
			return null;
		}

		public void saveUservisit(Uservisit uservisit) {
			// TODO Auto-generated method stub
			this.getHibernateTemplate().saveOrUpdate(uservisit);
		}

		public Record findByRUid(Integer uid) {
			// TODO Auto-generated method stub
			String hql = "from Record where uid = ?";
			List<Record> list = this.getHibernateTemplate().find(hql, uid);
			if (list != null && list.size() > 0) {
				return list.get(0);
			}
			return null;
		}
		/**
		 * 记录csid的总的个数 40
		 * @return
		 */
		public int findCount() {
			String hql = "select count(*) from CategorySecond";
			List<Long> list = this.getHibernateTemplate().find(hql);
			if(list != null && list.size() > 0){
				return list.get(0).intValue();
			}
			return 0;
		}

		public void saveRecord(Record saveRecord) {
			// TODO Auto-generated method stub
			this.getHibernateTemplate().save(saveRecord);
		}

		public List<Record> finReByUid(Integer uid) {
			// TODO Auto-generated method stub
			String hql = "from Record where uid = ?";
			List<Record> lrList = this.getHibernateTemplate().find(hql, uid);
			return lrList;
		}
		
		public List<Similar> findSimilarvalueByUid(Integer uid) {
			// TODO Auto-generated method stub
			List<Similar> list  = this.getHibernateTemplate().find("from Similar where uid = ?", uid);
			return list;
		}

		public void findTargetCsid(Integer refuid) {
			// TODO Auto-generated method stub
			String hql1 = "select max(csidvisit) from Record where uid = ?";
			String hql2 = "from Record where ";
		}

		public List<Record> getRecordList(Integer refuid,Integer existUserId) {
			// TODO Auto-generated method stub
			String hql = "from Record where uid = ? and csid in (select csid from Record where uid = ? and csidvisit = 0) and csidvisit !=0";
			List<Record> list = this.getHibernateTemplate().find(hql,refuid,existUserId);
			return list;
		}

		public List<Product> getTopNProduct(Integer csid) {
			// TODO Auto-generated method stub
			//String hql = " from Product where csid = ? order by pvisitcount desc limit 0,5";
			
			String sql = "select * from Product where csid = ? order by pvisitcount desc limit 0 ,5";
			Query query = null;
			query = this.getSession().createSQLQuery(sql).addEntity(Product.class);
			query.setInteger(0, csid);
			List<Product> list = query.list();
			//List<Product> list = this.getHibernateTemplate().find(hql,csid);
			return list;
		}

		public List<Record> getMaxCsidInRecordByCsidvisit(Integer uid) {
			// TODO Auto-generated method stub
			List<Record> list = this.getHibernateTemplate().find("from Record where uid = ? and csid in (select csid  from Record where uid = ? order by csidvisit desc limit 0,2)",uid,uid);
			return list;
		}
		/**
		 * 查询在record表中有多少个不同uid的记录
		 */
		public Integer getUserCount() {
			// TODO Auto-generated method stub
			String hql = "select count(distinct uid) from Record";
			//List<Integer> list = this.getHibernateTemplate().find(hql);
			 List<Long> list= this.getHibernateTemplate().find(hql);
			return list.get(0).intValue();
		}
		/**
		 *  判断登录用户的uid是否在similar表里边
		 * @param uid
		 */
		public List<Similar> existSimilarByUid(Integer uid) {
			// TODO Auto-generated method stub
			List<Similar> list  = this.getHibernateTemplate().find("from Similar where uid = ?",uid);
			return list;
		}
		/**
		 * 取出取出Record其他uid的值作为refuid
		 * @param uid
		 */
		public List<Integer> getOtherUidRecord(Integer uid) {
			// TODO Auto-generated method stub
			List<Integer> list = this.getHibernateTemplate().find("select distinct uid from Record where uid != ?", uid);
			return list;
		}
		/**
		 * 添加保存初始化的Similar记录
		 * @param similar
		 */
		public void initSimilar(Similar similar) {
			// TODO Auto-generated method stub
			this.getHibernateTemplate().save(similar);
		}

		public List<Integer> getRefuid(Integer uid) {
			// TODO Auto-generated method stub
			List<Integer> list = this.getHibernateTemplate().find("select refuid from Similar where uid = ?", uid);
			return list;
		}

		public List<Integer> getAddRef(Integer uid) {
			// TODO Auto-generated method stub
			List<Integer> list = this.getHibernateTemplate().find("select distinct (uid) from Record where uid not in (select refuid from Similar where uid = ?) and uid !=?", uid,uid);
			return list;
		}

		public List<Record> geNullProduct(Integer refuid) {
			// TODO Auto-generated method stub
			List<Record> list = this.getHibernateTemplate().find(" from Record  where uid = ? and csidvisit = (select max(csidvisit) from Record where uid = ?)", refuid,refuid);
			/*String sql = "select * from Product where csid = ? order by pvisitcount desc limit 0 ,5";
			List<Product> recommenProductList = this.getHibernateTemplate().find(sql, list.get(0));*/
			return list;
			
		}

		public List<Product> getRecommendProductList(Integer csid) {
			String sql = "select * from Product where csid = ? order by pvisitcount desc limit 0 ,5";
			Query query = null;
			query = this.getSession().createSQLQuery(sql).addEntity(Product.class);
			query.setInteger(0, csid);
			List<Product> list = query.list();
			//List<Product> list = this.getHibernateTemplate().find(hql,csid);
			return list;
		}

		public List<Product> getMaxHit() {
			String sql = "select * from Product  order by pvisitcount desc limit 0 ,5";
			Query query = null;
			query = this.getSession().createSQLQuery(sql).addEntity(Product.class);
			List<Product> list = query.list();
			//List<Product> list = this.getHibernateTemplate().find(hql,csid);
			return list;
		}

		

		
		
		
}
