package com.spring.javaweb13S.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.OrderVO;
import com.spring.javaweb13S.vo.WatchListVO;

public interface MemberDAO {

	public MemberVO getMemberIdCheck(@Param("uid") String uid);

	public int setMemberJoin(@Param("vo") MemberVO vo);

	public MemberVO getMemberVOfrom(@Param("email") String email);

	public void setMemberTempPwdUpdate(@Param("uid") String uid, @Param("tempPwd") String tempPwd);

	public int totRecCnt(@Param("searchSw") String searchSw, @Param("searchItem")  String searchItem);

	public ArrayList<WatchListVO> getWatchList(@Param("uid") String uid);

	public int setMemberUpdate(@Param("memberVO") MemberVO memberVO);

	public int setPwdUpdate(@Param("pwd") String pwd, @Param("uid") String uid);

	public int setMemberDelete(@Param("uid") String uid);

	public void setMemberDateUpdate(@Param("uid") String uid);

	public int setMemberLevelUp(@Param("uid") String uid);

	public ArrayList<OrderVO> getOrderInfo(@Param("uid") String uid);

	public ArrayList<OrderVO> getOrderCntInfo(@Param("uid") String uid);

}
