package com.thangtq.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.thangtq.entity.Account;
import com.thangtq.entity.Product;



public interface AccountDAO extends JpaRepository<Account, String>{
	
}
