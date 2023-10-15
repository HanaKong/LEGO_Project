package com.spring.javaweb13S.service;

import java.util.ArrayList;

import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.OrderVO;
import com.spring.javaweb13S.vo.WatchListVO;

public interface MemberService {

	public MemberVO getMemberIdCheck(String uid);

	public int setMemberJoin(MemberVO vo);

	public MemberVO getMemberVOfrom(String email);

	public void setMemberTempPwdUpdate(String uid, String tempPwd);

	public ArrayList<WatchListVO> getWatchList(String uid);

	public int setMemberUpdate(MemberVO memberVO);

	public int setPwdUpdate(String pwd, String uid);

	public int setMemberDelete(String uid);

	public void setMemberDateUpdate(String uid);

	public int setMemberLevelUp(String uid);

	public ArrayList<OrderVO> getOrderInfo(String uid);

	public ArrayList<OrderVO> getOrderCntInfo(String uid);

}
