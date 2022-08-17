package com.thangtq.controller;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thangtq.dao.AccountDAO;
import com.thangtq.dao.CategoryDAO;
import com.thangtq.dao.ProductDAO;
import com.thangtq.entity.Account;
import com.thangtq.entity.Category;
import com.thangtq.entity.Product;
import com.thangtq.sv.CookieService;
import com.thangtq.sv.ParamService;
import com.thangtq.sv.SessionService;
import com.thangtq.sv.ShoppingCartService;

@Controller
public class TrangChu_UserController {
	@Autowired
	ProductDAO productdao;

	@Autowired
	ShoppingCartService cart;

	@Autowired
	CategoryDAO categorydao;

	@Autowired
	AccountDAO adao;

	@Autowired
	ParamService paramService;

	@Autowired
	SessionService sessionService;

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext app;

	@Autowired
	CookieService cookieService;

	@Autowired
	JavaMailSender mailer;

	// Trang chu
	@RequestMapping("/estore/index")
	public String index(Model model, @RequestParam("p") Optional<Integer> p) {
		List<Category> items = categorydao.findAll();

		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<Product> listsp = productdao.findAll(pageable);
		model.addAttribute("Tonghang", cart.getCount());
		model.addAttribute("items", items);
		model.addAttribute("listsp", listsp);
		return "user/index";
	}

	// Load all san pham
//	@RequestMapping("/estore/product")
//	public String product(Model model,@RequestParam("p") Optional<Integer> p) {
//		Pageable pageable = PageRequest.of(p.orElse(0), 9);
//		Page<Product> items = productdao.findAll(pageable);
//		model.addAttribute("items", items);
//		return "user/product-list";
//	}

	@RequestMapping("/estore/product/{id}")
	public String listbyid(Model model, @PathVariable("id") String id, @RequestParam("p") Optional<Integer> p) {
		idt = id;
		check = false;
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> items = productdao.findByCategoryId(id, pageable);
		model.addAttribute("items", items);
		return "user/product-list";
	}

	Boolean check;
	String idt;

	@RequestMapping("/estore/product")
	public String listbyid1(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max, @RequestParam("p") Optional<Integer> p) {
		if (check == false) {
			Pageable pageable = PageRequest.of(p.orElse(0), 6);
			Page<Product> items = productdao.findByCategoryId(idt, pageable);
			model.addAttribute("items", items);
		} else {
			double minPrice = min.orElse(Double.MIN_VALUE);
			double maxPrice = max.orElse(Double.MAX_VALUE);
			Pageable pageable = PageRequest.of(p.orElse(0), 6);
			Page<Product> items = productdao.findByPrice(minPrice, maxPrice, pageable);
			model.addAttribute("items", items);
		}
		return "user/product-list";
	}

	@RequestMapping("/product/search")
	public String searchAndPage(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max, @RequestParam("p") Optional<Integer> p) {
		check = true;
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> items = productdao.findByPrice(minPrice, maxPrice, pageable);
		model.addAttribute("items", items);
		return "user/product-list";
	}

	// Gioi Thieu
	@RequestMapping("/estore/contact")
	public String contact(Model model) {
		model.addAttribute("Tonghang", cart.getCount());
		return "user/contact";
	}

	// Tai Khoan
	@RequestMapping("/estore/myaccount")
	public String myaccount(Model model) {
		model.addAttribute("Tonghang", cart.getCount());
		return "user/my-account";
	}

	// Dang Nhap
	@RequestMapping("/estore/login")
	public String login(Model model) {
		String user = cookieService.getValue("user", "");
		
		if(user != "") {
			Account ac = adao.getOne(user);
			String pass = ac.getPassword();
			model.addAttribute("check", "checked");
			model.addAttribute("u", user);
			model.addAttribute("p", pass);
		}
		return "user/login";
	}
	
	@RequestMapping("/estore/logout")
	public String logout(Model model) {
		String user = cookieService.getValue("user", "");
//		Account ac = adao.getOne(user);
//		String pass = ac.getPassword();
		if(user != "") {
			cookieService.remove("user");
		}
		return "user/login";
	}


	@RequestMapping("/account/login")
	public String login1(Model model) {
		String un = paramService.getString("username", "");
		String pw = paramService.getString("password", "");
		boolean rm = paramService.getBoolean("remember", false);
		
		try {
			Account ac = adao.getOne(un);
			
			if(un.equalsIgnoreCase(ac.getUsername())&& pw.equalsIgnoreCase(ac.getPassword())) {
				sessionService.set("username", un);
				//System.out.println("cc"+ rm);
					if(rm==true) {
						cookieService.add("user", un, 10);
					}
					if(ac.isAdmin()==false) {
						return "redirect:/estore/index";
					}
					else {
						return "redirect:/admin/dash";
					}
				}
				
			
		}catch(

	Exception e)
	{
			model.addAttribute("message","Đăng Nhập Thất Bại Username hoặc Password sai");
			return "user/login";
		}return"";}

	// Dang Nhap
	boolean ch = false;

	@RequestMapping("/estore/register")
	public String register(Model model, @ModelAttribute("ac") Account ac) {
		if (ch == true) {
			model.addAttribute("message", "Đăng ký thành công");
		}

		return "user/register";
	}

	@PostMapping("/estore/register")
	public String register1(Model model, Account ac) {
		ac.setAdmin(false);
		adao.save(ac);
		ch = true;
		return "redirect:/estore/register";
	}

	// Quen MK
	@RequestMapping("/estore/forgotpass")
	public String forgotpass(Model model) {
		return "user/forgotpassword";
	}

	// Quen MK
	@RequestMapping("/estore/sendemail")
	public String forgotpass1(Model model, @RequestParam("username") String username,
			@RequestParam("email") String email) {

		Account user = adao.getOne(username);
		cookieService.add("user", username, 10);
		if (username.equalsIgnoreCase(user.getUsername()) && email.equalsIgnoreCase(user.getEmail())) {
			try {
				// Tạo mail
				MimeMessage mail = mailer.createMimeMessage();

				// Tao mat khau moi
				Random generator = new Random();
				int value = generator.nextInt((9999 - 1000) + 1) + 1000;
				String a = String.valueOf(value);
				cookieService.add("code", a, 1);
				// Sử dụng lớp trợ giúp
				MimeMessageHelper helper = new MimeMessageHelper(mail);
				helper.setFrom("thangtqps15783@fpt.edu.vn");
				helper.setTo(email);
				helper.setReplyTo("thangtqps15783@fpt.edu.vn");
				helper.setSubject("Mã code của bạn là:");
				helper.setText(a, true);

//				user.setPassword(a);
//				adao.save(user);

				// Gửi mail
				mailer.send(mail);

				model.addAttribute("message", "Một mã code được gửi đến email của bạn vui lòng kiểm tra email! !");
			} catch (Exception ex) {
				model.addAttribute("message", "Có lỗi vui lòng thử lại sao");
			}
		} else {
			model.addAttribute("message", "Username hoac Email sai");
		}
		return "user/entercode";
	}

	@RequestMapping("/estore/entercode")
	public String entercode(Model model, @RequestParam("code") String code) {

		String checkcode = cookieService.getValue("code", "");

		if (checkcode.equalsIgnoreCase(code)) {
			model.addAttribute("message", "Thành công - Bạn có thể đặt lại pass mới");

			return "user/newpass";
		} else {
			model.addAttribute("message", "Mã code sai");
			return "user/entercode";
		}
	}

	@RequestMapping("/estore/newpass")
	public String newpass(Model model, @RequestParam("newpass") String newpass,
			@RequestParam("newpasswordcon") String newpasswordcon) {
		String u = cookieService.getValue("user", "");
		System.out.println("user" + u);
		if (newpass.equalsIgnoreCase(newpasswordcon)) {
			Account user = adao.getOne(u);
			user.setPassword(newpass);
			adao.save(user);
			model.addAttribute("message", "Đặt lại mật khẩu thành công");
		} else {
			model.addAttribute("message", "Hai mật khẩu không kớp");
		}
		return "user/newpass";
	}

//	@Autowired
//	SessionService session;
//	
//	@RequestMapping("/product/searchkey")
//	public String searchAndPage(Model model, 
//			@RequestParam("keywords") Optional<String> kw,
//			@RequestParam("p") Optional<Integer> p) {
//		String keywords = kw.orElse(session.get("keywords", ""));
//		session.set("keywords", keywords);
//		Pageable pageable = PageRequest.of(p.orElse(0), 5);
//		Page<Product> page = productdao.findByKeywords("%"+keywords+"%", pageable);
//		// DSL
//		//Page<Product> page = dao.findAllByNameLike("%"+keywords+"%", pageable);
//		model.addAttribute("items", page);
//		return "user/product-list";
//	}
}
