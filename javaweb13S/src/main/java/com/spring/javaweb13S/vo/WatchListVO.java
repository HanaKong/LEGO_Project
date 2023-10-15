package com.spring.javaweb13S.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WatchListVO {
	private String uid;
	private int productIdx;
	private String productName;
	private int price;
	private int discountRate;
	private String FName;
	
	private int productDiscountPrice;
}
