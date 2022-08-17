package com.thangtq.sv;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import com.thangtq.dao.AccountDAO;
import com.thangtq.dao.OrderDAO;
import com.thangtq.dao.OrderDetailDAO;
import com.thangtq.dao.ProductDAO;
import com.thangtq.entity.Account;
import com.thangtq.entity.Item;
import com.thangtq.entity.Order;
import com.thangtq.entity.OrderDetail;
import com.thangtq.entity.Product;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	@Autowired
	ProductDAO pdao;

	@Autowired
	OrderDAO odao;
	
	@Autowired
	AccountDAO adao;
	@Autowired
	OrderDetailDAO oddao;
	
	@Autowired
	CookieService cookieService;

	@Autowired
	JavaMailSender mailer;

	Map<Integer, Item> map = new HashMap<>();

	@Override
	public Item add(Integer id) {
		Item item = map.get(id);
		if (item == null) {
			Product p = pdao.getOne(id);
			Item i = new Item();
			i.setId(p.getId());
			i.setName(p.getName());
			i.setPrice(p.getPrice());
			i.setAnh(p.getImage());

			item = i;
			item.setQty(1);
			map.put(id, item);
		} else {
			item.setQty(item.getQty() + 1);
		}
		return item;
	}

	@Override
	public void remove(Integer id) {
		map.remove(id);
	}

	@Override
	public Item update(Integer id, int qty) {
		Item item = map.get(id);
		item.setQty(qty);
		return item;
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public Collection<Item> getItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		return map.values().stream().mapToInt(item -> item.getQty()).sum();
	}

	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item -> item.getPrice() * item.getQty()).sum();
	}

	public ArrayList<Item> listI() {
		 
		ArrayList<Item> list = new ArrayList<>();
		for (Map.Entry<Integer, Item> entry : map.entrySet()) {
			list.add(entry.getValue());
		}
		return list;
	}

	@Autowired
	SessionService session;

	public void addOrderDetail() {
		String username = session.get("username", "");
		Order order = odao.checkOderPaid(username, false);
		for (Item item : listI()) {
			OrderDetail odt = new  OrderDetail();
			odt.setOrder(order);
			Product prod = pdao.getOne(item.getId());
			odt.setProduct(prod);
			odt.setPrice(item.getPrice());
			odt.setQuantity(item.getQty());
			System.out.println(odt.toString());
			oddao.save(odt);
		}
		sendOrderDetail(username, order);
		order.setPaid(true);
		odao.save(order);
	}
	
	public void sendOrderDetail( String username, Order order) {
		List<Item> list = listI();
		
		StringBuilder builder = new StringBuilder();
		builder.append("Mã hóa ddon: " + order.getId()+ "\n");
		builder.append("Soos ddieenj thoai: " + order.getSdt() + "\n");
		builder.append("DDia chi: " + order.getAddress() + "\n");
		
		for (Item item : list) {
			builder.append("Ten sp: " + item.getName() + " so luong: " + item.getQty() + " Gia sp: " + item.getPrice()+ "\n");
			
		}
		Account a = adao.getOne(username);
		try {
			// Tạo mail
			MimeMessage mail = mailer.createMimeMessage();

			// Sử dụng lớp trợ giúp
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom("thangtqps15783@fpt.edu.vn");
			helper.setTo(a.getEmail());
			helper.setReplyTo("thangtqps15783@fpt.edu.vn");
			helper.setSubject("Đặt hàng thành công tại EstoreShop");
			helper.setText(builder.toString());

//			user.setPassword(a);
//			adao.save(user);

			// Gửi mail
			mailer.send(mail);

		} catch (Exception ex) {
		}
	}
}