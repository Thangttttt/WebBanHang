package com.thangtq.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.thangtq.entity.Order;
import com.thangtq.entity.Product;



public interface OrderDAO extends JpaRepository<Order, Long>{
	@Query("SELECT p FROM Order p")
	List<Order> findByOrder();
	
	
	@Query("SELECT o FROM Order o where o.account.username = ?1 and o.paid = ?2")
	Order checkOderPaid(String username, boolean paid);
}
