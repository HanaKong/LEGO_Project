package com.spring.javaweb13S;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaweb13S.service.StoreService;

@Controller
public class HomeController {
	
	@Autowired
	StoreService storeService;
	
	@RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		String uid = (String) session.getAttribute("sUid");
		
		int cnt = storeService.getCartCnt(uid);
		session.setAttribute("sCnt", cnt);
		
		return "home";
	}
	@RequestMapping(value = "/companyProfile", method = RequestMethod.GET)
	public String companyProfileGet() {
		return "companyProfile";
	}
	
	@ResponseBody
	@RequestMapping(value = "/favicon.ico")
	public void returnNoFavicon() {
		
	}
	
	
}
