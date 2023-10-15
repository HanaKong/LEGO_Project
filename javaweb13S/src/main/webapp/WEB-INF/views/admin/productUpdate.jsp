<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${ctp}/css/default.css">
<link rel="stylesheet" href="${ctp}/css/regProduct.css">
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<title>상품수정</title>
<script type="text/javascript">
	'use strict';
	
	function regProductChk() {
		
		let categoryCode = myform.categoryCode.value;
		let productCode = myform.productCode.value;
		let productName = myform.productName.value;
		let price = myform.price.value;
		let discountRate = myform.discountRate.value;
		let age = myform.age.value;
		let partsNumber = myform.partsNumber.value;
		let point = myform.point.value;
		let stock = myform.stock.value;
		let file = myform.file.value;
		let content = myform.content.value;
		let ext = file.substring(file.lastIndexOf(".")+1).toUpperCase();
		
		if(productCode == "") {
			alert("상품코드를 입력해주세요.");
			return false;
		}
		else if(productName == "") {
			alert("상품명을 입력해주세요.");
			return false;
		}
		else if(price == "") {
			alert("상품가격을 입력해주세요.");
			return false;
		}
		else if(discountRate == "") {
			alert("할인율을 입력해주세요.");
			return false;
		}
		else if(age == "") {
			alert("나이를 입력해주세요.");
			return false;
		}
		else if(partsNumber == "") {
			alert("부품수를 입력해주세요.");
			return false;
		}
		else if(point == "") {
			alert("포인트를 입력해주세요.");
			return false;
		}
		else if(stock == "") {
			alert("재고량을 입력해주세요.");
			return false;
		}
		else if(file == "") {
			alert("메인 사진을 선택해주세요.");
			return false;
		}
		else if(ext != "JPG" && ext != "GIF" && ext != "PNG" && ext != "JPEG" &&  ext != "WEBP" ) {
			alert("업로드 가능한 파일이 아닙니다.");
			return false;
		}
		else if(document.getElementById("fName").value != "") {
			var maxSize = 1024 * 1024 * 30;  // 10MByte까지 허용
			var fileSize = document.getElementById("fName").files[0].size;
			if(fileSize > maxSize) {
				alert("첨부파일의 크기는 30MB 이내로 등록하세요");
				return false;
			}
			else {
				myform.submit();
			}
		}
	}
</script>
</head>
<body>
<div class="admin-container">
	<jsp:include page="/WEB-INF/views/include/adminLeft.jsp" /> 
	<div class="admin-right-container">
	    <h2>상품 수정</h2>
	    <hr class="right-item-title-under"/>
	    <div class="item-conatainer">
		    <form name="myform" method="post" enctype="multipart/form-data">
		        <div class="category-box">
		            <div class="item-input-box">
		                <div class="item-input-text">카테고리 코드</div>
		                <div class="value-input-box">
		                    <select name="categoryCode">
				                <c:forEach var="regVO" items="${vos}" varStatus="st">
				                        <option value="${regVO.categoryCode}">${regVO.categoryName}</option>
		                  		</c:forEach>
		                    </select>
		                </div>
		            </div>
		            <div class="item-input-box">
		                <div class="item-input-text">상품 코드</div>
		                <div class="value-input-box">
		                    <input type="number" name="productCode" placeholder="상품 코드를 입력해주세요." value="${vo.productCode}" required />
		                </div>
		            </div>
		            <div class="item-input-box">
		                <div class="item-input-text">상품명</div>
		                <div class="value-input-box">
		                    <input type="text" name="productName" placeholder="상품의 이름을 입력해주세요" value="${vo.productName}" required />
		                </div>
		            </div>
		            <div class="item-input-box">
		                <div class="item-input-text">가격</div>
		                <div class="value-input-box">
		                    <input type="number" name="price" placeholder="가격을 입력해주세요."  value="${vo.price}" />
		                </div>
		            </div>
		            <div class="item-input-box">
		                <div class="item-input-text">할인율</div>
		                <div class="value-input-box">
		                    <input type="number" name="discountRate" placeholder="할인율을 입력해주세요."  value="${vo.discountRate}" required/>
		                </div>
		                <span>※ 1-100(%)까지의 숫자</span>
		            </div>
		            <div class="item-input-box">
		                <div class="item-input-text">연령</div>
		                <div class="value-input-box">
		                    <input type="text" name="age" placeholder="나이제한을 입력해주세요" value="${vo.age}"  required/>
		                </div>
		                <span>※ 예시&#41; 8+ </span>
		            </div>
		            <div class="item-input-box">
		                <div class="item-input-text">부품수</div>
		                <div class="value-input-box">
		                    <input type="number" name="partsNumber" placeholder="부품수를 입력해주세요" value="${vo.partsNumber}"  required/>
		                </div>
		            </div>
		            <div class="item-input-box">
		                <div class="item-input-text">VIP 포인트</div>
		                <div class="value-input-box">
		                    <input type="number" name="point" placeholder="적립될 포인트를 입력해주세요" value="${vo.point}" required/>
		                </div>
		            </div>
		            <div class="item-input-box">
		                <div class="item-input-text">재고</div>
		                <div class="value-input-box">
		                    <input type="number" name="stock" placeholder="재고를 입력해주세요." value="${vo.stock}" required/>
		                </div>
		            </div>
		
		            <div class="item-input-box">
		                <div class="item-input-text">판매 ON/OFF</div>
		                <div class="value-input-box radio-btn-align">
		                    <input type="radio" name="switchItem" id="switchOn" value="1" <c:if test="${vo.switchItem == 1}">checked</c:if>>
		                    <label for="switchOn">ON</label>
		                    <input type="radio" name="switchItem" id="switchOff" value="0" <c:if test="${vo.switchItem == 0}">checked</c:if>>
		                    <label for="switchOff">OFF</label>
		                </div>
		            </div>
		            <div class="item-input-box">
		                <div class="item-input-text">제품사진</div>
		                <div class="value-input-box fName-box-align">
		                    <input class="fName-view" value="첨부파일" placeholder="첨부파일" value="${ctp}/data/admin/product/thumbnail/${vo.FName}" readonly></input>
		                    <div class="input-input-file">
		                        <input type="file" name="file" id="fName" />
		                        <label for="fName" class="fName-label">파일찾기</label>
		                    </div>
		                </div>
		                <span>※ 썸네일 사진 </span>
		            </div>
		            <div class="item-input-box-box">
	                    <div class="item-input-text-text">제품정보</div>
	                    <div class="value-input-box-box"><textarea rows="6" name="content" id="CKEDITOR" class="form-control" required>${vo.content}</textarea></div>
	                </div>
	                <script>
	                CKEDITOR.replace("content",{
	                	height:400,
	                	filebrowserUploadUrl:"${ctp}/admin/imageUpload",	/* 파일(이미지) 업로드시 매핑경로 */
	                	uploadUrl : "${ctp}/admin/imageUpload"		/* 여러개의 그림파일을 드래그&드롭해서 올리기 */
	                });
	                </script>
		            <div class="item-input-box-btn">
		                <input type="button" value="등록" onclick="regProductChk()" />
		            </div>
		        </div>
			</form>
	    </div>
	</div>
</div>
</body>
<script>
    $("#fName").on('change',function(){
        var fileName = $("#fName").val();
        $(".fName-view").val(fileName);
    });
</script>
</html>