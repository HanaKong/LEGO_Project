package com.spring.javaweb13S.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaweb13S.vo.CategoryVO;
import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.ProductImgVO;
import com.spring.javaweb13S.vo.ProductVO;
import com.spring.javaweb13S.vo.QnaVO;
import com.spring.javaweb13S.vo.StoreMapVO;

public interface AdminDAO {

	public ArrayList<MemberVO> getMemberList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("searchSw") String searchSw, @Param("searchItem") String searchItem);

	public int setMemberLevelUpdate(@Param("idx") int idx, @Param("level") int level);

	public void setMemberDelete(@Param("idx") int idx);

	public ArrayList<CategoryVO> getCategoryList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("searchSw") String searchSw, @Param("searchItem") String searchItem);

	public int setCategory(@Param("categoryCode") String categoryCode, @Param("categoryName") String categoryName);

	public int totRecCnt(@Param("searchSw") String searchSw, @Param("searchItem")  String searchItem);

	public void setCategoryDelete(@Param("idx") int idx);

	public int setProductInput(@Param("vo") ProductVO vo);

	public int productTotRecCnt(@Param("searchSw") String searchSw, @Param("searchItem")  String searchItem);

	public ArrayList<ProductVO> getProductList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("searchSw") String searchSw, @Param("searchItem") String searchItem, @Param("p") String p);

	public int productStateChange(@Param("idx") int idx, @Param("switchItem") int switchItem);

	public void productDelete(@Param("idx") int idx);

	public ProductVO getProductContent(@Param("idx") int idx);

	public int setProductUpdate(@Param("vo") ProductVO vo);

	public int setFile(@Param("vo") ProductImgVO vo);

	public ArrayList<ProductImgVO> getProductImg(@Param("productCode") int productCode);

	public int setVideo(@Param("vo") ProductImgVO vo);

	public ProductImgVO getProductVideo(@Param("productCode") int productCode);

	public int getProductCount(@Param("categoryCode") String categoryCode, @Param("code") String code);

	public ArrayList<QnaVO> getQnaNoReply(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize);

	public int QnaNoReplyTotRecCnt(String searchSw, String searchItem);

	public int setQnaReply(@Param("idx") int idx, @Param("productIdx") int productIdx, @Param("textContent") String textContent);

	public int setQnaUpdate(@Param("idx") int idx);

	public void setQnaDelete(@Param("idx") int idx);

	public int setStoreMap(@Param("locationName") String locationName, @Param("addr") String addr, @Param("locationTel") String locationTel, @Param("locationText") String locationText,
			@Param("coordsTemp") String coordsTemp);

	public ArrayList<StoreMapVO> getStoreMap();

	public void setStoreMapDelete(@Param("idx") int idx);

}
