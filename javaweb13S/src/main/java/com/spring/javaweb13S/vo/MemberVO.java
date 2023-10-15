package com.spring.javaweb13S.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	private int idx;
	private String uid;
	private String pwd;
	private String email;
	private String name;
	private String nickName;
	private String tel;
	private String address;
	private int level;
	private int point;
	private String userDel;
	private String startDate;
	private String lastDate;
	
	private int deleteDiff;
}
