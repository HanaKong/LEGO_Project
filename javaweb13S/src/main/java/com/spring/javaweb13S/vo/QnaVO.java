package com.spring.javaweb13S.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class QnaVO {
	private int idx;
	private String uid;
	private int productIdx;
	private String productName;
	private String content;
	private String regDate;
	private int answerSW;
	private int lockSW;
	private String hostIP;
	private String FName;
}
