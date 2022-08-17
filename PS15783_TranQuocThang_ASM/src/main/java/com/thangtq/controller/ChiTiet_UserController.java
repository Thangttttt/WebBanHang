package com.thangtq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thangtq.dao.ProductDAO;
import com.thangtq.entity.Product;
import com.thangtq.sv.ParamService;
import com.thangtq.sv.ShoppingCartService;

@Controller
public class ChiTiet_UserController {
	@Autowired
	ProductDAO productdao;
	@Autowired
	ShoppingCartService cart;
	@Autowired
	ParamService param;

	@RequestMapping("/estore/detail")
	public String view(Model model) {
		model.addAttribute("cart", cart);
		model.addAttribute("Tonghang", cart.getCount());
		return "user/product-detail";
	}
	
	@RequestMapping("/detail/add/{id}")
	public String add(Model model,@PathVariable("id") Integer id) {
		Product p = new Product();
		p = productdao.getOne(id);
		model.addAttribute("items", p);
		return "user/product-detail";
	}
}
