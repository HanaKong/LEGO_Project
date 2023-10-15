package com.spring.javaweb13S.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StoreMapVO {
	private int idx;
	private String storeName;
	private String storeLocation;
	private String storeCoords;
	private String storeTel;
	private String content;
}
