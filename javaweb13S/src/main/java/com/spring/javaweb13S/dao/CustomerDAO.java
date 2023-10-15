package com.spring.javaweb13S.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaweb13S.vo.StoreMapVO;

public interface CustomerDAO {

	public ArrayList<StoreMapVO> getStoreMap();

	public StoreMapVO getStoreMapInfo(@Param("idx") int idx);

}
