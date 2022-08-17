package com.thangtq.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thangtq.entity.OrderDetail;



public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
}