package com.spring.javaweb13S;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaweb13S.pagination.PageProcess;
import com.spring.javaweb13S.pagination.PageVO;
import com.spring.javaweb13S.service.AdminService;
import com.spring.javaweb13S.service.StoreService;
import com.spring.javaweb13S.vo.AvgReviewVO;
import com.spring.javaweb13S.vo.CartVO;
import com.spring.javaweb13S.vo.CategoryVO;
import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.ProductImgVO;
import com.spring.javaweb13S.vo.ProductVO;
import com.spring.javaweb13S.vo.QnaReplyVO;
import com.spring.javaweb13S.vo.QnaVO;
import com.spring.javaweb13S.vo.ReviewVO;
import com.spring.javaweb13S.vo.WatchListVO;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value="/storeMain", method=RequestMethod.GET)
	public String StoreMainGet(Model model,
			@RequestParam(name="code", defaultValue = "", required = false) String code,
			@RequestParam(name="p", defaultValue = "", required = false) String p,
			@RequestParam(name="catN", defaultValue = "전체", required = false) String catN
			) {
		
		ArrayList<ProductVO> vos = new ArrayList<ProductVO>();
		if(code.equals("ALL")) code = "";
		
		vos = adminService.getProductList(0, 0, "categoryCode", code, p);
		int productCount = adminService.getProductCount("categoryCode", code);
		model.addAttribute("productCount", productCount);
		model.addAttribute("catN", catN);
		model.addAttribute("vos", vos);

		if(code.equals("")) code = "ALL";
		model.addAttribute("code", code);
		
		ArrayList<CategoryVO> vosc = new ArrayList<CategoryVO>();
		vosc = adminService.getCategoryList(0, 0, "", "");
		model.addAttribute("vosc", vosc);
		
		return "store/storeMain";
	}
	
	@RequestMapping(value="/storeContent", method=RequestMethod.GET)
	public String StoreContentGet(Model model, HttpSession session,
			@RequestParam(name="idx", defaultValue="1", required = false) int idx,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="searchItem", defaultValue = "", required = false) String searchItem
			) {
		
		ProductVO vo = new ProductVO();
		vo = storeService.getProductInfo(idx);
		model.addAttribute("vo", vo);
		
		ArrayList<ProductImgVO> vos = new ArrayList<ProductImgVO>();
		vos = adminService.getProductImg(vo.getProductCode());
		model.addAttribute("vos", vos);

		ProductImgVO vov = new ProductImgVO();
		vov = adminService.getProductVideo(vo.getProductCode());
		if(vov != null) model.addAttribute("vov", vov);
		
		String tempIdx = idx + ""; 
		// tempIdx 사용 조심;
		PageVO pageQnaVO = pageProcess.totRecCnt(pag, 10, "qna", tempIdx, searchItem);
		ArrayList<QnaVO> vosQ = new ArrayList<QnaVO>();
		vosQ = storeService.getQnaInfo(pageQnaVO.getStartIndexNo(), 10, idx, searchItem);
		model.addAttribute("vosQ", vosQ);
		model.addAttribute("pageQnaVO", pageQnaVO);
		model.addAttribute("searchItem",searchItem);
		
		ArrayList<QnaReplyVO> vosQR = new ArrayList<QnaReplyVO>();
		vosQR = storeService.getQnaReplyInfo(idx);
		model.addAttribute("vosQR", vosQR);
		
		
		PageVO pageReviewVO = pageProcess.totRecCnt(pag, 5, "review", tempIdx, "");
		ArrayList<ReviewVO> vosReview = new ArrayList<ReviewVO>();
		vosReview = storeService.getReviewInfo(pageReviewVO.getStartIndexNo(), 5, idx, "");
		AvgReviewVO voAvgReview = storeService.getAvgReview(idx);
		model.addAttribute("vosReview", vosReview);
		model.addAttribute("voAvgReview", voAvgReview);
		model.addAttribute("pageReviewVO", pageReviewVO);
		
		int heart = 0;
		String uid = (String)session.getAttribute("sUid");
		WatchListVO vow = storeService.getWatchList(uid, vo.getIdx());
		
		if(vow != null) heart = 1;
		else heart = 0;
		
		model.addAttribute("heart", heart);
		return "store/storeContent";
	}
	
	@RequestMapping(value="/storeContent", method=RequestMethod.POST)
	public String storeContentPost(HttpSession session, CartVO cartVO,
			@RequestParam(name="idx", defaultValue="1", required=false) int idx,
			@RequestParam(name="count", defaultValue="1", required=false) int count
			) {
		int res = 0;
		String uid = (String) session.getAttribute("sUid");
		
		cartVO = storeService.getSearchCartInfo(idx, uid);
		
		ProductVO vo = storeService.getProductInfo(idx);
		int price = count * vo.getProductDiscountPrice();
		
		if(cartVO == null) {
			res = storeService.setCartItem(idx, uid, count, vo.getProductName(), price, vo.getPoint(), vo.getFName());
			int cnt = storeService.getCartCnt(uid);
			session.setAttribute("sCnt", cnt);
			
			if(res == 1) {
				return "redirect:/message/setCartSuccess";
			}
			else {
				return "redirect:/message/setCartFail?idx="+idx;
			}
		}
		else {
			res = storeService.updateCartQuantity(idx, uid, count, vo.getProductDiscountPrice());
			if(res == 1) {
				return "redirect:/message/setCartSuccess";
			}
			else {
				return "redirect:/message/setCartFail?idx="+idx;
			}
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/cartDirect", method=RequestMethod.POST)
	public int CartDirectPost(HttpSession session, CartVO cartVO,
			@RequestParam(name="idx", defaultValue="1", required=false) int idx
			) {
		int res = 0;
		int quantity = 1;
		String uid = (String) session.getAttribute("sUid");
		cartVO = storeService.getSearchCartInfo(idx, uid);
		ProductVO vo = storeService.getProductInfo(idx);
		int price = quantity * vo.getProductDiscountPrice();
		if(cartVO == null) {
			res = storeService.setCartItem(idx, uid, quantity, vo.getProductName(), price, vo.getPoint(), vo.getFName());
			int cnt = storeService.getCartCnt(uid);
			session.setAttribute("sCnt", cnt);
		}
		else {
			res = storeService.updateCartQuantity(idx, uid, quantity, vo.getProductDiscountPrice());
		}
		
		return res;
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String cartGet(HttpSession session, Model model) {
		
		String uid = (String)session.getAttribute("sUid");
		
		ArrayList<ProductVO> vos = new ArrayList<ProductVO>();
		vos = storeService.getCartList(uid);
		model.addAttribute("vos", vos);
		
		int cnt = storeService.getCartCnt(uid);
		session.setAttribute("sCnt", cnt);
		
		return "store/cart";
	}
	
	@ResponseBody
	@RequestMapping(value="/addWatchList", method=RequestMethod.POST)
	public int addWatchListPost(HttpSession session,
			@RequestParam(name="idx", defaultValue="0", required=false) int idx
			) {
		int res = 0;
		
		String uid = (String) session.getAttribute("sUid");
		
		ProductVO vo = storeService.getProductInfo(idx);
		
		WatchListVO vow = storeService.getWatchList(uid, idx);
		if(vow == null) {
			res = storeService.setWatchList(uid, idx, vo.getProductName(), vo.getPrice(), vo.getDiscountRate(), vo.getFName());
		}
		else {
			storeService.setWatchListDelete(idx, uid);
			res = 2;
		}
		
		
		return res;
	}
	
	@RequestMapping(value="/payment", method=RequestMethod.GET)
	public String paymentGet(HttpSession session, Model model,
			@RequestParam(name="cartIdxChk", defaultValue ="", required = false)String cartIdxChk,
			@RequestParam(name="finalPrice", defaultValue ="", required = false) int finalPrice,
			@RequestParam(name="pointChk", defaultValue ="", required = false) int pointChk,
			@RequestParam(name="quantity", defaultValue ="", required = false) String quantity
			) {
		
		ArrayList<CartVO> vos = new ArrayList<CartVO>();
		
		String[] arr = cartIdxChk.split("/");
		for(int i=0; i<arr.length; i++) {
			vos.add(storeService.getPaymentList(arr[i]));
		}
		model.addAttribute("vos", vos);
		model.addAttribute("finalPrice", finalPrice);
		model.addAttribute("pointChk", pointChk);
		model.addAttribute("quantity", quantity);
		
		String uid = (String) session.getAttribute("sUid");
		MemberVO memberVO = storeService.getMemberInfo(uid);
		if(memberVO.getName() == null) memberVO.setName("000");
		if(memberVO.getTel() == null) memberVO.setTel("000-0000-0000");
		if(memberVO.getEmail() == null) memberVO.setEmail("user@temp.com");
		if(memberVO.getAddress() == null) memberVO.setAddress("주소없음");
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("cartIdxChk", cartIdxChk);
		return "store/payment";
	}
	
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public String paymentPost(Model model, HttpSession session,
			@RequestParam(name="amount", defaultValue ="1", required = false)int amount,
			@RequestParam(name="pointUsage", defaultValue ="0", required = false)int pointUsage,
			@RequestParam(name="productIdx_bag", defaultValue ="", required = false)String productIdx_bag,
			@RequestParam(name="buyer_name", defaultValue ="", required = false)String buyer_name,
			@RequestParam(name="buyer_email", defaultValue ="", required = false)String buyer_email,
			@RequestParam(name="buyer_tel", defaultValue ="", required = false)String buyer_tel,
			@RequestParam(name="buyer_addr", defaultValue ="", required = false)String buyer_addr,
			@RequestParam(name="buyer_postcode", defaultValue ="", required = false)String buyer_postcode,
			@RequestParam(name="merchant_uid", defaultValue ="", required = false)String merchant_uid,
			@RequestParam(name="memo", defaultValue ="", required = false)String memo
			) {
		String uid = (String) session.getAttribute("sUid");
		
		String[] arr = productIdx_bag.split("/");
		for(int i=0; i<arr.length; i++) {
			CartVO vo = storeService.getCartInfo(arr[i]);
			storeService.setOrderInfo(vo.getProductIdx(), vo.getProductName(), vo.getPrice(), vo.getFName(),
					vo.getQuantity(), vo.getPoint(), merchant_uid, uid, amount, pointUsage, buyer_name,
					buyer_email, buyer_tel, buyer_addr, buyer_postcode, memo);
			storeService.setCartDeleteByOrder(arr[i]);
		}
		int cartCnt = storeService.getCartCnt(uid);
		session.setAttribute("sCnt", cartCnt);
		
		storeService.updateMemberPoint(pointUsage, uid);
		
		return "redirect:/member/myPayment";
	}
	
	@ResponseBody
	@RequestMapping(value="/cartDelete", method=RequestMethod.POST)
	public int cartDeletePost(
			@RequestParam(name="idx", defaultValue="0", required=false) int idx
			) {
		int res = 0;
		res = storeService.setCartDelete(idx);
		return res;
	}
	
	@RequestMapping(value="/customerInfo", method=RequestMethod.GET)
	public String customerInfoGet() {
		return "store/customerInfo";
	}
	
	@RequestMapping(value="/shippingInfo", method=RequestMethod.GET)
	public String shippingInfoGet() {
		return "store/shippingInfo";
	}
	
	@RequestMapping(value="/regQNA", method=RequestMethod.GET)
	public String regQNAGet(Model model,
			@RequestParam(name="idx", defaultValue="1", required=false) int idx
			) {
		model.addAttribute("idx", idx);
		return "store/regQNA";
	}
	@RequestMapping(value="/regQNA", method=RequestMethod.POST)
	public String regQNAPost(HttpSession session,
			@RequestParam(name="productIdx", defaultValue="1", required=false) int productIdx,
			@RequestParam(name="content", defaultValue="", required=false) String content,
			@RequestParam(name="hostIP", defaultValue="", required=false) String hostIP,
			@RequestParam(name="QnaSW", defaultValue="1", required=false) int QnaSW
			) {
		String uid = (String) session.getAttribute("sUid");
		ProductVO vo = storeService.getProductInfo(productIdx);
		
		int res = 0;
		res = storeService.setQnAInfo(uid, productIdx, vo.getProductName(), content, QnaSW, hostIP, vo.getFName());
		if(res == 1) return "redirect:/message/regQNASuccess?idx="+productIdx;
		else return "redirect:/message/regQNAFail?idx="+productIdx;
	}
	
	@RequestMapping(value="/regReview", method=RequestMethod.GET)
	public String regReviewGet(Model model,
			@RequestParam(name="productIdx", defaultValue="0", required=false) int productIdx
			) {
		ProductVO vo = storeService.getProductInfo(productIdx);
		model.addAttribute("vo", vo);
		
		return "store/regReview";
	}
	
	@RequestMapping(value="/regReview", method=RequestMethod.POST)
	public String regReviewPost(HttpSession session,
			@RequestParam(name="fName", defaultValue="0", required=false) String FName,
			@RequestParam(name="productIdx", defaultValue="0", required=false) int productIdx,
			@RequestParam(name="productTitle", defaultValue="", required=false) String productTitle,
			@RequestParam(name="content", defaultValue="", required=false) String content,
			@RequestParam(name="result1Value", defaultValue="1", required=false) int result1Value,
			@RequestParam(name="result2Value", defaultValue="1", required=false) int result2Value,
			@RequestParam(name="result3Value", defaultValue="1", required=false) int result3Value,
			@RequestParam(name="result4Value", defaultValue="1", required=false) int result4Value,
			@RequestParam(name="hostIP", defaultValue="", required=false) String hostIP
			) {
		String uid = (String) session.getAttribute("sUid");
		int res = 0;
		int randomNum = (int) (Math.random()*28)+1;

		res = storeService.setReviewInfo(productIdx, productTitle, content, uid, result1Value, result2Value, result3Value, result4Value, FName, hostIP, randomNum);
		
		if (res ==1) {
			return "redirect:/message/setReviewSuccess";
		}
		else {
			return "redirect:/message/setReviewFail";
		}
	}
	
}
