package com.spring.javaweb13S.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	private int idx;
	private String categoryCode;
	private int productCode;
	private String productName;
	private int price;
	private int discountRate;
	private String age;
	private int	partsNumber; 
	private int point;
	private int stock;
	private String regDate;
	private int switchItem;
	private String fName;
	private String content;
	
	private int productDiscountPrice;
}
