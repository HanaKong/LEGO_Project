package com.spring.javaweb13S.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaweb13S.vo.AvgReviewVO;
import com.spring.javaweb13S.vo.CartVO;
import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.ProductVO;
import com.spring.javaweb13S.vo.QnaReplyVO;
import com.spring.javaweb13S.vo.QnaVO;
import com.spring.javaweb13S.vo.ReviewVO;
import com.spring.javaweb13S.vo.WatchListVO;

public interface StoreDAO {

	public ProductVO getProductInfo(@Param("idx") int idx);

	public CartVO getSearchCartInfo(@Param("idx") int idx, @Param("uid") String uid);

	public int setCartItem(@Param("idx") int idx, @Param("uid") String uid, @Param("quantity") int quantity, @Param("productName") String productName, @Param("price") int price, @Param("point") int point, @Param("FName") String FName);

	public int updateCartQuantity(@Param("idx") int idx, @Param("uid") String uid, @Param("quantity") int quantity, @Param("productPrice") int productPrice);
	
	public ArrayList<ProductVO> getCartList(@Param("uid") String uid);

	public int getCartCnt(@Param("uid") String uid);

	public int setWatchList(@Param("uid") String uid, @Param("productIdx")int productIdx, @Param("productName") String productName, @Param("price") int price, @Param("discountRate")  int discountRate, @Param("FName") String FName);

	public WatchListVO getWatchList(@Param("uid") String uid, @Param("productIdx") int productIdx);

	public void setWatchListDelete(@Param("idx") int idx, @Param("uid") String uid);

	public CartVO getPaymentList(@Param("idx") String idx);

	public MemberVO getMemberInfo(@Param("uid") String uid);

	public int setCartDelete(@Param("idx") int idx);

	public int setQnAInfo(@Param("uid") String uid, @Param("productIdx") int productIdx, @Param("productName") String productName, @Param("content") String content, @Param("QnaSW") int QnaSW, @Param("hostIP") String hostIP, @Param("FName") String FName);

	public ArrayList<QnaVO> getQnaInfo(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("idx") int idx, @Param("searchItem") String searchItem);

	public int QnaTotRecCnt(@Param("productIdx") String productIdx, @Param("searchItem") String searchItem);

	public ArrayList<QnaReplyVO> getQnaReplyInfo(@Param("idx") int idx);

	public int setReviewInfo(@Param("productIdx") int productIdx, @Param("productTitle") String productTitle, @Param("content") String content, @Param("uid") String uid, @Param("result1Value") int result1Value, @Param("result2Value") int result2Value,
			@Param("result3Value") int result3Value, @Param("result4Value") int result4Value,@Param("FName") String FName, @Param("hostIP") String hostIP, @Param("randomNum") int randomNum);
	
	public ArrayList<ReviewVO> getReviewInfo(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("idx") int idx, @Param("searchItem") String searchItem);

	public AvgReviewVO getAvgReview(@Param("idx") int idx);

	public int ReviewTotRecCnt(@Param("productIdx") String productIdx, @Param("searchItem") String searchItem);

	public CartVO getCartInfo(@Param("cartIdx") String cartIdx);

	public void setOrderInfo(@Param("productIdx") int productIdx, @Param("productName") String productName, @Param("price") int price, @Param("FName") String FName, 
			@Param("quantity") int quantity, @Param("point") int point, @Param("merchant_uid") String merchant_uid, @Param("uid") String uid, 
			@Param("amount") int amount, @Param("pointUsage") int pointUsage, @Param("buyer_name") String buyer_name, @Param("buyer_email") String buyer_email, @Param("buyer_tel") String buyer_tel,
			@Param("buyer_addr") String buyer_addr, @Param("buyer_postcode") String buyer_postcode, @Param("memo") String memo);

	public void setCartDeleteByOrder(@Param("idx") String idx);

	public void updateMemberPoint(@Param("pointUsage") int pointUsage, @Param("uid") String uid);

}
