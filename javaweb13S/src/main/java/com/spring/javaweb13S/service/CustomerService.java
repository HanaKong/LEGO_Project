package com.spring.javaweb13S.service;

import java.util.ArrayList;

import com.spring.javaweb13S.vo.StoreMapVO;

public interface CustomerService {

	public ArrayList<StoreMapVO> getStoreMap();

	public StoreMapVO getStoreMapInfo(int idx);

}
