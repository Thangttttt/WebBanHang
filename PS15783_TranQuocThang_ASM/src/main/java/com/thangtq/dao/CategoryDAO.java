package com.thangtq.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thangtq.entity.Category;



public interface CategoryDAO extends JpaRepository<Category, String>{
}
