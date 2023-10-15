<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="${ctp}/css/regQNA.css">
<link rel="stylesheet" href="${ctp}/css/default.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	function regQNAChk() {
		const text = document.querySelector('.textContent');
		if(text.value == '') {
			alert('내용을 입력해주세요');
			text.focus();
		}
		else if($("#QnaChk").is(":checked")) {
		    document.querySelector('.QnaSW').value = 1;
		}
		else {
			document.querySelector('.QnaSW').value = 0;
		}
		myform.submit();
	}
	
</script>
<title>상품 Q&amp;A 작성하기 | LEGO SHOP</title>
</head>
<body>
	<form name="myform" method="post">
	    <div class="regQnaBox">
	        <div class="regQnaTitle">상품 Q&amp;A 작성하기</div>
	        <div class="regTitleBtm"></div>
	        <div class="text-box">
	            <textarea class="textContent" name="content" cols="75" rows="10" placeholder="문의하실 내용을 입력해주세요."></textarea>
	            <div class="textCnt">0/500</div>
	        </div>
	        <div class="chk-box">
	            <input type="checkbox" name="chkBox" id="QnaChk" />
	            <label for="QnaChk">비공개</label>
	        </div>
	        <div class="warning">
	            <img src="${ctp}/images/store/exclamation.webp" alt="느낌표">
	            <div class="text">문의하신 내용에 대한 답변은 해당 상품의 상세페이지 또는 <a href="#">'MYPAGE > 상품 Q&amp;A'</a>에서 확인하실 수 있습니다.</div>
	        </div>
	        <div class="btn-box">
	            <input type="button" onclick="window.close()" value="취소" class="cancel">
	            <input type="button" value="등록" class="regQnaBtn" onclick="javascript:regQNAChk()">
	        </div>
            <input type="hidden" class="QnaSW" name="QnaSW" value="0"/>
            <input type="hidden" name="productIdx" value="${idx}"/>
            <input type="hidden" name="hostIP" value="<%=request.getRemoteAddr()%>"/>
	    </div>
    </form>
</body>
<script>
	$(".textContent").keyup(function(e) {
		let content = $(this).val();
		$(".textCnt").text(content.length + "/500"); //실시간 글자수 카운팅
		if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 500));
			$('.textCnt').text("(500 / 최대 500자)");
            $('.textCnt').css("color","#d01012");
            $('.textCnt').css("font-weight","900");
		}
        else {
            $('.textCnt').css("color","#333");
            $('.textCnt').css("font-weight","400");
        }
	});
</script>
</html>