package com.spring.javaweb13S;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaweb13S.service.MemberService;
import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.OrderVO;
import com.spring.javaweb13S.vo.WatchListVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	JavaMailSender mailSender;

	//회원가입창 띄우기
	@RequestMapping(value = "/memberJoin", method = RequestMethod.GET)
	public String memberJoinGet() {
		return "member/memberJoin";
	}
	
	//아이디 실시간 중복 검사(ajax)
	@ResponseBody
	@RequestMapping(value = "/uidCheck", method = RequestMethod.POST)
	public int uidCheckPost(
			@RequestParam(name="uid", defaultValue = "", required=false) String uid) {
		int res = 0;
		MemberVO vo = memberService.getMemberIdCheck(uid);
		if(vo == null) res = 1;
		return res;
	}
	
	//이메일 실시간 중복 검사(ajax)
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public int emailCheckPost(
			@RequestParam(name="email", defaultValue = "", required=false) String email) {
		int res = 0;
		MemberVO vo = memberService.getMemberVOfrom(email);
		if(vo == null) res = 1;
		return res;
	}
	
	//회원가입(DB 저장)
	@RequestMapping(value="/memberJoin", method=RequestMethod.POST)
	public String memberJoinPost(MemberVO vo) {

		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		String uuid = "USER_" + UUID.randomUUID().toString().substring(0,8);
		vo.setNickName(uuid);
		
		int res = memberService.setMemberJoin(vo);
		
		if(res == 1) return "redirect:/message/memberJoinSuccess";
		else return "redirect:/message/memberJoinFail";
	}
	
	//로그인 화면으로 이동(쿠키 존재시 아이디 전송)
	@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
	public String memberLoginGet(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cUid")) {
					request.setAttribute("uid", cookies[i].getValue());
					break;
				}
			}
		}
		return "member/memberLogin";
	}
	
	// 로그인 (
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
	public String memberLoginPost(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(name="uid", defaultValue = "", required=false) String uid,
			@RequestParam(name="pwd", defaultValue = "", required=false) String pwd,
			@RequestParam(name="chk_id", defaultValue = "", required=false) String chk_id
			) {
		MemberVO vo = memberService.getMemberIdCheck(uid);
		if(vo != null && vo.getUserDel().equals("NO") && passwordEncoder.matches(pwd, vo.getPwd())) {
			String strLevel = "";
			
			if(vo.getLevel() == 0) strLevel = "관리자";
			else if(vo.getLevel() == 1) strLevel = "VIP";
			else if(vo.getLevel() == 2) strLevel = "회원";
			
			session.setAttribute("sUid", vo.getUid());
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("strLevel", strLevel);
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sPoint", vo.getPoint());
			
			memberService.setMemberDateUpdate(uid);
			
			if(chk_id.equals("on")) {
				Cookie cookie = new Cookie("cUid", uid);
				cookie.setMaxAge(60*60*24*3);
				response.addCookie(cookie);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cUid")) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			String nickName = URLEncoder.encode(vo.getNickName());
			return "redirect:/message/memberLoginSuccess?nickName="+nickName;
		}
		else return "redirect:/message/memberLoginFail";
	}
	
	//아이디 찾기
	@RequestMapping(value="/memberIdSearch", method=RequestMethod.GET)
	public String memberIdSearchGet() {
		return "member/memberIdSearch";
	}
	
	//아이디 찾기(이메일 처리 + 인증번호)
	@RequestMapping(value="/memberIdSearch", method=RequestMethod.POST)
	public String memberIdSearchPost(HttpSession session, Model model,
			@RequestParam(name="IdFindFlag", defaultValue="", required=false) String IdFindFlag,
			@RequestParam(name="IdFound", defaultValue="", required=false) String IdFound,
			@RequestParam(name="email-input", defaultValue="", required=false) String email) throws MessagingException {
		
		if(IdFindFlag.equals("1")) {
			MemberVO vo = memberService.getMemberVOfrom(email);
			if(vo != null) {
				String uuid = UUID.randomUUID().toString().substring(0,6);
				session.setAttribute("sUuid", uuid);
				session.setAttribute("sIdFound", vo.getUid());
				session.setMaxInactiveInterval(60*3);
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				String title = "[레고 쇼핑몰] 아이디 찾기 인증번호를 안내해드립니다.";
				
				String content = "";
				content += "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"440px\">";
				content += "<tr><td style=\"font-size: 22px; height: 80px;\"><b>레고 사이트 인증번호를 안내드립니다.</b></td></tr>";
				content += "<tr><td style=\"font-size: 16px; \">본 메일은 본인 확인을 위해 자동으로 발송되는 메일입니다.</td></tr>";
				content += "<tr><td style=\"font-size: 16px; height: 30px; border-bottom: 2rem solid; border-color: transparent;\">아래 인증번호를 확인해 이메일 주소 인증을 완료해주세요.</td></tr>";
				content += "<tr><td style=\"font-size: 20px; background-color: #eee; padding: 13px;\">인증번호 : <span style=\"font-size: 24px; color:#333; font-weight: 800; text-decoration: underline;\">"+uuid+"</span></td></tr>";
				content += "</table>";
				
				messageHelper.setTo(vo.getEmail());
				messageHelper.setSubject(title);
				messageHelper.setText(content, true);
				
				mailSender.send(message);
				
				return "redirect:/message/uidMailSendSuccess";
			}
			else {
				return "redirect:/message/uidMailSendFail";
			}
		}
		else {
			session.invalidate();
			if(IdFindFlag.equals(email)) {
				if(IdFound.length() <= 8 && IdFound.length() > 4) {
					IdFound = IdFound.substring(0, IdFound.length()-2) + "**";
				}
				else if(IdFound.length() > 8) {
					IdFound = IdFound.substring(0, IdFound.length()-4) + "****";
				}
				model.addAttribute("IdFound", IdFound);
				
				return "member/memberIdView";
			}
			else {
				return "redirect:/message/uidMailUnmatch";
			}
		}
	}
	@RequestMapping(value="/memberIdView", method=RequestMethod.GET)
	public String memberIdViewGet() {
		return "member/memberIdView";
	}
	@RequestMapping(value="/memberPwdSearch", method=RequestMethod.GET)
	public String memberPwdSearchGet() {
		return "member/memberPwdSearch";
	}
	@RequestMapping(value="/memberPwdSearch", method=RequestMethod.POST)
	public String memberPwdSearchPost(
			@RequestParam(name="uid-input", defaultValue="", required=false) String uid,
			@RequestParam(name="email-input", defaultValue="", required=false) String email
			) throws MessagingException {
		MemberVO vo = memberService.getMemberIdCheck(uid);
		if(vo != null) {
			//비교 성공, 메일 보내기
			if(email.equals(vo.getEmail())) {
				String tempPwd = UUID.randomUUID().toString().substring(0,8);
				memberService.setMemberTempPwdUpdate(uid, passwordEncoder.encode(tempPwd));
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				String title = "[레고 쇼핑몰] 임시비밀번호를 안내해드립니다.";
				
				String content = "";
				content += "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"550px\" >";
				content += "<tr><td style=\"font-size: 22px; height: 100px; \"><b>"+uid+"님 레고 사이트의<br> 임시비밀번호는 아래와 같습니다</br></td></tr>";
				content += "<tr><td style=\"font-size: 18px; background-color: #eee; padding: 10px;\">임시비밀번호 : <span style=\"color:#333; font-weight: 800; font-size: 22px;\">"+tempPwd+"</span></td></tr>";
				content += "<tr><td style=\"font-size: 16px; border-top: 2.0rem solid; border-bottom: 0.5rem solid; border-color: transparent;\">본 메일은 발신 전용입니다.</td></tr>";
				content += "<tr><td style=\"font-size: 16px; height: 30px;\">임시비밀번호로 로그인 후 회원정보 수정에서 비밀번호를 변경하여주십시오.</td></tr>";
				content += "</table>";
				
				messageHelper.setTo(vo.getEmail());
				messageHelper.setSubject(title);
				messageHelper.setText(content, true);
				
				mailSender.send(message);
				
				return "redirect:/message/PwdMailSendSuccess";
				
			}
			//이메일이 받아온 회원정보와 다를 경우
			else return "redirect:/message/memberPwdSearchFailE";
		}
		//아이디를 찾을 수 없는 경우
		else return "redirect:/message/memberPwdSearchFail";
	}
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/memberLogout", method = RequestMethod.GET)
	public String memberLogoutGet(HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		String uid = (String) session.getAttribute("sUid");
		
		memberService.setMemberDateUpdate(uid);
		
		session.invalidate();
		String encNickName = URLEncoder.encode(nickName);
		return "redirect:/message/memberLogout?nickName="+encNickName;
	}
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypageGet(HttpSession session, Model model) {
		String uid = (String) session.getAttribute("sUid");
		
		MemberVO vo = memberService.getMemberIdCheck(uid);
		model.addAttribute("vo", vo);
		
		return "member/mypage";
	}
	
	@RequestMapping(value="/watchList", method=RequestMethod.GET)
	public String watchListGet(HttpSession session, Model model) {
		
		String uid = (String) session.getAttribute("sUid");
		
		ArrayList<WatchListVO> vos = new ArrayList<WatchListVO>();
		
		vos = memberService.getWatchList(uid);
		model.addAttribute("vos", vos);
		
		return "member/watchList";
	}
	
	@RequestMapping(value="/verifyPwd", method=RequestMethod.GET)
	public String verifyPwdGet(Model model,
			@RequestParam(name="SW", defaultValue = "", required=false) String SW
			) {
		model.addAttribute("SW",SW);
		return "member/verifyPwd";
	}
	
	@RequestMapping(value="/verifyPwd", method=RequestMethod.POST)
	public String verifyPwdPost(HttpSession session,
			@RequestParam(name="pwd", defaultValue = "", required=false) String pwd,
			@RequestParam(name="SW", defaultValue = "", required=false) String SW
			) {
		String uid = (String) session.getAttribute("sUid");
		MemberVO vo = memberService.getMemberIdCheck(uid);
		
		if(passwordEncoder.matches(pwd, vo.getPwd())) {
			if(SW.equals("0")) {
				return "redirect:/member/memberInfoEdit";
			}
			else {
				return "redirect:/member/memberPwdEdit";
			}
		}
		else {
			return "redirect:/message/verifyPwdFail";
		}
	}
	
	@RequestMapping(value="/memberInfoEdit", method=RequestMethod.GET)
	public String memberInfoEditGet(HttpSession session, Model model) {
		String uid = (String) session.getAttribute("sUid");
		MemberVO vo = memberService.getMemberIdCheck(uid);
		
		model.addAttribute("vo", vo);
		
		return "member/memberInfoEdit";
	}
	
	@RequestMapping(value="/memberInfoEdit", method=RequestMethod.POST)
	public String memberInfoEditPost(MemberVO memberVO) {
		int res = 0;
		res = memberService.setMemberUpdate(memberVO);
		if(res == 1) {
			return "redirect:/message/EditMemberInfoSuccess";
		}
		else {
			return "redirect:/message/EditMemberInfoFail";
		}
	}
	@RequestMapping(value="/memberPwdEdit", method=RequestMethod.GET)
	public String memberPwdEditGet() {
		return "member/memberPwdEdit";
	}
	@RequestMapping(value="/memberPwdEdit", method=RequestMethod.POST)
	public String memberPwdEditPost(HttpSession session,
			@RequestParam(name="pwdNow", defaultValue = "", required=false) String pwdNow,
			@RequestParam(name="pwdNew", defaultValue = "", required=false) String pwdNew
			) {
		String uid = (String) session.getAttribute("sUid");
		MemberVO vo = memberService.getMemberIdCheck(uid);
		int res = 0;
		if(passwordEncoder.matches(pwdNow, vo.getPwd())) {
			String pwdTemp = passwordEncoder.encode(pwdNew);
			res = memberService.setPwdUpdate(pwdTemp, vo.getUid());
			if(res == 1) {
				return "redirect:/message/EditMemberInfoSuccess";
			}
			else {
				return "redirect:/message/EditPwdFail";
			}
		}
		else {
			return "redirect:/message/pwdNotEqual";
		}
	}
	
	@RequestMapping(value="/memberDel", method=RequestMethod.GET)
	public String memberDelGet() {
		return "member/memberDel";
	}
	
	@RequestMapping(value="/memberDelOk", method=RequestMethod.GET)
	public String memberDelGet(HttpSession session) {
		String uid = (String) session.getAttribute("sUid");
		int res = 0;
		res = memberService.setMemberDelete(uid);
		if(res == 1) {
			session.invalidate();
			return "redirect:/message/memberDelSuccess";
		}
		else {
			return "redirect:/message/memberDelFail";
		}
	}
	
	@RequestMapping(value="/vipAd", method=RequestMethod.GET)
	public String vipAdGet() {
		return "member/vipAd";
	}
	@RequestMapping(value="/vipLevelUp", method=RequestMethod.GET)
	public String vipLevelUpGet(HttpSession session) {
		String uid = (String) session.getAttribute("sUid");
		int res = 0;
		res = memberService.setMemberLevelUp(uid);
		if(res == 1) {
			return "redirect:/message/memberLevelUpSuccess";
		}
		else {
			return "redirect:/message/memberLevelUpFail";
		}
	}
	
	@RequestMapping(value="/myPayment", method=RequestMethod.GET)
	public String myPaymentGet(HttpSession session, Model model) {
		
		String uid = (String) session.getAttribute("sUid");
		
		ArrayList<OrderVO> orderVOS = new ArrayList<OrderVO>();
		orderVOS = memberService.getOrderInfo(uid);
		
		ArrayList<OrderVO> orderCntVOS = new ArrayList<OrderVO>();
		orderCntVOS = memberService.getOrderCntInfo(uid);
		
		model.addAttribute("orderVOS",orderVOS);
		model.addAttribute("orderCntVOS",orderCntVOS);
		
		
		return "member/myPayment";
	}
}
