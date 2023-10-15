package com.spring.javaweb13S;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaweb13S.pagination.PageProcess;
import com.spring.javaweb13S.pagination.PageVO;
import com.spring.javaweb13S.service.AdminService;
import com.spring.javaweb13S.vo.CategoryVO;
import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.ProductImgVO;
import com.spring.javaweb13S.vo.ProductVO;
import com.spring.javaweb13S.vo.QnaVO;
import com.spring.javaweb13S.vo.StoreMapVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	PageProcess pageProcess;

	@RequestMapping(value="/adminMain", method=RequestMethod.GET)
	public String adminMainGet() {
		return "/admin/adminMain";
	}
	@RequestMapping(value="/memberList", method=RequestMethod.GET)
	public String memberGet(Model model,
//			@RequestParam(name="uid", defaultValue = "", required = false) String uid,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="searchSw", defaultValue = "", required = false) String searchSw,
			@RequestParam(name="searchItem", defaultValue = "", required = false) String searchItem
		) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "member", searchSw, searchItem);
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		vos = adminService.getMemberList(pageVO.getStartIndexNo(), pageSize, searchSw, searchItem);
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("searchSw", searchSw);
		model.addAttribute("searchItem", searchItem);
		
		return "/admin/memberList";
	}
	
	@ResponseBody
	@RequestMapping(value="/memberLevelChange", method=RequestMethod.POST)
	public int memberLevelChangePost(
			@RequestParam(name="level", defaultValue = "", required = false) int level,
			@RequestParam(name="idx", defaultValue = "1", required = false) int idx
			) {
		int res = adminService.setMemberLevelUpdate(idx, level);;
		
		return res;
	}
	
	@ResponseBody
	@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
	public void memberDeletePost(
			@RequestParam(name="idx", defaultValue = "1", required = false) int idx
			) {
		adminService.setMemberDelete(idx);
	}
	
	//카테고리 리스트 가져오기
	@RequestMapping(value="/category", method=RequestMethod.GET)
	public String categoryGet(Model model,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "7", required = false) int pageSize,
			@RequestParam(name="searchSw", defaultValue = "", required = false) String searchSw,
			@RequestParam(name="searchItem", defaultValue = "", required = false) String searchItem
			) {
		System.out.println(searchSw + searchItem);
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "topCategory", searchSw, searchItem);
		ArrayList<CategoryVO> vos = new ArrayList<CategoryVO>();
		vos = adminService.getCategoryList(pageVO.getStartIndexNo(), pageSize, searchSw, searchItem);
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		
		return "admin/category";
	}
	
	// 카테고리 등록
	@RequestMapping(value="/category", method=RequestMethod.POST)
	public String categoryPost(
			@RequestParam(name="categoryCode", defaultValue = "", required = false) String categoryCode,
			@RequestParam(name="categoryName", defaultValue = "", required = false) String categoryName
			) {
		int res = 0;
		
		categoryCode = categoryCode.toUpperCase();
		res = adminService.setCategory(categoryCode, categoryName);
		
		if(res == 1) {
			return "redirect:/message/categorySuccess";
		}
		else {
			return "redirect:/message/categoryFail";
		}
	}
	
	// 카테고리 삭제
	@ResponseBody
	@RequestMapping(value="/categoryDelete", method=RequestMethod.POST)
	public String categoryDeletePost(
			@RequestParam(name="idx", defaultValue = "", required = false) int idx) {
		adminService.setCategoryDelete(idx);
		
		return "";
	}
	
	//상품 등록페이지 연결
	@RequestMapping(value="/regProduct", method=RequestMethod.GET)
	public String regProductGet(Model model) {
		
		ArrayList<CategoryVO> vos = new ArrayList<CategoryVO>();
		vos = adminService.getCategoryList(0, 0, "", "");
		
		model.addAttribute("vos", vos);
		
		return "admin/regProduct";
	}
	
	//ckeditor 상품 업로드
	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
	public void imageUploadPost(MultipartFile upload, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("TEXT/HTML , CHARSET=UTF-8");
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/admin/product/content/");
		String oriFileName = upload.getOriginalFilename();
		
		byte[] bytes = upload.getBytes();
		FileOutputStream fos = new FileOutputStream(new File(uploadPath + oriFileName));
		fos.write(bytes);
		
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/resources/data/admin/product/" + oriFileName;
		out.print("{\"originalFilename\":\""+oriFileName+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");
		
		out.flush();		
		fos.close();
	}
	
	
	@RequestMapping(value="regProduct", method=RequestMethod.POST)
	public String regProductPost(ProductVO vo, MultipartFile file) {
		
		int res = adminService.imgChkNProductInput(file, vo);
		
		if(res == 1) {
			return "redirect:/message/regProductSuccess";
		}
		else {
			return "redirect:/message/regProductFail";
		}
	}
	@RequestMapping(value="/productList", method=RequestMethod.GET)
	public String productListGet(Model model,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="searchSw", defaultValue = "", required = false) String searchSw,
			@RequestParam(name="searchItem", defaultValue = "", required = false) String searchItem
		) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "product", searchSw, searchItem);
		ArrayList<ProductVO> vos = new ArrayList<ProductVO>();
		vos = adminService.getProductList(pageVO.getStartIndexNo(), pageSize, searchSw, searchItem, "");
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("searchSw", searchSw);
		model.addAttribute("searchItem", searchItem);
		
		return "/admin/productList";
	}
	@ResponseBody
	@RequestMapping(value="/productStateChange", method=RequestMethod.POST)
	public int productStateChangePost(
			@RequestParam(name="idx", defaultValue = "1", required = false) int idx,
			@RequestParam(name="switchItem", defaultValue = "", required = false) int switchItem
			) {
		int res = adminService.productStateChange(idx, switchItem);
		
		return res;
	}
	
	@ResponseBody
	@RequestMapping(value="/productDelete", method=RequestMethod.POST)
	public String productDeletePost(
			@RequestParam(name="idx", defaultValue = "1", required = false) int idx
			) {
		adminService.productDelete(idx);
		
		return "";
	}
	
	@RequestMapping(value="/productUpdate", method=RequestMethod.GET)
	public String productUpdateGet(Model model, ProductVO vo,
			@RequestParam(name="idx", defaultValue = "1", required = false) int idx
			) {
		ArrayList<CategoryVO> vos = new ArrayList<CategoryVO>();
		vos = adminService.getCategoryList(0, 0, "", "");
		
		vo = adminService.getProductContent(idx);
		
		model.addAttribute("vos", vos);
		model.addAttribute("vo", vo);
		
		return "admin/productUpdate";
	}
	
//	미완성
	@RequestMapping(value="/productUpdate", method=RequestMethod.POST)
	public String productUpdatePost(ProductVO vo, MultipartFile file) {
		int res = 0;
		int res2 = 0;
		
//		res = adminService.imgChkNProductInput(file, vo);
		
		res2 = adminService.setProductUpdate(vo);
		
		if(res == 1 && res2 == 1) {
			return "redirect:/message/setProductSuccess";
		}
		else {
			return "redirect:/message/setProductFail";
		}
	}
	
	@RequestMapping(value="/productImg", method=RequestMethod.GET)
	public String productImgInputGet() {
		return "admin/productImg";
	}
	
	@RequestMapping(value="/productImg", method=RequestMethod.POST)
	public String productImgInputPost(MultipartHttpServletRequest file, ProductImgVO vo,
			@RequestParam(name="sw", defaultValue = "0", required = false)int sw
			) {
		if(sw == 1) {
			int res = adminService.setFile(vo, file, sw);
			if(res==1) {
				return "redirect:/message/productImgSuccess";
			}
			else {
				return "redirect:/message/productImgFail";
			}
		}
		else {
			int res = adminService.setFile(vo, file, sw);
			if(res==1) {
				return "redirect:/message/productVideoSuccess";
			}
			else {
				return "redirect:/message/productVideoFail";
			}
		}
	}
	
	@RequestMapping(value="/qnaReply", method=RequestMethod.GET)
	public String qnaReplyGet(Model model,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag
			) {
		
		PageVO pageVO = pageProcess.totRecCnt(pag, 10, "qnaReply", "", "");
		model.addAttribute("pageVO", pageVO);
		
		ArrayList<QnaVO> vos = new ArrayList<QnaVO>();
		vos = adminService.getQnaNoReply(pageVO.getStartIndexNo(), 10);
		model.addAttribute("vos", vos);
		
		return "admin/qnaReply";
	}
	@RequestMapping(value="/qnaReply", method=RequestMethod.POST)
	public String qnaReplyPost(
			@RequestParam(name="idx", defaultValue = "1", required = false) int idx,
			@RequestParam(name="productIdx", defaultValue = "1", required = false) int productIdx,
			@RequestParam(name="textContent", defaultValue = "", required = false) String textContent
			) {
		int res = 0;
		int res2 = 0;
		res = adminService.setQnaReply(idx, productIdx, textContent);
		if(res == 1) {
			res2 = adminService.setQnaUpdate(idx);
			if(res2 == 1) {
				return "redirect:/message/regQnaReplySuccess";
			}
			else {
				return "redirect:/message/regQnaReplyFail";
			}
		}
		else {
			return "redirect:/message/regQnaReplyFail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/qnaDelete", method=RequestMethod.POST)
	public String qnaDeletePost(
			@RequestParam(name = "idx", defaultValue = "0", required = false) int idx
			) {
		adminService.setQnaDelete(idx);
		
		return "1"; 
	}
	
	@RequestMapping(value="/storeMap", method=RequestMethod.GET)
	public String storeMapGet(Model model) {
		
		ArrayList<StoreMapVO> vos = new ArrayList<StoreMapVO>();
		vos = adminService.getStoreMap(); 
		
		model.addAttribute("vos", vos);
		
		return "admin/storeMap";
	}
	
	@RequestMapping(value="/storeMap", method=RequestMethod.POST)
	public String storeMapPost(
			@RequestParam(name = "locationName", defaultValue = "", required = false) String locationName,
			@RequestParam(name = "addr", defaultValue = "", required = false) String addr,
			@RequestParam(name = "locationTel", defaultValue = "", required = false) String locationTel,
			@RequestParam(name = "locationText", defaultValue = "", required = false) String locationText,
			@RequestParam(name = "coordsTemp", defaultValue = "", required = false) String coordsTemp
			) {
		int res = 0;
		res = adminService.setStoreMap(locationName, addr, locationTel, locationText, coordsTemp);
		if(res == 1) {
			return "redirect:/message/setStoreMapSuccess";
		}
		else {
			return "redirect:/message/setStoreMapFail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/storeMapDelete", method=RequestMethod.POST)
	public String storeMapDeletePost(
			@RequestParam(name = "idx", defaultValue = "0", required = false) int idx
			) {
		adminService.setStoreMapDelete(idx);
		return "";
	}
	
}