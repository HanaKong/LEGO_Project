package com.spring.javaweb13S.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaweb13S.dao.AdminDAO;
import com.spring.javaweb13S.vo.CategoryVO;
import com.spring.javaweb13S.vo.MemberVO;
import com.spring.javaweb13S.vo.ProductImgVO;
import com.spring.javaweb13S.vo.ProductVO;
import com.spring.javaweb13S.vo.QnaVO;
import com.spring.javaweb13S.vo.StoreMapVO;

import net.coobird.thumbnailator.Thumbnailator;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize, String searchSw, String searchItem) {
		return adminDAO.getMemberList(startIndexNo, pageSize, searchSw, searchItem);
	}

	@Override
	public int setMemberLevelUpdate(int idx, int level) {
		return adminDAO.setMemberLevelUpdate(idx, level);
	}

	@Override
	public void setMemberDelete(int idx) {
		adminDAO.setMemberDelete(idx);
	}

	@Override
	public ArrayList<CategoryVO> getCategoryList(int startIndexNo, int pageSize, String searchSw, String searchItem) {
		return adminDAO.getCategoryList(startIndexNo, pageSize, searchSw, searchItem);
	}

	@Override
	public int setCategory(String categoryCode, String categoryName) {
		return adminDAO.setCategory(categoryCode, categoryName);
	}

	@Override
	public void setCategoryDelete(int idx) {
		adminDAO.setCategoryDelete(idx);
		
	}

	@Override
	public int imgChkNProductInput(MultipartFile file, ProductVO vo) {
		int res = 0;
		try {
			String oriFileName = file.getOriginalFilename();
			
			vo.setFName(oriFileName);
			
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String realPath = request.getSession().getServletContext().getRealPath("/resources/data/admin/product/thumbnail/");
			File realFileName = new File(realPath + oriFileName);
			file.transferTo(realFileName);
			
			String thumbSaveName = realPath + oriFileName;
			File thumbnailFile = new File(thumbSaveName);
			
			int width = 320;
			int height = 240;
			
			Thumbnailator.createThumbnail(realFileName, thumbnailFile, width, height);
			
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		String content = vo.getContent();
		
		if(content.indexOf("src=\"/") == -1) return res;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/admin/product/");
		
		//			   0	 	 1		   2	 	 3		   4	
		//			   012345678901234567890123456789012345678901234567890
		// <img alt="" src="/javawebS13/data/admin/product/211229124318_4.jpg"
		
		int position = 36;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0, nextImg.indexOf("\""));
			
			String oriFilePath = uploadPath + imgFile;
			String copyFilePath = uploadPath + "imgDB/" + imgFile;
			
			fileCopyCheck(oriFilePath, copyFilePath);
			
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
		}
		vo.setContent(vo.getContent().replace("/data/admin/product/", "/data/admin/product/content/"));
		
		res = adminDAO.setProductInput(vo);
		
		return res;
	}
	
	private void fileCopyCheck(String oriFilePath, String copyFilePath) {
		try {
			FileInputStream  fis = new FileInputStream(new File(oriFilePath));
			FileOutputStream fos = new FileOutputStream(new File(copyFilePath));
			
			byte[] bytes = new byte[2048];
			int cnt = 0;
			while((cnt = fis.read(bytes)) != -1) {
				fos.write(bytes, 0, cnt);
			}
			fos.flush();
			fos.close();
			fis.close();		
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<ProductVO> getProductList(int startIndexNo, int pageSize, String searchSw, String searchItem, String p) {
		return adminDAO.getProductList(startIndexNo, pageSize, searchSw, searchItem, p);
	}

	@Override
	public int productStateChange(int idx, int switchItem) {
		return adminDAO.productStateChange(idx, switchItem);
	}

	@Override
	public void productDelete(int idx) {
		adminDAO.productDelete(idx);
		
	}

	@Override
	public ProductVO getProductContent(int idx) {
		return adminDAO.getProductContent(idx);
	}

	@Override
	public int setProductUpdate(ProductVO vo) {
		return adminDAO.setProductUpdate(vo);
	}

	@Override
	public int setFile(ProductImgVO vo, MultipartHttpServletRequest pFile, int sw) {
		int res = 0;
		try {
			List<MultipartFile> fileList = pFile.getFiles("file");
			
			for(MultipartFile file : fileList) {
				String oriFileName = file.getOriginalFilename();
				writeFile(file, oriFileName);
				
				vo.setFName(oriFileName);
				if(sw == 1) {
					res = adminDAO.setFile(vo);
				}
				else {
					res = adminDAO.setVideo(vo);
				}
			}
			
		} catch (Exception e) {
		}
		
		return res;
	}
	private void writeFile(MultipartFile file, String FileName) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/admin/product/content/imgDB/");
		
		FileOutputStream fos = new FileOutputStream(realPath + FileName);
		fos.write(data);
		fos.close();
	}

	@Override
	public ArrayList<ProductImgVO> getProductImg(int productCode) {
		return adminDAO.getProductImg(productCode);
	}

	@Override
	public ProductImgVO getProductVideo(int productCode) {
		return adminDAO.getProductVideo(productCode);
	}

	@Override
	public int getProductCount(String categoryCode, String code) {
		return adminDAO.getProductCount(categoryCode, code);
	}

	@Override
	public ArrayList<QnaVO> getQnaNoReply(int StartIndexNo, int pageSize) {
		return adminDAO.getQnaNoReply(StartIndexNo, pageSize);
	}

	@Override
	public int setQnaReply(int idx, int productIdx, String textContent) {
		return adminDAO.setQnaReply(idx, productIdx, textContent);
	}

	@Override
	public int setQnaUpdate(int idx) {
		return adminDAO.setQnaUpdate(idx);
	}

	@Override
	public void setQnaDelete(int idx) {
		adminDAO.setQnaDelete(idx);
	}

	@Override
	public int setStoreMap(String locationName, String addr, String locationTel, String locationText,
			String coordsTemp) {
		return adminDAO.setStoreMap(locationName, addr, locationTel, locationText, coordsTemp);
	}

	@Override
	public ArrayList<StoreMapVO> getStoreMap() {
		return adminDAO.getStoreMap();
	}

	@Override
	public void setStoreMapDelete(int idx) {
		adminDAO.setStoreMapDelete(idx);
		
	}

}
