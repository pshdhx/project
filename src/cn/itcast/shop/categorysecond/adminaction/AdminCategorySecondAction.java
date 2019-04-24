package cn.itcast.shop.categorysecond.adminaction;

import java.util.List;

import cn.itcast.shop.category.service.CategoryService;
import cn.itcast.shop.category.vo.Category;
import cn.itcast.shop.categorysecond.service.CategorySecondService;
import cn.itcast.shop.categorysecond.vo.CategorySecond;
import cn.itcast.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminCategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond>{
	private CategorySecond categorySecond  = new CategorySecond();
	public CategorySecond getModel() {
		// TODO Auto-generated method stub
		return categorySecond;
	}
	private CategorySecondService categorySecondService;
	
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}
	
	//查询二级分类的方法
	public String findAll(){
		PageBean<CategorySecond> pageBean = categorySecondService.findByPage(page);
		// 将pageBean的数据存入到值栈中.
				ActionContext.getContext().getValueStack().set("pageBean", pageBean);
				return "findAll";
	}
	
	//跳转到添加页面 
	/**
	 * 1、查询所有的一级分类
	 * 2、把数据显示到页面的下拉列表中 
	 * 3、进行页面跳转
	 */
	private CategoryService  categoryService;
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public String addPage(){
		List<Category> cList = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "addPageSuccess";
	}
	//进行二级分类添加到一级分类的操作
	public String save(){
		categorySecondService.save(categorySecond);
		return "saveSuccess";
	}
	//进行删除二级分类的操作【注意  级联操作 cascade】
	public String delete(){
		//如果级联删除 ，那么先查询再删除，配置cascade
		categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		categorySecondService.delete(categorySecond);
		return "deleteSuccess";
	}
	//编辑二级分类的方法
	/**
	 * 根据二级分类id查询二级分类对象，返回的是二级分类的对象
	 * 根据二级分类查询一级分类，返回的是一级分类的集合对象，用值栈建立cList对象。
	 * @return
	 */
	public String edit(){
		 categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		 List<Category> cList = categoryService.findAll();
		 ActionContext.getContext().getValueStack().set("cList", cList);
		return "editSuccess";
	}
	
	//修改二级分类的方法
	public String update(){
		categorySecondService.update(categorySecond);
		return "updateSuccess";
	}
	
}
