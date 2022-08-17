package com.thangtq.controller;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.thangtq.dao.AccountDAO;
import com.thangtq.dao.CategoryDAO;
import com.thangtq.dao.OrderDAO;
import com.thangtq.dao.OrderDetailDAO;
import com.thangtq.dao.ProductDAO;
import com.thangtq.entity.Account;
import com.thangtq.entity.Category;
import com.thangtq.entity.Order;
import com.thangtq.entity.OrderDetail;
import com.thangtq.entity.Product;
import com.thangtq.entity.Report;
import com.thangtq.entity.Report1;
import com.thangtq.sv.SessionService;

@Controller
public class TrangChu_AdminController {
	@Autowired
	CategoryDAO cdao;
	@Autowired
	OrderDAO odao;
	
	@Autowired
	OrderDetailDAO odtdao;
	
	@Autowired
	AccountDAO adao;

	@Autowired
	ProductDAO pdao;

	@Autowired
	ServletContext app;
	
	@Autowired
	SessionService session;

	// Bang dieu khien
	@RequestMapping("/admin/dash")
	public String index(Model model) {
		List<Report> items = pdao.getInventoryByCategory();
		model.addAttribute("tongtien", pdao.tongtien());
		model.addAttribute("items", items);
		model.addAttribute("thang", "body.jsp");
		return "admin/index";
	}

	// Danh Muc
	@RequestMapping("/admin/cetegories")
	public String categories(Model model) {
		Category item = new Category();
		model.addAttribute("item", item);
		List<Category> items = cdao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("thang", "categories.jsp");
		return "admin/index";
	}

	@RequestMapping("/category/edit/{id}")
	public String edit(Model model, @PathVariable("id") String idt) {
		Category item = cdao.findById(idt).get();
		model.addAttribute("item", item);
		List<Category> items = cdao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("loadanh", item.getImage());
		model.addAttribute("thang", "categories.jsp");
		return "admin/index";
	}

	@RequestMapping("/category/create")
	public String create(Model model, @ModelAttribute("item") Category item,
			@RequestParam("saveimg") MultipartFile anh) {
		System.out.println(item.toString());
		save(anh);
//		
//		Category ct = new Category();
//		ct.setImage(cbk.getImage2());
//		ct.setId(cbk.getId());
//		ct.setName(cbk.getName());
//
		cdao.save(item);
		return "redirect:/admin/cetegories";
	}

	@Autowired
	HttpServletRequest req;

	public File save(MultipartFile file) {
		if (file == null) {
			return null;
		}
		File dir = new File(req.getRealPath("/us/img/"));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File newFile = new File(dir, file.getOriginalFilename());

		try {
			System.out.println("File: " + file);
			file.transferTo(newFile);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return newFile;
	}

	@RequestMapping("/category/update")
	public String update(Category item) {
		cdao.save(item);
		return "redirect:/category/edit/" + item.getId();
	}

	@RequestMapping("/category/delete/{id}")
	public String create(@PathVariable("id") String id) {
		System.out.println(id);
		cdao.deleteById(id);
		return "redirect:/admin/cetegories";
	}

	// Danh Muc
	@RequestMapping("/admin/products")
	public String products(Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		List<Product> items = pdao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("thang", "products.jsp");
		return "admin/index";
	}
	// id categoris
	@ModelAttribute("listcategory")
	public List<Category> getFaculties() {
		return cdao.findAll();
	}
	
	@RequestMapping("/product/create")
	public String createp(Model model, @ModelAttribute("item") Product item,
			@RequestParam("saveimg") MultipartFile anh) {
	
		
//		item.setCreateDate(new Date());
		 save(anh);
		pdao.save(item);
		
		return "redirect:/admin/products";
	}

	public File savep(MultipartFile file) {
		if (file == null) {
			return null;
		}
		File dir = new File(req.getRealPath("/us/img/"));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File newFile = new File(dir, file.getOriginalFilename());

		try {
			System.out.println("File: " + file);
			file.transferTo(newFile);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return newFile;
	}
	
	@RequestMapping("/product/edit/{id}")
	public String editp(Model model, @PathVariable("id") Integer idt) {
		Product item = pdao.findById(idt).get();
		model.addAttribute("item", item);
		
		List<Product> items = pdao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("loadanh", item.getImage());
		model.addAttribute("thang", "products.jsp");
		return "admin/index";
	}
	
	@RequestMapping("/product/update/{id}")
	public String updatep(Product item, @PathVariable("id") Integer idt) {
		item.setId(idt);
		pdao.save(item);
		return "redirect:/product/edit/" + item.getId();
	}

	@RequestMapping("/product/delete/{id}")
	public String createp(@PathVariable("id") Integer id) {
		System.out.println(id);
		pdao.deleteById(id);
		return "redirect:/admin/products";
	}

	// Tai Khoan
	boolean ch = false;
	@RequestMapping("/admin/accounts")
	public String accounts(Model model , @ModelAttribute("ac") Account ac) {
		Account item = new Account();
		model.addAttribute("item", item);
		List<Account> items = adao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("thang", "accounts.jsp");
		if(ch == true) {
			model.addAttribute("message","Thêm thành công");
		}
	
		return "admin/index";
	}
	
	
	@PostMapping("/account/create")
	public String createa(Model model, Account ac) {
		ac.setAdmin(true);
		adao.save(ac);
		ch = true;
		return "redirect:/admin/accounts";
	}
	
	@RequestMapping("/account/edit/{username}")
	public String edita(Model model, @PathVariable("username") String idt) {
		Account item = adao.findById(idt).get();
		model.addAttribute("ac", item);
		List<Account> items = adao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("thang", "accounts.jsp");
		return "admin/index";
	}
	
	@RequestMapping("/account/update")
	public String updatea(Account ac) {
		adao.save(ac);
		return "redirect:/account/edit/" + ac.getUsername();
	}

	@RequestMapping("/account/delete/{username}")
	public String deletea(@PathVariable("username") String username) {
//		System.out.println(username);
		adao.deleteById(username);
		return "redirect:/admin/accounts";
	}

	@RequestMapping("/admin/oders")
	public String oders(Model model) {
		Order item = new Order();
		model.addAttribute("item", item);
		List<Order> items = odao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("thang", "oders.jsp");
		return "admin/index";
	}

	@RequestMapping("/admin/oderdetail")
	public String oderdetail(Model model) {
		OrderDetail item = new OrderDetail();
		model.addAttribute("item", item);
		List<OrderDetail> items = odtdao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("thang", "oderdetail.jsp");
		return "admin/index";
	}
	
	//Thong ke
//	@RequestMapping("/report/inventory-by-category")
//	public String inventory(Model model) {
//		
//	}

}
