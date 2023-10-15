package com.spring.javaweb13S.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaweb13S.vo.CategoryVO;
import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.ProductImgVO;
import com.spring.javaweb13S.vo.ProductVO;
import com.spring.javaweb13S.vo.QnaVO;
import com.spring.javaweb13S.vo.StoreMapVO;

public interface AdminService {

	public ArrayList<MemberVO> getMemberList(int StartIndexNo, int pageSize, String searchSw, String searchItem);

	public int setMemberLevelUpdate(int idx, int level);

	public void setMemberDelete(int idx);

	public ArrayList<CategoryVO> getCategoryList(int StartIndexNo, int pageSize, String searchSw, String searchItem);

	public int setCategory(String categoryCode, String categoryName);

	public void setCategoryDelete(int idx);

	public int imgChkNProductInput(MultipartFile file, ProductVO vo);

	public ArrayList<ProductVO> getProductList(int startIndexNo, int pageSize, String searchSw, String searchItem, String p);

	public int productStateChange(int idx, int switchItem);

	public void productDelete(int idx);

	public ProductVO getProductContent(int idx);

	public int setProductUpdate(ProductVO vo);

	public int setFile(ProductImgVO vo, MultipartHttpServletRequest file, int sw);

	public ArrayList<ProductImgVO> getProductImg(int productCode);

	public ProductImgVO getProductVideo(int productCode);

	public int getProductCount(String categoryCode, String code);

	public ArrayList<QnaVO> getQnaNoReply(int StartIndexNo, int pageSize);

	public int setQnaReply(int idx, int productIdx, String textContent);

	public int setQnaUpdate(int idx);

	public void setQnaDelete(int idx);

	public int setStoreMap(String locationName, String addr, String locationTel, String locationText, String coordsTemp);

	public ArrayList<StoreMapVO> getStoreMap();

	public void setStoreMapDelete(int idx);

}
