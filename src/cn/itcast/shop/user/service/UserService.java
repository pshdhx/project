package cn.itcast.shop.user.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.product.vo.Product;
import cn.itcast.shop.user.dao.UserDao;
import cn.itcast.shop.user.vo.User;
import cn.itcast.shop.uservisit.vo.Record;
import cn.itcast.shop.uservisit.vo.Similar;
import cn.itcast.shop.uservisit.vo.Uservisit;
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

	public Uservisit findByUvuserid(int i) {
		return userDao.findByUvuserid(i);
	}

	public Uservisit findByActuralUvuserid(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.findByActuralUvuserid(uid);
	}

	public void saveUservisit(Uservisit uservisit) {
		// TODO Auto-generated method stub
		userDao.saveUservisit(uservisit);
	}

	public Record findByRUid(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.findByRUid(uid);
	}

	public int findCount() {
		// TODO Auto-generated method stub
		return userDao.findCount();
	}

	public void saveRecord(Record saveRecord) {
		// TODO Auto-generated method stub
		userDao.saveRecord(saveRecord);
	}

	public List<Record> findReByUid(Integer uid) {
		return userDao.finReByUid(uid);
	}

	
	//判断similar表中是否有similarvalue的值
	public List<Similar> findSimilarvalueByUid(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.findSimilarvalueByUid(uid);
	}

	public List<Record> getRecordList(Integer refuid,Integer existUserId) {
		// TODO Auto-generated method stub
		return userDao.getRecordList(refuid,existUserId);
	}

	public List<Product> getTopNProduct(Integer csid) {
		// TODO Auto-generated method stub
		return userDao.getTopNProduct(csid);
	}

	public List<Record> getMaxCsidInRecordByCsidvisit(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.getMaxCsidInRecordByCsidvisit(uid);
	}
	
	/**
	 * 查询在Record表中有多少个不同uid的记录
	 */
	public Integer getUserCount() {
		// TODO Auto-generated method stub
		return userDao.getUserCount();
	}
	/**
	 * 判断登录用户的uid是否在similar表里边
	 * @param uid
	 */
	public List<Similar> existSimilarByUid(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.existSimilarByUid(uid);
	}
	/**
	 * 取出Record其他uid的值作为refuid
	 * @param uid
	 */
	public List<Integer> getOtherUidRecord(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.getOtherUidRecord(uid);
	}
	/**
	 * 添加保存初始化的Similar记录
	 * @param similar
	 */
	public void initSimilar(Similar similar) {
		// TODO Auto-generated method stub
		userDao.initSimilar(similar);
	}

	public List<Integer> getRefuid(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.getRefuid(uid);
	}

	public List<Integer> getAddRef(Integer uid) {
		// TODO Auto-generated method stub
		return userDao.getAddRef(uid);
	}
	/**
	 * 当目标记录为null时，应该显示的结果为 相似度最大的用户的csid的最大值
	 * @param refuid
	 */
	public List<Record> getNullProduct(Integer refuid) {
		// TODO Auto-generated method stub
		return userDao.geNullProduct(refuid);
	}

	public List<Product> getRecommendProductList(Integer csid) {
		// TODO Auto-generated method stub
		return userDao.getRecommendProductList(csid);
	}

	public List<Product> getMaxHit() {
		// TODO Auto-generated method stub
		return userDao.getMaxHit();
	}

	

	
	

	

	
	
	
}
