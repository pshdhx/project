package cn.itcast.shop.category.adminaction;

import java.util.List;

import cn.itcast.shop.category.service.CategoryService;
import cn.itcast.shop.category.vo.Category;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminCategoryAction extends ActionSupport implements ModelDriven<Category>{
	//模型驱动使用的类
	private Category category = new Category();
	public Category getModel() {
		// TODO Auto-generated method stub
		return category;
	}
	private CategoryService categoryService ;
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	//后台执行查询所有的一级分类
	public String findAll(){
		List<Category> cList = categoryService.findAll();//得到一个集合.需要用list显示出来
		ActionContext.getContext().getValueStack().set("cList", cList);		//用值栈显示出来
		return "findAll";
	}
	
	//后台添加一级分类进行保存的方法
	public String save(){
		categoryService.save(category);
		return "saveSuccess";
	}
	//后台删除一级分类的方法
	public String delete(){
		category = categoryService.findByCid(category.getCid());
		categoryService.delete(category);
		return "deleteSuccess";
	}
	//后台编辑一级分类的方法
	public String edit(){
		category = categoryService.findByCid(category.getCid());
		return "editSuccess";
	}
	//后台更新一级分类的方法
	public String 	update(){
		categoryService.update(category);
		return "updateSuccess";
	}
}
