package cn.itcast.shop.index.action;

import java.util.List;

import cn.itcast.shop.category.service.CategoryService;
import cn.itcast.shop.category.vo.Category;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.product.vo.Product;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{
	/**
	 * 注入一级分类的service
	 */
	private CategoryService categoryService;
	
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	/**
	 * 输入商品的service
	 */
	private ProductService productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public String execute() {
		//查询一级分类,将一级分类存入到sesison范围
		List<Category> cList = categoryService.findAll();
		ActionContext.getContext().getSession().put("cList",cList);		//put 的时候取值用#session.*;[一级分类贯穿始终，用session]
		
		
		//查询热门商品
		List<Product> hList = productService.findHot();
		//保存到值栈中
		ActionContext.getContext().getValueStack().set("hList",hList);	//这是值栈	【热门商品只在一个界面中，用值栈】
		
		
		//查询最新商品
		List<Product> nList = productService.findNew();
		ActionContext.getContext().getValueStack().set("nList",nList);	//这是值栈	【最新商品只在一个界面中，用值栈】
		return "index";
		
		
		
	}
}
