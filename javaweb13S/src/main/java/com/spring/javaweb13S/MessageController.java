package com.spring.javaweb13S;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {

	@RequestMapping(value = "message/{msgFlag}", method=RequestMethod.GET)
	public String listGet(@PathVariable String msgFlag, Model model,
			@RequestParam(name="nickName", defaultValue="", required=false) String nickName,
			@RequestParam(name="idx", defaultValue="0", required=false) int idx
			) {
		
		if(msgFlag.equals("memberLoginSuccess")) {
			model.addAttribute("msg", nickName+"님 환영합니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memberNo")) {
			model.addAttribute("msg", "로그인후 사용하세요.");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberLoginFail")) {
			model.addAttribute("msg", "아이디 혹은 비밀번호를 다시 확인해주세요.");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberJoinSuccess")) {
			model.addAttribute("msg", "회원가입되었습니다.");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberJoinFail")) {
			model.addAttribute("msg", "회원가입 실패하였습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/memberJoin");
		}
		else if(msgFlag.equals("uidMailSendSuccess")) {
			model.addAttribute("msg", "메일이 전송되었습니다.");
			model.addAttribute("url", "/member/memberIdSearch");
		}
		else if(msgFlag.equals("uidMailSendFail")) {
			model.addAttribute("msg", "메일을 찾을 수 없습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/memberIdSearch");
		}
		else if(msgFlag.equals("uidMailUnmatch")) {
			model.addAttribute("msg", "인증번호가 일치하지 않습니다\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/memberIdSearch");
		}
		else if(msgFlag.equals("PwdMailSendSuccess")) {
			model.addAttribute("msg", "전송되었습니다.");
			model.addAttribute("exit", "1");
		}
		else if(msgFlag.equals("memberPwdSearchFail")) {
			model.addAttribute("msg", "아이디를 찾을 수 없습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/memberPwdSearch");
		}
		else if(msgFlag.equals("memberPwdSearchFailE")) {
			model.addAttribute("msg", "이메일이 일치하지 않습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/memberPwdSearch");
		}
		else if(msgFlag.equals("memberLogout")) {
			model.addAttribute("msg", nickName +"님 로그아웃 되었습니다.");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("categorySuccess")) {
			model.addAttribute("msg", "새로운 카테고리가 등록되었습니다..");
			model.addAttribute("url", "/admin/category");
		}
		else if(msgFlag.equals("categoryFail")) {
			model.addAttribute("msg", "카테고리 등록을 실패하였습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/admin/category");
		}
		else if(msgFlag.equals("regProductSuccess")) {
			model.addAttribute("msg", "상품이 등록되었습니다.");
			model.addAttribute("url", "/admin/productList");
		}
		else if(msgFlag.equals("regProductFail")) {
			model.addAttribute("msg", "상품 등록 실패.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/admin/regProduct");
		}
		else if(msgFlag.equals("setCartSuccess")) {
			model.addAttribute("msg", "장바구니에 등록되었습니다.");
			model.addAttribute("url", "/store/cart");
		}
		else if(msgFlag.equals("setCartFail")) {
			model.addAttribute("msg", "장바구니 등록 실패하였습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/store/storeContent?idx="+idx);
		}
		else if(msgFlag.equals("productImgSuccess")) {
			model.addAttribute("msg", "추가 이미지 등록 성공하였습니다.");
			model.addAttribute("url", "/admin/productImg");
		}
		else if(msgFlag.equals("productImgFail")) {
			model.addAttribute("msg", "추가 이미지 등록 실패하였습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/admin/productImg");
		}
		else if(msgFlag.equals("productVideoSuccess")) {
			model.addAttribute("msg", "추가 동영상 등록 성공하였습니다.");
			model.addAttribute("url", "/admin/productImg");
		}
		else if(msgFlag.equals("productVideoFail")) {
			model.addAttribute("msg", "추가 동영상 등록 실패하였습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/admin/productImg");
		}
		else if(msgFlag.equals("regQNASuccess")) {
			model.addAttribute("msg", "상품 Q&A가 등록되었습니다.");
			model.addAttribute("exit", "1");
		}
		else if(msgFlag.equals("regQNAFail")) {
			model.addAttribute("msg", "상품 Q&A 등록 실패하였습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("exit", "1");
		}
		else if(msgFlag.equals("regQnaReplySuccess")) {
			model.addAttribute("msg", "Q&A 답변이 등록되었습니다.");
			model.addAttribute("url", "/admin/qnaReply");
		}
		else if(msgFlag.equals("regQnaReplyFail")) {
			model.addAttribute("msg", "Q&A 답변 등록 실패하였습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/admin/qnaReply");
		}
		else if(msgFlag.equals("verifyPwdFail")) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/verifyPwd");
		}
		else if(msgFlag.equals("EditMemberInfoSuccess")) {
			model.addAttribute("msg", "회원정보가 수정되었습니다.");
			model.addAttribute("url", "/member/mypage");
		}
		else if(msgFlag.equals("EditMemberInfoFail")) {
			model.addAttribute("msg", "회원정보 수정 실패하였습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/memberInfoEdit");
		}
		else if(msgFlag.equals("EditPwdFail")) {
			model.addAttribute("msg", "비밀번호 수정 실패하였습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/verifyPwd");
		}
		else if(msgFlag.equals("pwdNotEqual")) {
			model.addAttribute("msg", "현재 비밀번호가 일치하지 않습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/verifyPwd");
		}
		else if(msgFlag.equals("memberDelSuccess")) {
			model.addAttribute("msg", "삭제가 완료되었습니다.\\n이용해주셔서 감사합니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memberDelFail")) {
			model.addAttribute("msg", "회원 탈퇴 실패하였습니다.\\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/mypage");
		}
		else if(msgFlag.equals("memberLevelUpSuccess")) {
			model.addAttribute("msg", "VIP님 환영합니다.");
			model.addAttribute("url", "/member/mypage");
		}
		else if(msgFlag.equals("memberLevelUpFail")) {
			model.addAttribute("msg", "오류가 발생하였습니다. \\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/vipAd");
		}
		else if(msgFlag.equals("setStoreMapSuccess")) {
			model.addAttribute("msg", "등록되었습니다.");
			model.addAttribute("url", "/admin/storeMap");
		}
		else if(msgFlag.equals("setStoreMapFail")) {
			model.addAttribute("msg", "등록 실패하였습니다. \\n다시 시도하여주십시오.");
			model.addAttribute("url", "/admin/storeMap");
		}
		else if(msgFlag.equals("setReviewSuccess")) {
			model.addAttribute("msg", "등록되었습니다.");
			model.addAttribute("exit", "1");
		}
		else if(msgFlag.equals("setReviewFail")) {
			model.addAttribute("msg", "등록 실패하였습니다. \\n다시 시도하여주십시오.");
			model.addAttribute("url", "/member/myPayment");
		}
		
		return "include/message";
	}
}
