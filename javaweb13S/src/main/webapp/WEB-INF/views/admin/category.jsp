<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<script>
	
</script>
<style>
.admin-right-container {
	width: 90%;
	margin: 0 auto 0;
}

.admin-right-container .category-top {
	justify-content: center;
	font-size: 2.0rem;
	margin-top: 30px;
	font-weight: 900;
}

.admin-right-container .category-input-box {
	margin-top: 30px;
	display: grid;
	grid-template-columns: repeat(8, 1fr);
	gap: 20px;
}
.category-input-box .input-text {
	font-size: 1.2rem;
	padding-left: 5px;
}
.category-input-box .input-box input {
	margin: 5px 0 15px;
	width: 220px;
	border-radius: 5px;
	padding: 5px;
	height: 40px;
}
.category-input-box .input-box input::placeholder {
	font-size: 0.9rem;
	padding-left: 5px;
}
.category-input-box .btn-box {
	display: grid;
	align-items: end;
	width: 120px;
}
.category-input-box .btn {
	background-color: #4EBF3C;
	color: #fff;
	font-size: 1.0rem;
}
.category-input-box .btn:hover {
	background-color : #FFCF02;
	color: #fff;
	transition: .2s ease-in-out;
}
.category-table {
	display: grid;
	margin-top: 30px;
	width: 700px;
}
.category-table .category-search-box {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
}
.category-table .table-top {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	font-size: 1.2rem;
	background-color: #f3f3f3;
	text-align: center;
	padding: 10px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}
.table-top .table-top-text {
  	font-weight: 900;
}
.category-table .table-content {
	display: grid;
	width: 700px;
	grid-template-columns: repeat(4, 1fr);
	font-size: 1.2rem;
	text-align: center;
	padding: 10px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}
.table-content .content-btn {
	font-size: 1.1rem;
	background-color : #fff;
	font-weight: 900;
}
.pagination-box {
	width : 700px;
	display: grid;
	justify-content: center;
	margin-top: 15px;
}
.category-search-box .searchSw {
	height: 37.75px;
}
.admin-category-title-under {
		display: block;
		margin-top: 20px;
		border: 1px solid rgba(0, 0, 0, 0.1);
		width: 700px;
		text-align: center;
	}
</style>
<script type="text/javascript">
	'use strict';
	function categoryChk() {
		let categoryCode = myform.categoryCode.value.trim();
		let categoryName = myform.categoryName.value.trim();
		
		if(categoryCode == "") {
			alert("코드를 입력해주세요.");
			myform.categoryCode.focus();
			return false;
		}
		else if(categoryName == "") {
			alert("코드명을 입력해주세요.");
			myform.categoryName.focus();
			return false;
		}
		else {
			myform.submit();
		}
	}
	
	function pageCheck(e) {
		let pageSize = e.value;
		
		let searchSw = '${searchSw}';
		let searchItem = '${searchItem}';
		
		location.href = "${ctp}/admin/category?pag=${pageVO.pag}&pageSize="+pageSize+"&searchSw="+searchSw+"&searchItem="+searchItem;
	}
	
	function categoryDelete(idx) {
		let ans = confirm("삭제하시겠습니까?");
		if(!ans) {
			return false;
		}
		$.ajax({
    		type : "post",
    		url : "${ctp}/admin/categoryDelete",
    		data : {idx : idx},
    		success : function() {
    				alert("선택하신 카테고리가 삭제되었습니다.");
    				location.reload();
    		},
    		error : function() {
    			alert("삭제하고자 하는 카테고리에 물품이 등록되지 않았을 경우에만 삭제할 수 있습니다.");
    			location.reload();
    		}
    	});
    }
	
</script>

<title>분류 등록</title>
</head>
<body>
<div class="admin-container">
	<jsp:include page="/WEB-INF/views/include/adminLeft.jsp" />
	<div class="admin-right-container" style="position: relative; left: 33%;">
		<div class="category-box">
			<form name="myform" method="post">
				<div class="category-top">카테고리 등록</div>
				<hr class="admin-category-title-under"/>
				<div class="category-input-box">
					<div class="input-box">
						<div class="input-text">카테고리 코드(4글자 이내)</div>
                      	<input type="text" name="categoryCode" placeholder="코드를 입력해주세요" />
                  	</div>
                  	<div class="input-box">
                      	<div class="input-text">카테고리명</div>
                      	<input type="text" name="categoryName" placeholder="카테고리명을 입력해주세요" />
                  	</div>
                  	<div class="input-box btn-box">
                      	<input class="btn" type="button" onclick="categoryChk()" value="분류 등록하기" />
                  	</div>
              	</div>
          	</form>
      	</div>
	  	<div class="category-table">
	  		<div class="category-search-box">
		  		<form>
		            <div class="input-group">
		                <div class="input-group-append align-middle">
		                    <select name="searchSw" class="form-control mr-2 searchSw">
		                        <option value="categoryCode" <c:if test="${searchSw == 'categoryCode'}">selected</c:if>>코드</option>
		                        <option value="categoryName" <c:if test="${searchSw == 'categoryName'}">selected</c:if>>코드명</option>
		                    </select>
		                </div>
		                <input type="text" name="searchItem" class="form-control mr-2 searchSw" placeholder="검색어를 입력하세요." autofocus required style=" border-radius:5px;" />
		                <div class="input-group-append align-middle">
		                    <input type="submit" value="검색" class="btn btn-primary mr-2" style="border-radius:5px;" />
		                    <input type="button" value="전체검색" onclick ="location.href='${ctp}/admin/category';" class="btn btn-info mr-2"  style="border-radius:5px;"/>
		                </div>
		            </div>
		        </form>
		  		<!-- 한페이지 분량처리 -->
				<div class="category-page">
					<select name="pageSize" id="pageSize" onchange="pageCheck(this)">
					  	<option <c:if test="${pageVO.pageSize == 5}">selected</c:if>>5</option>
					  	<option <c:if test="${pageVO.pageSize == 7}">selected</c:if>>7</option>
						<option <c:if test="${pageVO.pageSize == 10}">selected</c:if>>10</option>
					</select>
					<span style="font-size: 0.9rem;" class="align-middle">건</span>
		        </div>
			</div>
	        <div class="table-top">
	            <div class="table-top-text">번호</div>
				<div class="table-top-text">카테고리 코드</div>
            	<div class="table-top-text">카테고리명</div>
            	<div class="table-top-text">삭제</div>
      		</div>
          	<c:forEach var="vo" items="${vos}" varStatus="st">
	        	<div class="table-content">
	              	<div class="content-text">${vo.idx}</div>
	              	<div class="content-text">${vo.categoryCode}</div>
	              	<div class="content-text">${vo.categoryName}</div>
	              	<div class="content-text"><input type="button" onclick="categoryDelete(${vo.idx})" value="&times" class="content-btn" /></div>
	          	</div>
          	</c:forEach>
     	</div>
	  	<!-- 블록 페이징 처리 -->
		<div class="pagination-box">
		  	<ul class="pagination">
				<c:if test="${pageVO.pag > 2}">
					<li class="page-item">
			    		<a class="page-link text-secondary" href="${ctp}/admin/category?pageSize=${pageVO.pageSize}&pag=1&searchSw=${searchSw}&searchItem=${searchItem}">첫페이지</a>
			  		</li>
			  	</c:if>
			  	<c:if test="${pageVO.curBlock > 0}">
					<li class="page-item">
						<a class="page-link text-secondary" href="${ctp}/admin/category?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&searchSw=${searchSw}&searchItem=${searchItem}">이전블록</a>
					</li>
			  	</c:if>
			  	<c:forEach var="i" begin="${(pageVO.curBlock)*pageVO.blockSize + 1}" end="${(pageVO.curBlock)*pageVO.blockSize + pageVO.blockSize}" varStatus="st">
					<c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
			  			<li class="page-item active">
							<a class="page-link bg-secondary border-secondary" href="${ctp}/admin/category?pageSize=${pageVO.pageSize}&pag=${i}&searchSw=${searchSw}&searchItem=${searchItem}">${i}</a>
			  			</li>
				  	</c:if>
					<c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
				  		<li class="page-item">
				  			<a class="page-link text-secondary" href="${ctp}/admin/category?pageSize=${pageVO.pageSize}&pag=${i}&searchSw=${searchSw}&searchItem=${searchItem}">${i}</a>
				  		</li>
				  	</c:if>
		 	 	</c:forEach>
			  	<c:if test="${pageVO.curBlock < pageVO.lastBlock}">
					<li class="page-item">
						<a class="page-link text-secondary" href="${ctp}/admin/category?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&searchSw=${searchSw}&searchItem=${searchItem}">다음블록</a>
					</li>
			  	</c:if>
			  	<c:if test="${pageVO.pag < pageVO.totPage}">
					<li class="page-item">
			    		<a class="page-link text-secondary" href="${ctp}/admin/category?pageSize=${pageVO.pageSize}&pag=${pageVO.totPage}&searchSw=${searchSw}&searchItem=${searchItem}">마지막페이지</a>
			    	</li>
			  	</c:if>
			</ul>
		</div>
	</div>
</div>
</body>
</html>