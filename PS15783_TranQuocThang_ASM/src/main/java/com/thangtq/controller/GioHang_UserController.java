package com.thangtq.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thangtq.dao.OrderDAO;
import com.thangtq.dao.OrderDetailDAO;
import com.thangtq.dao.ProductDAO;
import com.thangtq.entity.Account;
import com.thangtq.entity.Item;
import com.thangtq.entity.Order;
import com.thangtq.entity.OrderDetail;
import com.thangtq.sv.ParamService;
import com.thangtq.sv.SessionService;
import com.thangtq.sv.ShoppingCartService;
import com.thangtq.sv.ShoppingCartServiceImpl;

@Controller
public class GioHang_UserController {
	@Autowired
	ShoppingCartService cart;
	
	@Autowired
	ShoppingCartServiceImpl cartimpl;
	@Autowired
	ParamService param;
	@Autowired
	OrderDAO odao;
	@Autowired
	OrderDetailDAO oddao;
	
	@RequestMapping("/estore/cart")
	public String view(Model model) {
		model.addAttribute("cart", cart);
		model.addAttribute("Tonghang", cart.getCount());
		model.addAttribute("Tongtien", cart.getAmount());
		return "user/cart";
	}

	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/estore/cart";
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/estore/cart";
	}

	@RequestMapping("/cart/update")
	public String update() {
		Integer id = param.getInt("id", 0);
		int qty = param.getInt("qty", 0);
		cart.update(id, qty);
		return "redirect:/estore/cart";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/estore/cart";
	}
	
	@RequestMapping("/estore/order")
	public String order1(Model model
			//,@ModelAttribute("oder")Order item
			) {
		model.addAttribute("oder", new Order());
		model.addAttribute("Tonghang", cart.getCount());
		model.addAttribute("Tongtien", cart.getAmount());
		model.addAttribute("thangdeptrai", cartimpl.listI());
		if(kt==true) {
			model.addAttribute("message", "Đặt hàng thành công - Xem chi tiet Email");
		}
		return "user/checkout";
	}
	
	@Autowired
	SessionService session;
	boolean kt=false;
	@RequestMapping("/estore/orderp")
	public String createa(Model model, Order item) {
		String ac = session.get("username", null);		
		Account cao = new Account();
		cao.setUsername(ac);
		item.setAccount(cao);
		item.setPaid(false);
		System.out.println();
		odao.save(item);
		
		cartimpl.addOrderDetail();
		kt=true;
		return "redirect:/estore/order";
	}
	
}
