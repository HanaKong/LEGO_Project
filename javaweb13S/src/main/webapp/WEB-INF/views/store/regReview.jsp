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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="${ctp}/css/default.css">
    <link rel="stylesheet" href="${ctp}/css/regReview.css">
    <title>리뷰 등록 | LEGO SHOP</title>
</head>
<body>
    <form name="myform" method="post">
        <div class="regReview-box">
            <div class="review-title">리뷰 작성하기</div>
            <div class="review-title-btm"></div>
            <div class="review-sm-box">
                <div class="img-box">
                    <img src="${ctp}/data/admin/product/thumbnail/${vo.FName}" alt="상품 이미지">
                </div>
                <div class="product-title">
                    ${vo.productName}
                </div>
            </div>
            <div class="review-rating-box">
                <div class="rating-1">
                    <div class="title">상품을 사용해보셨나요?</div>
                    <div class="rating">
                        <div class="rating-status">
                            <input type="radio" class="rating" name="rating1" value="5" id="rate1-5" onclick='getChkValue1(event)'><label for="rate1-5">❤</label>
                            <input type="radio" class="rating" name="rating1" value="4" id="rate1-4" onclick='getChkValue1(event)'><label for="rate1-4">❤</label>
                            <input type="radio" class="rating" name="rating1" value="3" id="rate1-3" onclick='getChkValue1(event)'><label for="rate1-3">❤</label>
                            <input type="radio" class="rating" name="rating1" value="2" id="rate1-2" onclick='getChkValue1(event)'><label for="rate1-2">❤</label>
                            <input type="radio" class="rating" name="rating1" value="1" id="rate1-1" onclick='getChkValue1(event)'><label for="rate1-1">❤</label>
                        </div>
                        <div class="result1">선택하세요</div>
                    </div>
                </div>
                <div class="rating-1">
                    <div class="title">조립난이도는 어떤가요?</div>
                    <div class="rating">
                        <div class="rating-status-1">
                            <input type="radio" class="rating" name="rating2" value="5" id="rate2-5" onclick='getChkValue2(event)'><label for="rate2-5">❤</label>
                            <input type="radio" class="rating" name="rating2" value="4" id="rate2-4" onclick='getChkValue2(event)'><label for="rate2-4">❤</label>
                            <input type="radio" class="rating" name="rating2" value="3" id="rate2-3" onclick='getChkValue2(event)'><label for="rate2-3">❤</label>
                            <input type="radio" class="rating" name="rating2" value="2" id="rate2-2" onclick='getChkValue2(event)'><label for="rate2-2">❤</label>
                            <input type="radio" class="rating" name="rating2" value="1" id="rate2-1" onclick='getChkValue2(event)'><label for="rate2-1">❤</label>
                        </div>
                        <div class="result2">선택하세요</div>
                    </div>
                </div>
                <div class="rating-1">
                    <div class="title">상품을 추천하시나요?</div>
                    <div class="rating">
                        <div class="rating-status-1">
                            <input type="radio" class="rating" name="rating3" value="5" id="rate3-5" onclick='getChkValue3(event)'><label for="rate3-5">❤</label>
                            <input type="radio" class="rating" name="rating3" value="4" id="rate3-4" onclick='getChkValue3(event)'><label for="rate3-4">❤</label>
                            <input type="radio" class="rating" name="rating3" value="3" id="rate3-3" onclick='getChkValue3(event)'><label for="rate3-3">❤</label>
                            <input type="radio" class="rating" name="rating3" value="2" id="rate3-2" onclick='getChkValue3(event)'><label for="rate3-2">❤</label>
                            <input type="radio" class="rating" name="rating3" value="1" id="rate3-1" onclick='getChkValue3(event)'><label for="rate3-1">❤</label>
                        </div>
                        <div class="result3">선택하세요</div>
                    </div>
                </div>
                <div class="rating-1">
                    <div class="title">상품에 대한 만족도는 어떤가요?</div>
                    <div class="rating">
                        <div class="rating-status-1">
                            <input type="radio" class="rating" name="rating4" value="5" id="rate4-5" onclick='getChkValue4(event)'><label for="rate4-5">❤</label>
                            <input type="radio" class="rating" name="rating4" value="4" id="rate4-4" onclick='getChkValue4(event)'><label for="rate4-4">❤</label>
                            <input type="radio" class="rating" name="rating4" value="3" id="rate4-3" onclick='getChkValue4(event)'><label for="rate4-3">❤</label>
                            <input type="radio" class="rating" name="rating4" value="2" id="rate4-2" onclick='getChkValue4(event)'><label for="rate4-2">❤</label>
                            <input type="radio" class="rating" name="rating4" value="1" id="rate4-1" onclick='getChkValue4(event)'><label for="rate4-1">❤</label>
                        </div>
                        <div class="result4">선택하세요</div>
                    </div>
                </div>
            </div>
            <div class="text-box">
                <div class="title areaTitle">다른 사람들에게 상품에 대해 알려주세요</div>
                <div class="text-sm-box">
                    <textarea class="textContent" name="content" cols="75" rows="10" placeholder="다른 사람들에게 상품에 대해 알려주세요"></textarea>
                    <div class="textCnt">0/200</div>
                </div>
            </div>
            <div class="filebox">
            <input type="file" id="Review-file" name="fName">
            <label for="Review-file"><div class="file-sub"><img src="${ctp}/images/store/camera.webp" alt="카메라 이미지"><span>사진 첨부하기</span></div></label>
            </div>
            <div class="btn-box">
                <input type="button" onclick="window.close()" value="취소" class="cancel" />
                <input type="button" value="등록" class="regQnaBtn" onclick="regReview()" />
            </div>
            <input type="hidden" class="result1Value" name="result1Value" />
            <input type="hidden" class="result2Value" name="result2Value" />
            <input type="hidden" class="result3Value" name="result3Value" />
            <input type="hidden" class="result4Value" name="result4Value" />
            <input type="hidden" class="hostIP" name="hostIP" value="<%=request.getRemoteAddr()%>" /> 
            <input type="hidden" class="productIdx" name="productIdx" value="125" />
            <input type="hidden" class="productTitle" name="productTitle" value="일이삼" />
        </div>
    </form>
</body>
<script>
	$(".textContent").keyup(function(e) {
		let content = $(this).val();
		$(".textCnt").text(content.length + "/200");
		if (content.length > 200) {
			alert("최대 200자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 200));
			$('.textCnt').text("(200 / 최대 200자)");
            $('.textCnt').css("color","#d01012");
            $('.textCnt').css("font-weight","900");
		}
        else {
            $('.textCnt').css("color","#333");
            $('.textCnt').css("font-weight","400");
        }
	});

    let rating1 = document.querySelector('#rate1');
    let rating2 = document.querySelector('#rate2');
    let rating3 = document.querySelector('#rate3');
    let rating4 = document.querySelector('#rate4');
    let rating5 = document.querySelector('#rate5');
    
    function getChkValue1(event)  {
        let result1 = '';
        if(event.target.checked)  {
            result1 = event.target.value;
            document.querySelector('.result1').style.color ='#d01012';
            document.querySelector('.result1').style.fontWeight ='900';
            if(result1 == 1) {
                document.querySelector('.result1').textContent = "1점 (별로에요)";
                document.querySelector('.areaTitle').innerText = "만족도 1점을 주셨네요. \n 어떤점이 아쉬웠나요?";
            }     
            if(result1 == 2) {
                document.querySelector('.result1').textContent = "2점 (그저 그래요)";
                document.querySelector('.areaTitle').innerText = "만족도 2점을 주셨네요. \n 어떤점이 아쉬웠나요?";
            }
            if(result1 == 3) {
                document.querySelector('.result1').textContent = "3점 (괜찮아요)";
                document.querySelector('.areaTitle').innerText = "만족도 3점을 주셨네요. \n 어떤점이 좋았나요?";
            } 
            if(result1 == 4) {
                document.querySelector('.result1').textContent = "4점 (좋아요)";
                document.querySelector('.areaTitle').innerText = "만족도 4점을 주셨네요. \n 어떤점이 좋았나요?";
            }
            if(result1 == 5) {
                document.querySelector('.result1').textContent = "5점 (최고에요)";
                document.querySelector('.areaTitle').innerText = "만족도 5점을 주셨네요. \n 어떤점이 좋았나요?";
            }
            document.querySelector('.result1Value').value = result1;
        }
    }
    function getChkValue2(event)  {
        let result2 = '';
        if(event.target.checked)  {
            result2 = event.target.value;
            document.querySelector('.result2').style.color ='#6667AB';
            document.querySelector('.result2').style.fontWeight ='900';
            if(result2 == 1) document.querySelector('.result2').textContent = "1점 (너무 쉬워요)";
            if(result2 == 2) document.querySelector('.result2').textContent = "2점 (쉬워요)";
            if(result2 == 3) document.querySelector('.result2').textContent = "3점 (적당해요)";
            if(result2 == 4) document.querySelector('.result2').textContent = "4점 (조금 어려워요)";
            if(result2 == 5) document.querySelector('.result2').textContent = "5점 (어려워요)";
            document.querySelector('.result2Value').value = result2;
        }
    }
    function getChkValue3(event)  {
        let result3 = '';
        if(event.target.checked)  {
            result3 = event.target.value;
            document.querySelector('.result3').style.color ='#6667AB';
            document.querySelector('.result3').style.fontWeight ='900';
            if(result3 == 1) document.querySelector('.result3').textContent = "1점 (별로에요)";
            if(result3 == 2) document.querySelector('.result3').textContent = "2점 (그저 그래요)";
            if(result3 == 3) document.querySelector('.result3').textContent = "3점 (괜찮아요)";
            if(result3 == 4) document.querySelector('.result3').textContent = "4점 (추천해요)";
            if(result3 == 5) document.querySelector('.result3').textContent = "5점 (적극 추천해요)";
            document.querySelector('.result3Value').value = result3;
        }
    }
    function getChkValue4(event)  {
        let result4 = '';
        if(event.target.checked)  {
            result4 = event.target.value;
            document.querySelector('.result4').style.color ='#6667AB';
            document.querySelector('.result4').style.fontWeight ='900';
            if(result4 == 1) document.querySelector('.result4').textContent = "1점 (별로에요)";
            if(result4 == 2) document.querySelector('.result4').textContent = "2점 (그저 그래요)";
            if(result4 == 3) document.querySelector('.result4').textContent = "3점 (괜찮아요)";
            if(result4 == 4) document.querySelector('.result4').textContent = "4점 (좋아요)";
            if(result4 == 5) document.querySelector('.result4').textContent = "5점 (최고에요)";
            document.querySelector('.result4Value').value = result4;
        }
    }
    
    function regReview() {
    	if(document.querySelector('.result1Value').value == "") {
    		alert('1번 평가가 진행되지 않았습니다.');
    		return false;
    	}
    	else if(document.querySelector('.result2Value').value == "") {
    		alert('2번 평가가 진행되지 않았습니다.');
    		return false;
    	}
    	else if(document.querySelector('.result3Value').value == "") {
    		alert('3번 평가가 진행되지 않았습니다.');
    		return false;
    	}
    	else if(document.querySelector('.result4Value').value == "") {
    		alert('4번 평가가 진행되지 않았습니다.');
    		return false;
    	}
    	else if(myform.content.value == '') {
    		alert('상품평을 입력해주세요');
    		myform.content.focus();
    		return false;
    	}
    	else {
    		myform.submit();
    	}
    }
    
    
</script>

</html>