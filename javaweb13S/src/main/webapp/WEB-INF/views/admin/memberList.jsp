	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	.memberlist-btm-margin {
		margin-top: 200px;
	}
	.admin-memberlist-title-under {
		display: block;
		margin-top: 20px;
		border: 1px solid rgba(0, 0, 0, 0.1);
		width: 80%;
		text-align: center;
	}
</style>
<script type="text/javascript">
	function pageCheck(e) {
		let pageSize = e.value;
		
		let searchSw = '${searchSw}';
		let searchItem = '${searchItem}';
		
		location.href = "${ctp}/admin/memberList?pag=${pageVO.pag}&pageSize="+pageSize+"&searchSw="+searchSw+"&searchItem="+searchItem;
	}
	
	function levelChange(e, idx) {
		let ans = confirm("선택한 회원의 등급을 변경하시겠습니까?");
		
		if(!ans) {
			location.reload();
			return false;
		}
    	let level = e.value;
    	    	
    	let query = {
    			level : level,
    			idx : idx
    	}
    	$.ajax({
    		type : "post",
    		url : "${ctp}/admin/memberLevelChange",
    		data : query,
    		success : function(res) {
    			if(res == "1") {
    				alert("등급 수정 완료");
    				location.reload();
    			}
    			else {
    				alert("등급 수정 실패");
    			}
    		},
    		error : function() {
    			alert("전송 오류");
    		}
    	});
    }
	
	function memberDelete(idx) {
		let ans = confirm("선택한 회원을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url : "${ctp}/admin/memberDelete",
    		data : {idx : idx},
    		success : function() {
    				alert("회원 삭제 완료");
    				location.reload();
    		},
    		error : function() {
    			alert("전송 오류");
    		}
    	});
    }
	
</script>
<title>관리자페이지</title>
</head>
<body>
<div class="admin-container">
	<jsp:include page="/WEB-INF/views/include/adminLeft.jsp" /> 
	<div class="admin-right-container">
	    <h2 class="text-center" style="width: 80%; justify-content: center; font-weight: 900;">전체 회원 리스트</h2>
	    <hr class="admin-memberlist-title-under"/>
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
                                    <option value="uid" <c:if test="${searchSw == 'uid'}">selected</c:if>>아이디</option>
                                    <option value="nickName" <c:if test="${searchSw == 'nickName'}">selected</c:if>>닉네임</option>
                                    <option value="name" <c:if test="${searchSw == 'name'}">selected</c:if>>성명</option>
                                </select>
                            </div>
                            <input type="text" name="searchItem" id="searchItem" class="form-control mr-2 align-middle" placeholder="검색어를 입력하세요." autofocus required />
                            <div class="input-group-append align-middle">
                                <input type="submit" value="검색" class="btn btn-primary mr-2" style="border-radius:5px;" />
                                <input type="button" value="전체검색" onclick ="location.href='${ctp}/admin/memberList'" class="btn btn-info mr-2"  style="border-radius:5px;"/>
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
	    <table class="table table-hover text-center member-table" style="width: 80%">
	        <tr class="table-dark text-dark" style="font-size:1.1rem;">
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>성명</th>
				<th>최초가입일</th>
				<th>마지막접속일</th>
				<th>등급</th>
				<th>탈퇴유무</th>
	        </tr>
	        <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
	        <c:forEach var="vo" items="${vos}" varStatus="st">
		        <tr style="font-size:0.9rem; font-weight:600">
		            <td class="align-middle">${curScrStartNo}</td>
		            <td class="align-middle">
						<a href="#" onclick="memberView('${vo.uid}','${vo.nickName}','${vo.name}','${vo.tel}','${vo.address}','${vo.email}','${vo.userDel}','${vo.point}','${vo.level}','${fn:substring(vo.startDate,0,10)}','${fn:substring(vo.lastDate,0,10)}')" data-toggle="modal" data-target="#myModal" style="color: #000; text-decoration: underline;">			            
		            		${vo.uid}
		            	</a>
		            </td>
		            <td class="align-middle">${vo.nickName}</td>
		            <td class="align-middle">${vo.name}</td>
		            <td class="align-middle">${fn:substring(vo.startDate,0,16)}</td>
		            <td class="align-middle">${fn:substring(vo.lastDate,0,16)}</td>
		            <td class="align-middle">
	                <select name="level" onchange="levelChange(this, ${vo.idx})">
		                <option value="0" ${vo.level==0 ? "selected" : ""}>관리자</option>
		                <option value="1" ${vo.level==1 ? "selected" : ""}>VIP</option>
		                <option value="2" ${vo.level==2 ? "selected" : ""}>회원</option>
	                </select>
		            </td>
		            <td class="align-middle">
		                <c:if test="${vo.userDel == 'OK'}">
		                <font color="red"><b>탈퇴신청</b></font>
		                <c:if test="${vo.deleteDiff >= 7}">
		                (<a href="javascript:memberDelete(${vo.idx})" title="7일경과">X</a>)
		                </c:if>
		                </c:if>
		                <c:if test="${vo.userDel != 'OK'}">활동중</c:if>
		            </td>
		        </tr>
	        	<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	        </c:forEach>
	        <tr><td colspan="8" class="m-0 p-0"></td></tr>
	    </table>
	    <!-- 블록 페이징 처리 -->
		<div class="text-center" style="width: 80%; justify-content: center;">
		  	<ul class="pagination justify-content-center">
				<c:if test="${pageVO.pag > 2}">
					<li class="page-item">
			    		<a class="page-link text-secondary" href="${ctp}/admin/memberList?pageSize=${pageVO.pageSize}&pag=1&searchSw=${searchSw}&searchItem=${searchItem}">첫페이지</a>
			  		</li>
			  	</c:if>
			  	<c:if test="${pageVO.curBlock > 0}">
					<li class="page-item">
						<a class="page-link text-secondary" href="${ctp}/admin/memberList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&searchSw=${searchSw}&searchItem=${searchItem}">이전블록</a>
					</li>
			  	</c:if>
			  	<c:forEach var="i" begin="${(pageVO.curBlock)*pageVO.blockSize + 1}" end="${(pageVO.curBlock)*pageVO.blockSize + pageVO.blockSize}" varStatus="st">
					<c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
			  			<li class="page-item active">
							<a class="page-link bg-secondary border-secondary" href="${ctp}/admin/memberList?pageSize=${pageVO.pageSize}&pag=${i}&searchSw=${searchSw}&searchItem=${searchItem}">${i}</a>
			  			</li>
				  	</c:if>
					<c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
				  		<li class="page-item">
				  			<a class="page-link text-secondary" href="${ctp}/admin/memberList?pageSize=${pageVO.pageSize}&pag=${i}&searchSw=${searchSw}&searchItem=${searchItem}">${i}</a>
				  		</li>
				  	</c:if>
		 	 	</c:forEach>
			  	<c:if test="${pageVO.curBlock < pageVO.lastBlock}">
					<li class="page-item">
						<a class="page-link text-secondary" href="${ctp}/admin/memberList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&searchSw=${searchSw}&searchItem=${searchItem}">다음블록</a>
					</li>
			  	</c:if>
			  	<c:if test="${pageVO.pag < pageVO.totPage}">
					<li class="page-item">
			    		<a class="page-link text-secondary" href="${ctp}/admin/memberList?pageSize=${pageVO.pageSize}&pag=${pageVO.totPage}&searchSw=${searchSw}&searchItem=${searchItem}">마지막페이지</a>
			    	</li>
			  	</c:if>
			</ul>
		</div>
	</div>
  </div>

<!-- The Modal('회원 아이디' 클릭시 회원의 상세정보를 모달창에 출력한다. -->
<div class="modal fade" id="myModal" style="top: 150px; left: 10px;">
    <div class="modal-dialog">
        <div class="modal-content" style="width:600px;">
            <!-- Modal Header -->
            <div class="modal-header" style="width:600px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body" style="width:600px; height:500px; overflow:auto;">
            	<div class="margin-modal text-center">회원정보</div>
                <table class="table table-bordered modal-table" style="font-size:1.0rem">
                    <tr>
                        <th class="text-center" style="background-color:#f8f8f8;">아이디</th>
                        <td id="uid"></td>
                        <th class="text-center" style="background-color:#f8f8f8;">등급</th>
                        <td id="strLevel"></td>
                    </tr>
                    <tr>
                        <th class="text-center" style="background-color:#f8f8f8;">이름</th>
                        <td colspan="3"  id="name"></td>
                    </tr>
                    <tr>
                        <th class="text-center"  style="background-color:#f8f8f8;">닉네임</th>
                        <td colspan="3"  id="nickName"></td>
                    </tr>
                    <tr>
                        <th class="text-center"  style="background-color:#f8f8f8;">전화번호</th>
                        <td colspan="3"  id="tel"></td>
                    </tr>
                    <tr>
                        <th class="text-center"  style="background-color:#f8f8f8;">이메일</th>
                        <td colspan="3"  id="email"></td>
                    </tr>
                    <tr>
                        <th class="text-center"  style="background-color:#f8f8f8;">주소</th>
                        <td colspan="3" id="address"></td>
                    </tr>
                    <tr>
                        <th class="text-center"  style="background-color:#f8f8f8;">포인트</th>
                        <td id="point"></td>
                        <th class="text-center"  style="background-color:#f8f8f8;">탈퇴여부</th>
                        <td id="userDel"></td>
                    </tr>
                    <tr>
                        <th class="text-center"  style="background-color:#f8f8f8;">최초가입일</th>
                        <td id="startDate"></td>
                        <th class="text-center"  style="background-color:#f8f8f8;">최종방문일</th>
                        <td id="lastDate"></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="memberlist-btm-margin"></div>
</body>
<script>
//회원정보 상세보기
let strLevel = "";
function memberView(uid,nickName,name,tel,address,email,userDel,point,level,startDate,lastDate) {
    /* let telArr = tel.split('-'); */
    /* if(telArr[1].trim()=="" || telArr[2].trim()=="") tel = "없음"; */
    /* address = address.replace(/\//g, ' '); */
    if(level == 0) strLevel = "관리자";
	else if(level == 1) strLevel = "VIP";
	else if(level == 2) strLevel = "회원";
    
    $("#myModal").on("show.bs.modal", function(e){
        $(".modal-body #uid").html(uid);
        $(".modal-body #strLevel").html(strLevel);
        $(".modal-body #name").html(name);
        $(".modal-body #nickName").html(nickName);
        $(".modal-body #tel").html(tel);
        $(".modal-body #email").html(email);
        $(".modal-body #address").html(address);
        $(".modal-body #userDel").html(userDel);
        $(".modal-body #point").html(point);
        $(".modal-body #startDate").html(startDate);
        $(".modal-body #lastDate").html(lastDate);
    });
}
</script>
</html>