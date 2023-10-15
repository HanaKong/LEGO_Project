package com.spring.javaweb13S.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaweb13S.dao.StoreDAO;
import com.spring.javaweb13S.vo.AvgReviewVO;
import com.spring.javaweb13S.vo.CartVO;
import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.ProductVO;
import com.spring.javaweb13S.vo.QnaReplyVO;
import com.spring.javaweb13S.vo.QnaVO;
import com.spring.javaweb13S.vo.ReviewVO;
import com.spring.javaweb13S.vo.WatchListVO;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDAO storeDAO;

	@Override
	public ProductVO getProductInfo(int idx) {
		return storeDAO.getProductInfo(idx);
	}

	@Override
	public CartVO getSearchCartInfo(int idx, String uid) {
		return storeDAO.getSearchCartInfo(idx, uid);
	}
	
	@Override
	public int setCartItem(int idx, String uid, int quantity, String productName, int price, int point, String FName) {
		return storeDAO.setCartItem(idx, uid, quantity, productName, price, point, FName);
	}

	@Override
	public int updateCartQuantity(int idx, String uid, int quantity, int productPrice) {
		return storeDAO.updateCartQuantity(idx, uid, quantity, productPrice);
	}
	
	@Override
	public ArrayList<ProductVO> getCartList(String uid) {
		return storeDAO.getCartList(uid);
	}

	@Override
	public int getCartCnt(String uid) {
		return storeDAO.getCartCnt(uid);
	}

	@Override
	public int setWatchList(String uid, int productIdx, String productName, int price, int discountRate, String FName) {
		return storeDAO.setWatchList(uid, productIdx, productName, price, discountRate, FName);
	}

	@Override
	public WatchListVO getWatchList(String uid, int productIdx) {
		return storeDAO.getWatchList(uid, productIdx);
	}

	@Override
	public void setWatchListDelete(int idx, String uid) {
		storeDAO.setWatchListDelete(idx, uid);
	}

	@Override
	public CartVO getPaymentList(String idx) {
		return storeDAO.getPaymentList(idx);
	}

	@Override
	public MemberVO getMemberInfo(String uid) {
		return storeDAO.getMemberInfo(uid);
	}

	@Override
	public int setCartDelete(int idx) {
		return storeDAO.setCartDelete(idx);
	}

	@Override
	public int setQnAInfo(String uid, int productIdx, String productName, String content, int QnaSW, String hostIP, String FName) {
		return storeDAO.setQnAInfo(uid, productIdx, productName, content, QnaSW, hostIP, FName);
	}

	@Override
	public ArrayList<QnaVO> getQnaInfo(int startIndexNo, int pageSize, int idx, String searchItem) {
		return storeDAO.getQnaInfo(startIndexNo, pageSize, idx, searchItem);
	}

	@Override
	public ArrayList<QnaReplyVO> getQnaReplyInfo(int idx) {
		return storeDAO.getQnaReplyInfo(idx);
	}

	@Override
	public int setReviewInfo(int productIdx, String productTitle, String content, String uid, int result1Value, int result2Value,
			int result3Value, int result4Value, String FName, String hostIP, int randomNum) {
		return storeDAO.setReviewInfo(productIdx, productTitle, content, uid, result1Value, result2Value, result3Value, result4Value, FName, hostIP, randomNum);
	}

	@Override
	public ArrayList<ReviewVO> getReviewInfo(int startIndexNo, int pageSize, int idx, String searchItem) {
		return storeDAO.getReviewInfo(startIndexNo, pageSize, idx, searchItem);
	}

	@Override
	public AvgReviewVO getAvgReview(int idx) {
		return storeDAO.getAvgReview(idx);
	}

	@Override
	public CartVO getCartInfo(String cartIdx) {
		return storeDAO.getCartInfo(cartIdx);
	}

	@Override
	public void setOrderInfo(int productIdx, String productName, int price, String FName, int quantity, int point,
			String merchant_uid, String uid, int amount, int pointUsage, String buyer_name, String buyer_email, String buyer_tel,
			String buyer_addr, String buyer_postcode, String memo) {
		storeDAO.setOrderInfo(productIdx, productName, price, FName, quantity, point,
				 merchant_uid, uid, amount, pointUsage, buyer_name, buyer_email, buyer_tel,
				 buyer_addr, buyer_postcode, memo);
	}

	@Override
	public void setCartDeleteByOrder(String idx) {
		storeDAO.setCartDeleteByOrder(idx);
	}

	@Override
	public void updateMemberPoint(int pointUsage, String uid) {
		storeDAO.updateMemberPoint(pointUsage, uid);
		
	}

	
}
