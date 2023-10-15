<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="${ctp}/css/default.css">
<style>
	.admin-right-container {
	    position: relative;
	    width: 90%;
	    left: 20%;
	}
	.admin-right-container h2 {
	    margin-top: 50px;
	}
	.search-text {
		font-size : 1.0rem;
	}
	#searchItem {
		height : 37.75px;
		border-radius : 5px;
	}
	.searchSw {
		border-radius : 5px;
	}
	.margin-modal {
		margin : 15px 0 20px;
		font-size : 1.3rem;
		font-weight : 900;
	}
	
	.admin-productList-title-under {
		display: block;
		margin-top: 20px;
		border: 1px solid rgba(0, 0, 0, 0.1);
		width: 80%;
		text-align: center;
	}
	.chktable-block {
		width: 78%;
		display: flex;
		justify-content: space-between;
		align-items: center;
		vertical-align: center;
	}

</style>
<script type="text/javascript">
	function pageCheck(e) {
		let pageSize = e.value;
		
		let searchSw = '${searchSw}';
		let searchItem = '${searchItem}';
		
		location.href = "${ctp}/admin/productList?pag=${pageVO.pag}&pageSize="+pageSize+"&searchSw="+searchSw+"&searchItem="+searchItem;
	}
	function stateChange(e, idx) {
		let ans = confirm("선택한 상품의 판매여부를 변경하시겠습니까?");
		
		if(!ans) {
			location.reload();
			return false;
		}
    	let switchItem = e.value;
    	    	
    	let query = {
    			switchItem : switchItem,
    			idx : idx
    	}
    	$.ajax({
    		type : "post",
    		url : "${ctp}/admin/productStateChange",
    		data : query,
    		success : function(res) {
    			if(res == "1") {
    				alert("수정 완료");
    				location.reload();
    			}
    			else {
    				alert("수정 실패");
    			}
    		},
    		error : function() {
    			alert("전송 오류");
    		}
    	});
    }
	
	function productDelete() {
		let ans = confirm("선택한 상품을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	let arrIdx = [];
    	$('input[name=productchk]').each(function (idx) {
    		if($(this).is(':checked') == true) {
    			arrIdx.push($(this).val());
    		}
    	});
    	
    	for(let idx of arrIdx) {
    		$.ajax({
        		type : "post",
        		url : "${ctp}/admin/productDelete",
        		data : {idx : idx},
        		success : function() {
        				location.reload();
        		},
        		error : function() {
        		}
        	});
    	}
  	}
	
	$(document).ready(function() {
        $("#allCheck").click(function() {
            if($("#allCheck").is(":checked")) $("input[name=productchk]").prop("checked", true);
            else $("input[name=productchk]").prop("checked", false);
        });

        $("input[name=productchk]").click(function() {
            let total = $("input[name=productchk]").length;
            let checked = $("input[name=productchk]:checked").length;

            if(total != checked) $("#allCheck").prop("checked", false);
            else $("#allCheck").prop("checked", true); 
        });
    });
	
</script>
	
<title>상품 리스트</title>
</head>
<body>
<div class="admin-container">
	<jsp:include page="/WEB-INF/views/include/adminLeft.jsp" /> 
	<div class="admin-right-container">
	    <h2 class="text-center" style="width: 80%; justify-content: center; font-weight: 900;">상품 리스트</h2>
	    <hr class="admin-productList-title-under"/>
	    <br/>
          <table class="table table-borderless mb-0 p-0 text-center" style="width: 80%;">
          	<tr>
	            <td class="text-left search-text">
			        <c:if test="${empty searchSw}">(전체검색)</c:if>
		        	<c:if test="${!empty searchSw}">(검색 : ${searchItem} (${pageVO.totRecCnt}건))</c:if>
		        </td>
		    </tr>
	        <tr>
	        	<td class="text-left" style="width: 600px;">
                    <form>
                        <div class="input-group">
                            <div class="input-group-append align-middle">
                                <select name="searchSw" class="form-control mr-2 searchSw">
                                    <option value="categoryCode" <c:if test="${searchSw == 'categoryCode'}">selected</c:if>>카테고리코드</option>
                                    <option value="productCode" <c:if test="${searchSw == 'productCode'}">selected</c:if>>상품코드</option>
                                    <option value="productName" <c:if test="${searchSw == 'productName'}">selected</c:if>>상품명</option>
                                </select>
                            </div>
                            <input type="text" name="searchItem" id="searchItem" class="form-control mr-2 align-middle" placeholder="검색어를 입력하세요." autofocus required />
                            <div class="input-group-append align-middle">
                                <input type="submit" value="검색" class="btn btn-primary mr-2" style="border-radius:5px;" />
                                <input type="button" value="전체검색" onclick ="location.href='${ctp}/admin/productList'" class="btn btn-info mr-2"  style="border-radius:5px;"/>
                            </div>
                        </div>
                    </form>
                </td>
		        <td class="text-right">
		            <!-- 한페이지 분량처리 -->
		            <select name="pageSize" id="pageSize" onchange="pageCheck(this)">
			            <option <c:if test="${pageVO.pageSize == 10}">selected</c:if>>10</option>
			            <option <c:if test="${pageVO.pageSize == 15}">selected</c:if>>15</option>
			            <option <c:if test="${pageVO.pageSize == 20}">selected</c:if>>20</option>
		            </select> 건
		        </td>
	        </tr>
	    </table>
	    <table style="margin: 5px 0 10px 10px;">
			<tr class="chktable-block">
				<th style="margin-left:10px; font-size: 1rem; align-items: center;"><input type="checkbox" id="allCheck"><span style="margin-left:10px;">전체선택</span></th>
				<td>
					<input type="button" onclick="productDelete()" value="삭제하기" class="btn btn-warning" style="color:#fff;" />
				</td>
			</tr>	    
	    </table>
	    <table class="table table-hover text-center member-table" style="width: 80%">
	        <tr class="table-dark text-dark" style="font-size:1.1rem;">
	        	<th>체크</th>
				<th>번호</th>
				<th>코드</th>
				<th>상품번호</th>
				<th>파일사진</th>
				<th>상품명</th>
				<th>가격</th>
				<th>할인율</th>
				<th>포인트</th>
				<th>재고</th>
				<th>상품 등록일</th>
				<th>판매</th>
				<th>수정</th>
	        </tr>
	        <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
	        <c:forEach var="vo" items="${vos}" varStatus="st">
		        <tr style="font-size:0.9rem; font-weight:600">
		        	<td class="align-middle"><input type="checkbox" name="productchk" value="${vo.idx}" /></td>
		            <td class="align-middle">${curScrStartNo}</td>
		            <td class="align-middle">${vo.categoryCode}</td>
		            <td class="align-middle">${vo.productCode}</td>
		            <td class="align-middle"><img src="${ctp}/data/admin/product/thumbnail/${vo.FName}" style="width:50px; height:50px;"></td>
		            <td class="align-middle">${vo.productName}</td>
		            <td class="align-middle"><fmt:formatNumber value="${vo.price}" pattern="#,###" /></td>
		            <td class="align-middle">${vo.discountRate}</td>
		            <td class="align-middle"><fmt:formatNumber value="${vo.point}" pattern="#,###" /></td>
		            <td class="align-middle">${vo.stock}</td>
		            <td class="align-middle">${fn:substring(vo.regDate,0,10)}</td>
		            <td class="align-middle">
		                <select name="level" onchange="stateChange(this, ${vo.idx})">
			                <option value="1" ${vo.switchItem == 1 ? "selected" : ""}>시작</option>
			                <option value="0" ${vo.switchItem == 0 ? "selected" : ""}>중지</option>
		                </select>
		            </td>
		            <td class="align-middle"><a href="${ctp}/admin/productUpdate?idx=${vo.idx}" style="font-weight: 900; color:#000;">수정</a></td>
		        </tr>
	        	<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	        </c:forEach>
	        <tr><td colspan="13" class="m-0 p-0"></td></tr>
	    </table>
	    <!-- 블록 페이징 처리 -->
		<div class="text-center" style="width: 80%; justify-content: center;">
		  	<ul class="pagination justify-content-center">
				<c:if test="${pageVO.pag > 2}">
					<li class="page-item">
			    		<a class="page-link text-secondary" href="${ctp}/admin/productList?pageSize=${pageVO.pageSize}&pag=1&searchSw=${searchSw}&searchItem=${searchItem}">첫페이지</a>
			  		</li>
			  	</c:if>
			  	<c:if test="${pageVO.curBlock > 0}">
					<li class="page-item">
						<a class="page-link text-secondary" href="${ctp}/admin/productList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&searchSw=${searchSw}&searchItem=${searchItem}">이전블록</a>
					</li>
			  	</c:if>
			  	<c:forEach var="i" begin="${(pageVO.curBlock)*pageVO.blockSize + 1}" end="${(pageVO.curBlock)*pageVO.blockSize + pageVO.blockSize}" varStatus="st">
					<c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
			  			<li class="page-item active">
							<a class="page-link bg-secondary border-secondary" href="${ctp}/admin/productList?pageSize=${pageVO.pageSize}&pag=${i}&searchSw=${searchSw}&searchItem=${searchItem}">${i}</a>
			  			</li>
				  	</c:if>
					<c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
				  		<li class="page-item">
				  			<a class="page-link text-secondary" href="${ctp}/admin/productList?pageSize=${pageVO.pageSize}&pag=${i}&searchSw=${searchSw}&searchItem=${searchItem}">${i}</a>
				  		</li>
				  	</c:if>
		 	 	</c:forEach>
			  	<c:if test="${pageVO.curBlock < pageVO.lastBlock}">
					<li class="page-item">
						<a class="page-link text-secondary" href="${ctp}/admin/productList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&searchSw=${searchSw}&searchItem=${searchItem}">다음블록</a>
					</li>
			  	</c:if>
			  	<c:if test="${pageVO.pag < pageVO.totPage}">
					<li class="page-item">
			    		<a class="page-link text-secondary" href="${ctp}/admin/productList?pageSize=${pageVO.pageSize}&pag=${pageVO.totPage}&searchSw=${searchSw}&searchItem=${searchItem}">마지막페이지</a>
			    	</li>
			  	</c:if>
			</ul>
		</div>
		<div class="productList-btm-margin" style="margin-top: 400px;"></div>
	</div>
  </div>
</body>
</html>