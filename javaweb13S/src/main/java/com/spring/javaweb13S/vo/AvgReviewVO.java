package com.spring.javaweb13S.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AvgReviewVO {
	private int productIdx;
	private int cntReview;
	private float avgMain;
	private float avgSub1;
	private float avgSub2;
	private float avgSub3;
}
