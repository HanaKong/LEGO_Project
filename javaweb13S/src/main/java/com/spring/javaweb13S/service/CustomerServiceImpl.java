package com.spring.javaweb13S.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaweb13S.dao.CustomerDAO;
import com.spring.javaweb13S.vo.StoreMapVO;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDAO customerDAO;

	@Override
	public ArrayList<StoreMapVO> getStoreMap() {
		return customerDAO.getStoreMap();
	}

	@Override
	public StoreMapVO getStoreMapInfo(int idx) {
		return customerDAO.getStoreMapInfo(idx);
	}
}
