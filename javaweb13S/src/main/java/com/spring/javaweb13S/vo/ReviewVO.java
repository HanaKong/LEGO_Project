package com.spring.javaweb13S.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	private int idx;
	private String uid;
	private int productIdx;
	private String productName;
	private String content;
	private int evaluateMain;
	private int evaluateSub1;
	private int evaluateSub2;
	private int evaluateSub3;
	private String regDate;
	private String FName;
	private String hostIP;
	private int randomNum;
	
}
