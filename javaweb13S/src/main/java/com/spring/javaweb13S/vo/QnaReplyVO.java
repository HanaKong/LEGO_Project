package com.spring.javaweb13S.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaReplyVO {
	private int idx;
	private int qnaIdx;
	private int productIdx;
	private String uid;
	private String regDate;
	private String content;
}
