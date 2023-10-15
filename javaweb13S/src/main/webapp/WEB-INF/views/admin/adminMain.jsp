<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      width: 90%;
      justify-content: center;
      margin: 0 auto 0;
  }
  .admin-right-container h2 {
      margin-top: 100px;
  }
</style>
<title>관리자페이지</title>
</head>
<body>
<div class="admin-container">
	<jsp:include page="/WEB-INF/views/include/adminLeft.jsp" /> 
	<div class="admin-right-container">
		<div class="admin-right-container">
	
    	</div>
    </div>
</div>
</body>
</html>