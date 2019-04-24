package cn.itcast.shop.category.vo;

import java.util.HashSet;
import java.util.Set;

import cn.itcast.shop.categorysecond.vo.CategorySecond;

/**
 * 创建一级分类的实体对象
 * @author Administrator
 *
 */
public class Category {
	private String cname;
	private Integer cid;
	//一级分类中应该存放有二级分类的集合
	private Set<CategorySecond> categorySeconds = new HashSet<CategorySecond>();  
	public Set<CategorySecond> getCategorySeconds() {
		return categorySeconds;
	}
	public void setCategorySeconds(Set<CategorySecond> categorySeconds) {
		this.categorySeconds = categorySeconds;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	
}
