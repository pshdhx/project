package cn.itcast.shop.product.adminaction;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.categorysecond.service.CategorySecondService;
import cn.itcast.shop.categorysecond.vo.CategorySecond;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.product.vo.Product;
import cn.itcast.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminProductAction extends ActionSupport implements ModelDriven<Product> {
	private Product product = new Product();

	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}
	private ProductService productService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	//查询所有商品
	private Integer page;
	
	public void setPage(Integer page) {
		this.page = page;
	}

	public String findAll(){
		
	PageBean<Product> pageBean = 	productService.findByPage(page);
	//将数据传递到页面需要用值栈
	ActionContext.getContext().getValueStack().set( "pageBean", pageBean);
		return "findAllSuccess";
	}
	
	
	
	//跳转到添加页面的方法
	/**
	 * 1、查询所有二级分类的集合，完成页面跳转
	 * 2、将商品添加到数据库，完成图片的上传
	 */
	private CategorySecondService categorySecondService;
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	public String addPage(){
		List<CategorySecond> csList = categorySecondService.findAll();
		ActionContext.getContext().getValueStack().set("csList", csList);
		return "addPageSuccess";
	}
	/**
	 * 进行商品的保存【包括图片上传的参数，方法】
	 * @return
	 */
	// 文件上传需要的三个属性:
		private File upload;
		private String uploadFileName;
		private String uploadContentType;

		public void setUpload(File upload) {
			this.upload = upload;
		}

		public void setUploadFileName(String uploadFileName) {
			this.uploadFileName = uploadFileName;
		}

		public void setUploadContentType(String uploadContentType) {
			this.uploadContentType = uploadContentType;
		}
		public String save() throws IOException {
			// 将提交的数据添加到数据库中.
			product.setPdate(new Date());
			// product.setImage(image);
			if(upload != null){
				// 将商品图片上传到服务器上.
				// 获得上传图片的服务器端路径.
				String path = ServletActionContext.getServletContext().getRealPath(
						"/products");
				// 创建文件类型对象:
				File diskFile = new File(path + "//" + uploadFileName);
				// 文件上传:
				FileUtils.copyFile(upload, diskFile);
		
				product.setImage("products/" + uploadFileName);
			}
			productService.save(product);
			return "saveSuccess";
		}
		
		
		/**
		 * 删除商品的方法 
		 * 先查询 后删除
		 */
		public String delete() {
			// 根据id查询商品信息
			product = productService.findByPid(product.getPid());
			// 删除商品的图片:
			String path = ServletActionContext.getServletContext().getRealPath(
					"/" + product.getImage());
			File file = new File(path);
			file.delete();
			// 删除数据库中商品记录:
			productService.delete(product);
			// 页面跳转
			return "deleteSuccess";
		}
		
		// 编辑商品的方法
		public String edit() {
			// 根据商品id查询商品信息
			product = productService.findByPid(product.getPid());
			// 查询所有二级分类
			List<CategorySecond> csList = categorySecondService.findAll();
			ActionContext.getContext().getValueStack().set("csList", csList);
			// 页面跳转到编辑页面:
			return "editSuccess";
		}
		
		// 修改商品的方法
		public String update() throws IOException {
			// 将信息修改到数据库
			product.setPdate(new Date());
			
			// 上传:
			if(upload != null ){
				String delPath = ServletActionContext.getServletContext().getRealPath(
						"/" + product.getImage());
				File file = new File(delPath);
				file.delete();
				// 获得上传图片的服务器端路径.
				String path = ServletActionContext.getServletContext().getRealPath(
						"/products");
				// 创建文件类型对象:
				File diskFile = new File(path + "//" + uploadFileName);
				// 文件上传:
				FileUtils.copyFile(upload, diskFile);

				product.setImage("products/" + uploadFileName);
			}
			productService.update(product);
			// 页面跳转
			return "updateSuccess";
		}
}
