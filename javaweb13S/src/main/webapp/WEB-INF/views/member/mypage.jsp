<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<link rel="stylesheet" href="${ctp}/css/default.css">
	<link rel="stylesheet" href="${ctp}/css/header.css">
	<link rel="stylesheet" href="${ctp}/css/mypage.css">
	<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<title>마이페이지 | LEGO SHOP</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="mypage-container">
		<div class="mypage-left">
			<div class="menu"><a href="${ctp}/member/mypage">계정 개요</a></div>
			<div class="menu"><a href="${ctp}/member/myPayment">내 주문</a></div>
			<div class="menu"><a href="${ctp}/member/verifyPwd?SW=0">회원정보 수정</a></div>
			<div class="menu"><a href="${ctp}/member/verifyPwd?SW=1">비밀번호 수정</a></div>
			<div class="menu"><a href="">상품 Q&amp;A</a></div>
			<div class="menu"><a href="${ctp}/member/watchList">관심목록</a></div>
			<div class="menu" style="margin-top:40px;"><a href="${ctp}/member/memberLogout">로그아웃</a></div>
			<div class="menu last-menu"><a href="${ctp}/member/memberDel">회원 탈퇴</a></div>
		</div>
      	<div class="mypage-right">
          	<div class="head">내 계정</div>
          	<c:if test="${vo.level == 1 || vo.level == 0}">
	          	<div class="pic">
	              	<div class="intro">
	              		<c:if test="${vo.level == 0}">
	                  		<div class="info">안녕하세요, 관리자님!</div>
	                  	</c:if>
	              		<c:if test="${vo.level == 1}">
	                  		<div class="info">안녕하세요, ${sUid} VIP회원님!</div>
	                  	</c:if>
	                  	<div class="info">환영합니다.</div>
	                  	<img class="img" src="${ctp}/images/member/VIP-logo.png" alt="vip로고">
	              	</div>
	              	<div class="intro">
	                  	<div class="point">POINT : <fmt:formatNumber value="${vo.point}" type="number" /></div>
	              	</div>
	              	<div class="intro">
	                  	<div class="text">리워드센터</div>
	                  	<div class="input"><input type="button" value="바로가기" onclick="rewardPage()"></div>
		            </div>
	          	</div>
          	</c:if>
          	<c:if test="${vo.level == 2}">
	          	<div class="pic">
	              	<div class="intro-2">
						<div class="info">안녕하세요, ${vo.uid} 회원님!</div>
						<div class="info">환영합니다.</div>
	              	</div>
	              	<div class="intro-2" style="width: 100%;">
	                  	<div class="text">VIP 가입하기</div>
	                  	<input type="button" value="신청하기" onclick="location.href='${ctp}/member/vipAd';">
	              	</div>
	          	</div>
          	</c:if>
          	<div class="order-box">
              	<div class="title">최근 주문</div> 
              	<div class="content">
                  	<div class="text">현재 진행중인 주문이 없습니다.</div>
                  	<a class="btn" href="${ctp}/store/storeMain">쇼핑 시작하기</a>
              	</div>
          	</div>
      	</div>
  	</div>
  	<div class="mypage-gap-1"></div>
  	<div class="mypage-gap"></div>
  	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
<script>
	function rewardPage() {
		alert("현재 준비중입니다.");
	}
	
</script>
</html>