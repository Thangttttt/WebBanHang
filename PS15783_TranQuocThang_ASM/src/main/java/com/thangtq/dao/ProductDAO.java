package com.thangtq.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


//import com.j5.entity.Report;
import com.thangtq.entity.Product;
import com.thangtq.entity.Report;
import com.thangtq.entity.Report1;

public interface ProductDAO extends JpaRepository<Product, Integer>{
	@Query("SELECT p FROM Product p WHERE p.category.id=?1")
	Page<Product> findByCategoryId(String category, Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
	Page<Product> findByPrice(double minPrice, double maxPrice, Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
	Page<Product> findByKeywords(String keywords, Pageable pageable);
	
	@Query(value="SELECT * FROM Products WHERE name LIKE ?1",nativeQuery = true)
	List<Product> findByKeyword(String keyword);
	
	@Query("SELECT new Report(o.category, sum(o.price), count(o)) "
			+ " FROM Product o "
			+ " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
	List<Report> getInventoryByCategory();
	
	@Query(value=" select sum (Price * Quantity) from OrderDetails",nativeQuery = true) 
	Double tongtien();
	
//	@Query(value=" select sum (od.Price * od.Quantity),  o.CreateDate  from OrderDetails as od \r\n" + 
//			"   INNER JOIN Orders as o on o.id = od.OrderId \r\n" + 
//			"   group by o.CreateDate\r\n" + 
//			"   having CreateDate = ?1",nativeQuery = true)
//	Double tongtien(Date date);
}
