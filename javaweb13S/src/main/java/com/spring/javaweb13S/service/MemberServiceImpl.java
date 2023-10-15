package com.spring.javaweb13S.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaweb13S.dao.MemberDAO;
import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.OrderVO;
import com.spring.javaweb13S.vo.WatchListVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public MemberVO getMemberIdCheck(String uid) {
		return memberDAO.getMemberIdCheck(uid);
	}

	@Override
	public int setMemberJoin(MemberVO vo) {
		return memberDAO.setMemberJoin(vo);
	}

	@Override
	public MemberVO getMemberVOfrom(String email) {
		return memberDAO.getMemberVOfrom(email);
	}

	@Override
	public void setMemberTempPwdUpdate(String uid, String tempPwd) {
		 memberDAO.setMemberTempPwdUpdate(uid, tempPwd);
	}

	@Override
	public ArrayList<WatchListVO> getWatchList(String uid) {
		return memberDAO.getWatchList(uid);
	}

	@Override
	public int setMemberUpdate(MemberVO memberVO) {
		return memberDAO.setMemberUpdate(memberVO);
	}

	@Override
	public int setPwdUpdate(String pwd, String uid) {
		return memberDAO.setPwdUpdate(pwd, uid);
	}

	@Override
	public int setMemberDelete(String uid) {
		return memberDAO.setMemberDelete(uid);
	}

	@Override
	public void setMemberDateUpdate(String uid) {
		memberDAO.setMemberDateUpdate(uid);
	}

	@Override
	public int setMemberLevelUp(String uid) {
		return memberDAO.setMemberLevelUp(uid);
	}

	@Override
	public ArrayList<OrderVO> getOrderInfo(String uid) {
		return memberDAO.getOrderInfo(uid);
	}

	@Override
	public ArrayList<OrderVO> getOrderCntInfo(String uid) {
		return memberDAO.getOrderCntInfo(uid);
	}

}
