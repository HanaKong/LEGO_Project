package com.spring.javaweb13S.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class OrderVO {
	private int idx;
	private String merchant_uid;
	private String uid;
	private String productIdx;
	private String productName;
	private int price;
	private int point;
	private int quantity;
	private String FName;
	private String buyer_name;
	private String buyer_email; 
	private String buyer_tel;
	private String buyer_addr;
	private String buyer_postcode;
	private int amount;
	private int pointUsage;
	private String memo;
	private int orderSW;
	private String payment_date;
	
	private int merchant_uidCnt;
	private int rank;
	private int totalPrice;
}
