package com.thangtq.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	Integer id;
	String name;
	double price;
	int qty = 1;
	String anh;
	
	
}
