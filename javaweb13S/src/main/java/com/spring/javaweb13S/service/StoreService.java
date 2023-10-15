package com.spring.javaweb13S.service;

import java.util.ArrayList;

import com.spring.javaweb13S.vo.AvgReviewVO;
import com.spring.javaweb13S.vo.CartVO;
import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.ProductVO;
import com.spring.javaweb13S.vo.QnaReplyVO;
import com.spring.javaweb13S.vo.QnaVO;
import com.spring.javaweb13S.vo.ReviewVO;
import com.spring.javaweb13S.vo.WatchListVO;

public interface StoreService {

	public ProductVO getProductInfo(int idx);

	public CartVO getSearchCartInfo(int idx, String uid);

	public int setCartItem(int idx, String uid, int quantity, String productName, int price, int point, String FName);

	public int updateCartQuantity(int idx, String uid, int quantity, int productPrice);

	public ArrayList<ProductVO> getCartList(String uid);

	public int getCartCnt(String uid);

	public int setWatchList(String uid, int productIdx, String productName, int price, int discountRate, String FName);

	public WatchListVO getWatchList(String uid, int productIdx);

	public void setWatchListDelete(int idx, String uid);

	public CartVO getPaymentList(String idx);

	public MemberVO getMemberInfo(String uid);

	public int setCartDelete(int idx);

	public int setQnAInfo(String uid, int productIdx, String productName, String content, int QnaSW, String hostIP, String FName);

	public ArrayList<QnaVO> getQnaInfo(int startIndexNo, int pageSize, int idx, String searchItem);

	public ArrayList<QnaReplyVO> getQnaReplyInfo(int idx);

	public int setReviewInfo(int productIdx, String productTitle, String content, String uid, int result1Value, int result2Value,
			int result3Value, int result4Value, String FName, String hostIP, int randomNum);

	public ArrayList<ReviewVO> getReviewInfo(int startIndexNo, int pageSize, int idx, String searchItem);

	public AvgReviewVO getAvgReview(int idx);

	public CartVO getCartInfo(String cartIdx);

	public void setOrderInfo(int productIdx, String productName, int price, String FName, int quantity, int point,
			String merchant_uid, String uid, int amount, int pointUsage, String buyer_name, String buyer_email,
			String buyer_tel, String buyer_addr, String buyer_postcode, String memo);

	public void setCartDeleteByOrder(String idx);

	public void updateMemberPoint(int pointUsage, String uid);
	
}
