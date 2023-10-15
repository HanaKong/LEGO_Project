package com.spring.javaweb13S;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaweb13S.service.CustomerService;
import com.spring.javaweb13S.vo.StoreMapVO;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value="/customerMain", method=RequestMethod.GET)
	public String customerMainGet() {
		return "customer/customerMain";
	}
	
	@RequestMapping(value="/aboutPrivacy", method=RequestMethod.GET)
	public String aboutPrivacyGet() {
		return "customer/aboutPrivacy";
	}
	
	@RequestMapping(value="/deliveryInfo", method=RequestMethod.GET)
	public String deliveryInfoGet() {
		return "customer/deliveryInfo";
	}
	
	@RequestMapping(value="/emailRequest", method=RequestMethod.GET)
	public String emailInquiryGet() {
		return "customer/emailRequest";
	}
	
	@RequestMapping(value="/storeLocation", method=RequestMethod.GET)
	public String storeLocationGet(Model model) {
			
		ArrayList<StoreMapVO> vos = new ArrayList<StoreMapVO>();
		vos = customerService.getStoreMap();
		
		model.addAttribute("vos", vos);
		
		return "customer/storeLocation";
	}
	
	@RequestMapping(value="/storeMapDetail", method=RequestMethod.GET)
	public String storeMapDetailGet(Model model,
			@RequestParam(name="idx", defaultValue = "0", required = false) int idx
			) {
		
		StoreMapVO vo = customerService.getStoreMapInfo(idx);
		
		model.addAttribute("vo", vo);
		
		int randomNum = (int) (Math.random()*15)+1;
		model.addAttribute("randomNum", randomNum);
		
		return "customer/storeMapDetail";
	}
}
