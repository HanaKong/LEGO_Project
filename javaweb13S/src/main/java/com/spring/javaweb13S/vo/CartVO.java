package com.spring.javaweb13S.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CartVO {
	private int idx;
	private int productIdx;
	private String uid;
	private int quantity;
	private int point;
	private String productName;
	private String FName;
	private int price;
}
