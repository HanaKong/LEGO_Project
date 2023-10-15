<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${ctp}/js/daumAddr.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="${ctp}/css/default.css">
    <link rel="stylesheet" href="${ctp}/css/memberInfoEdit.css">
    <title>회원정보 수정 | LEGO SHOP</title>
    <script>
    
		const autoHyphen = (target) => {
			target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		}
	    
	    function memberInfoEditChk() {
	    	let name = myform.name.value.trim();
	    	let nickName = myform.nickName.value.trim();
	    	let tel = myform.tel.value.trim();
	    	let email = myform.email.value.trim();
	    	let postCode = myform.postcode.value.trim();
	    	let roadAddress = myform.roadAddress.value.trim();
	    	let detailAddress = myform.detailAddress.value.trim();
	    	
	    	let regName = /[a-zA-Z가-힣]{2,20}$/;
	    	let regNickName = /[a-zA-Z가-힣]{2,20}$/;
	    	let regTel = /\d{2,3}-\d{3,4}-\d{4}/;
	    	let regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	    	
	    	if(!regName.test(name) || name == "") {
	    		alert("성명을 다시 확인해주세요. \n성명은 영문,한글 2-20자리만 가능합니다.");
	    		myform.name.focus();
	    		return false;
	    	}
	    	else if(!regName.test(nickName) || nickName == "") {
	    		alert("닉네임을 다시 확인해주세요. \n닉네임은 영문,한글 2-20자리만 가능합니다.");
	    		myform.nickName.focus();
	    		return false;
	    	}
	    	else if(!regTel.test(tel) || tel == "") {
	    		alert("전화번호를 다시 확인해주세요.");
	    		myform.tel.focus();
	    		return false;
	    	}
	    	else if(!regEmail.test(email) || email == "") {
	    		alert("이메일을 다시 확인해주세요.");
	    		myform.email.focus();
	    		return false;
	    	}
	    	else if(postCode == "" || roadAddress == "" || detailAddress == "") {
	    		alert("주소를 다시 확인해주세요.");
	    		return false;
	    	}
	    	else {
	    		document.querySelector('.addrAll').value = postCode +"/"+ roadAddress +"/"+ detailAddress;
	    		myform.submit();
	    	}
	    }
    </script>
</head>
<body>
	<div class="container">
        <div class="edit-container">
            <h2>회원정보 수정</h2>
            <hr class="right-item-title-under" />
            <div class="item-container">
                <form name="myform" method="post">
                    <div class="category-box">
                        <div class="item-input-box">
                            <div class="item-input-text">성명</div>
                            <div class="value-input-box">
                                <input type="text" name="name" placeholder="성명을 입력해주세요" value="${vo.name}" required />
                            </div>
                        </div>
                        <div class="item-input-box">
                            <div class="item-input-text">아이디</div>
                            <div class="value-input-box">
                                <input type="text" name="uid" value="${vo.uid}" readonly>
                            </div>
                        </div>
                        <div class="item-input-box">
                            <div class="item-input-text">닉네임</div>
                            <div class="value-input-box">
                                <input type="text" name="nickName" placeholder="닉네임을 입력해주세요" value="${vo.nickName}"
                                    required />
                            </div>
                        </div>
                        <div class="item-input-box">
                            <div class="item-input-text">연락처</div>
                            <div class="value-input-box">
                                <input type="text" name="tel" placeholder="연락처를 입력해주세요" oninput="autoHyphen(this)"
                                    maxlength="13" autocomplete="off" value="${vo.tel}" required />
                            </div>
                        </div>
                        <div class="item-input-box">
                            <div class="item-input-text">이메일</div>
                            <div class="value-input-box">
                                <input type="text" name="email" placeholder="이메일을 입력해주세요" value="${vo.email}"
                                    required />
                            </div>
                        </div>
                        <div class="item-input-box postAddr">
                            <div class="item-input-text">우편번호</div>
                            <div class="value-input-box">
                                <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호 입력해주세요"
                                    value="${fn:split(vo.address,'/')[0]}" required />
                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 검색">
                            </div>
                        </div>
                        <div class="item-input-box">
                            <div class="item-input-text">주소</div>
                            <div class="value-input-box">
                                <input type="text" name="roadAddress" id="sample6_address" placeholder="주소"
                                    value="${fn:split(vo.address,'/')[1]}" required />
                            </div>
                        </div>
                        <div class="item-input-box">
                            <div class="item-input-text">상세 주소</div>
                            <div class="value-input-box">
                                <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소"
                                    value="${fn:split(vo.address,'/')[2]}" required />
                                <input type="hidden" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" />
                            </div>
                        </div>
                        <input type="hidden" class="addrAll" name="address" />
                        <div class="item-input-box-btn">
                            <input type="button" value="수정" onclick="memberInfoEditChk()" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="margin-top-member"></div>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>