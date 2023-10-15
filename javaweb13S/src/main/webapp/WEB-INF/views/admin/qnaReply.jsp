<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${ctp}/css/qnaReply.css">
<link rel="stylesheet" href="${ctp}/css/default.css">
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	
</script>
<style>
	.admin-right-container {
		width: 90%;
		margin: 0 auto 0;
		position: relative;
		left: 5%;
		margin-top:100px;
	}
</style>
<script type="text/javascript">
	
</script>

<title>Q&A 답</title>
</head>
<body>
<div class="admin-container">
	<jsp:include page="/WEB-INF/views/include/adminLeft.jsp" />
	<div class="admin-right-container">
	    <div class="qna-container">
	        <div class="qna-title">Q&amp;A</div>
	        <div class="menu-btm"></div>
	        <div class="qna-body-box">
	            <div class="qna-body-title">
	                <div class="col">상품 사진</div>
	                <div class="col">상품명</div>
	                <div class="col">내용</div>
	                <div class="col">작성자</div>
	                <div class="col">작성일</div>
	                <div class="col">IP</div>
	                <div class="col">삭제</div>
	            </div>
	            <!-- 반복 -->
	            <c:if test="${pageVO.totRecCnt == 0}">
	            	<div class="qna-no-body-content">
		                <img src="${ctp}/images/store/exclamation-no.webp" alt="느낌표">
		                <div class="text">작성된 상품 Q&amp;A가 없습니다.</div>
		            </div>
	            </c:if>
	            <c:forEach var="vo" items="${vos}">
		            <div class="qna-body-content">
		                <div class="col"><img src="${ctp}/data/admin/product/thumbnail/${vo.FName}" /> </div>
		                <div class="col">
		                    ${vo.productName}
		                </div>
		                <div class="col">
		                    ${vo.content}
		                </div>
		                <div class="col">${vo.uid}</div>
	                	<c:set var='fDate' value="${fn:replace(vo.regDate,'-','.')}" />
		                <div class="col">${fn:substring(fDate,0,10)}</div>
		                <div class="col">${vo.hostIP}</div>
		                <div class="col"><a href="javascript:qnaDelete(${vo.idx})">&times;</a></div>
		            </div>
		            <div class="anwser-box">
		                <div class="qna-body-content-1">
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col">
		                        ${vo.content}
		                    </div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                </div>
		                <div class="qna-body-gap"> <!--갭-->
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                </div>
		                <div class="qna-body-content-2">
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col">
		                        <div class="answer-icon-box">
		                        	<form name="myform" id="myform" method="post">
			                            <div class="answer-content">
			                                <div>
			                                    <textarea class="textContent${vo.idx} textContent" name="textContent" cols="30" rows="10"></textarea>
			                                    <div class="textCnt">0/500</div>
			                                </div>
			                                <div><input type="button" onclick="javascript:qnaReplySubm(${vo.idx})" value="작성하기" /></div>
			                                <input type="hidden" name="idx" value="${vo.idx}"> 
			                                <input type="hidden" name="productIdx" value="${vo.productIdx}"> 
			                            </div>
		                            </form>
		                        </div>
		                    </div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                </div>
		            </div>
	            </c:forEach>
	            <!-- 반복 -->
	        </div>
	        
	        <div class="qna-body-btm"></div>
	
	        <div class="page_wrap">
	            <div class="page_nation">
	            	<c:if test="${pageVO.curBlock > 0}">
		                <a class="arrow prev" href="${ctp}/admin/qnaReply?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}">이전</a>
		            </c:if>
		            <c:forEach var="i" begin="${(pageVO.curBlock)*pageVO.blockSize + 1}" end="${(pageVO.curBlock)*pageVO.blockSize + pageVO.blockSize}">
		            	<c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	                		<a href="${ctp}/admin/qnaReply?pag=${i}" class="active">${i}</a>
	            		</c:if>
	            		<c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	                		<a href="${ctp}/admin/qnaReply?pag=${i}">${i}</a>
	            		</c:if>	
	        		</c:forEach>
	        		<c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	                	<a class="arrow next" href="${ctp}/admin/qnaReply?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}">다음</a>
	            	</c:if>
	            </div>
	        </div>
	        <div class="qnaReply-gap"></div>
	    </div>
	</div>
</div>
</body>
<script>
    $('.qna-body-content').on('click', function () {
        function slideDown(target) {
            slideUp();
            $(target).addClass('on').next().slideDown();
        }
        function slideUp() {
            $('.qna-body-content').removeClass('on').next().slideUp();
        }
        $(this).hasClass('on') ? slideUp() : slideDown(this);
    });

    $(".textContent").keyup(function(e) {
		let content = $(this).val();
		$(".textCnt").text(content.length + "/500");
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
    
    function qnaReplySubm(idx) {
    	let ans = confirm('작성하면 이후에 삭제할 수 없습니다. 답글을 작성하시겠습니까?');
    	if(ans) {
			const text = document.querySelector('.textContent'+idx);
			if(text.value == '') {
				alert('내용을 입력해주세요');
				text.focus();
			}
			else {
				$('#myform').submit();
			}
    	}
    	else {
    		return false;
    	}
    	
    }
    
    function qnaDelete(idx) {
    	$.ajax({
			url : '${ctp}/admin/qnaDelete',
			type : 'post',
			data : {idx : idx},
			success : function(res) {
				if(res == "1") {
					alert('삭제되었습니다.');
					location.reload();
				}
			},
			error : function() {
				alert("전송 오류입니다.");
			}
		});
    }
</script>
</html>