package com.spring.javaweb13S.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaweb13S.dao.AdminDAO;
import com.spring.javaweb13S.dao.MemberDAO;
import com.spring.javaweb13S.dao.StoreDAO;

@Service
public class PageProcess {

	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	AdminDAO adminDAO;
	
	@Autowired
	StoreDAO storeDAO;
	
	public PageVO totRecCnt(int pag, int pageSize, String section, String searchSw, String searchItem) {
		PageVO pageVO = new PageVO();
		
		int totRecCnt = 0;
		String search = "";
		
		if(section.equals("member")) totRecCnt = memberDAO.totRecCnt(searchSw, searchItem);
		else if(section.equals("topCategory")) totRecCnt = adminDAO.totRecCnt(searchSw, searchItem);
		else if(section.equals("product")) totRecCnt = adminDAO.productTotRecCnt(searchSw, searchItem);
//		사용 조심(qna searchSw = tempIdx);
		else if(section.equals("qna")) totRecCnt = storeDAO.QnaTotRecCnt(searchSw, searchItem);
		else if(section.equals("qnaReply")) totRecCnt = adminDAO.QnaNoReplyTotRecCnt(searchSw, searchItem);
		else if(section.equals("review")) totRecCnt = storeDAO.ReviewTotRecCnt(searchSw, searchItem);
		
		int totPage = (totRecCnt % pageSize) == 0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 5;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		pageVO.setPag(pag);
		pageVO.setPageSize(pageSize);
		pageVO.setTotRecCnt(totRecCnt);
		pageVO.setTotPage(totPage);
		pageVO.setStartIndexNo(startIndexNo);
		pageVO.setCurScrStartNo(curScrStartNo);
		pageVO.setCurBlock(curBlock);
		pageVO.setBlockSize(blockSize);
		pageVO.setLastBlock(lastBlock);
		pageVO.setPart(searchSw);
		pageVO.setSearch(search);
		pageVO.setSearchString(searchItem);
		
		return pageVO;
	}

}
