<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카테고리 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        * {
            /* border: 1px solid red; */
            box-sizing: border-box;
        }
        
        body {
        	height: 800px;
        }
        
        a {
        	color: white;
        	text-decoration: none;
        	background-color: black;
        }

		.pagination {
			justify-content: center;
		}

        .content_outer {
            width: 100%;
            height: 50%;
            margin-top: 6%;
        }

        .content_nav > div {
            float: left;
        }
        
        .content_nav {
        	width: 100%;
        }

        .content_title {
            width: 48.7%;
            font-size: 40px;
            font-weight: bolder;
            margin-left: 6%;
            margin-top : 20px;
        }

        .btn1 {
            width: 8%;
            height: 62px;
            display: flex;
            margin-top : 20px;
        }

        button {
            width: 80%;
			height: 65%;
			border-radius: 5px;
			margin: auto auto;
			cursor: pointer;
			background-color: #FF8B3D;
			color: white;
			font-weight: bolder;
			border: none;
			font-size: 14px;
        }

        button:hover {
            background-color: wheat;
        }

        .content {
            width: 100%;
            margin-top: 130px;
            height: 75vh;
        }

        .option_table {
            width: 88%;
            margin: 0 auto;
            border-bottom: 1px solid lightgray;
            border-spacing: 0px;
        }

        td {
            text-align: center;
            height: 50px;
            font-size: 2vh;
            border-bottom: 1px solid lightgray;
        }

        th {
            height: 55px;
            background-color: lightgrey;
            font-size: 2.3vh;
            text-align: center;
        }

        /* 모달 스타일 */
        .modal {
            display: block;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            overflow: auto;
        }

        .modal-content {
            background-color: white;
            margin: 14% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 400px;
            height: 380px;
            border-radius: 5px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .close-button {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close-button:hover,
        .close-button:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .checkbutton {
            width: 350px;
            margin: 20px auto
        }

        .modal_header {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .modal_content {
            margin-top: 10px;
        }

        .modal_content div{
            text-align: left;
            margin-bottom: 10px;
        }

        .modal_content input[type=text], select {
            height: 30px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid lightgray;
            padding-left: 5px;
        }

        .closeModal {
            position: absolute;
            right: 10%;
            color:#FF8B3D
        }

        .closeModal:hover {
            cursor: pointer;
        }

        .insertbtn, .updatebtn {
            width: 350px;
            height: 40px;
            margin-top: 20px;
        }

        select {
            height: 30px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid lightgray;
            padding-left: 5px;
        }
        
        #categoryName {
        	font-size: 17px;
        }
        
        .update-btn, .delete-btn {
        	height: 30px;
        }
        
        .delete-btn {
        	background-color: gray;
        }
        
        .delete-btn:hover {
        	background-color: lightgray;
        }

    </style>
</head>
<body>
    
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- content 시작 -->
    <div class="content_outer">
        <div class="content_nav">
            <div class="content_title">카테고리 관리</div>
            <div class="btn1"><button type=button onClick="location.href='${contextPath}/category'">카테고리 관리</button></div>
            <div class="btn1"><button type=button onClick="location.href='${contextPath}/menu'">메뉴 관리</button></div>
            <div class="btn1"><button type=button onClick="location.href='${contextPath}/option'">옵션 관리</button></div>
            <div class="btn1"><button type=button onClick="location.href='${contextPath}/coo'">원산지 관리</button></div>
            <div class="btn1"><button class="insertCategory">카테고리 등록</button></div>
        </div>
        <div class="content">
            <div class="table_outer">
                <table class="option_table">
                    <thead>
                        <tr>
                            <th style="width:8%;">카테고리 번호</th>
                            <th style="width:20%;">카테고리 이름</th>
                            <th style="width:10%;">상위 카테고리 이름</th>
                            <th style="width:8%;">수정</th>
                            <th style="width:8%;">삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty list}">
                    		<td colspan="5">카테고리가 없습니다.</td>
                    	</c:if>
                    	<c:forEach var="category" items="${list }">
						<tr>
							<td>${category.categoryNo }</td>
							<td>${category.categoryName }</td>
							<td>${category.prCategoryName }</td>
							<td><button class="update-btn updateCategory" type="button" onclick="openModal2(${category.categoryNo})">수정</button></td>
                            <td>
                            	<form method="post" action="${contextPath}/deleteCategory/${category.categoryNo}">
                					<button class="delete-btn" type="submit">삭제</button>
            					</form>
                            </td>
						</tr>
						</c:forEach>
                    </tbody>
                </table>
                
            </div>
        </div>
        
        <c:set var="url" value="category?currentPage="/>
        
        <c:if test="${not empty param.condition }">
			<c:set var="sUrl" value="&condition=${param.condition }&keyword=${param.keyword }"/>
		</c:if>
        
		<div id="pagingArea">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">이전 페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${url}${pi.currentPage - 1}${sUrl}">이전 페이지</a></li>
					</c:otherwise>
				</c:choose>
	
				<c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
					<li class="page-item"><a class="page-link" href="${url}${item}${sUrl}">${item}</a></li>
				</c:forEach>
	
				<c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage}">
						<li class="page-item disabled"><a class="page-link" href="#">다음 페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${url}${pi.currentPage + 1}${sUrl}">다음 페이지</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
    </div>

    <br><br><br><br>
    
    

    <!-- 카테고리 수정 모달 -->
    <div id="updateCategoryModal" class="modal" style="display: none;">
    	<form action="${contextPath }/updateCategory" method="post">
        <div class="modal-content">
            <div class="modal_header">카테고리 수정 <span class="closeModal" onclick="closeModal2();">X</span></div>
            <hr>
            <div class="modal_content">
            	<input type="hidden" name="categoryNo" class="updateCategoryNo">
                <div class="coo_name">카테고리 이름</div>
                <div><input type="text" name="categoryName" id="categoryName" placeholder="카테고리 이름을 입력하세요"></div>
                <div>상위 카테고리 이름</div>
                <div>
                    <select name="prCategoryNo" id="prCategoryNo">
                    </select>
                </div>
            </div>
            <button type="submit" class="updatebtn" onclick="closeModal()">수정</button>
        </div>
        </form>
    </div>

    <!-- 카테고리 등록 모달 -->
    <div id="insertCategoryModal" class="modal" style="display: none;">
        <div class="modal-content">
        	<form action="${contextPath }/insertCategory" method="post">
            	<div class="modal_header">카테고리 등록 <span class="closeModal" onclick="closeModal();">X</span></div>
            	<hr>
            	<div class="modal_content">
                	<div class="coo_name">카테고리 이름</div>
                	<div><input type="text" name="categoryName" id="categoryName" placeholder="카테고리 이름을 입력하세요"></div>
                	<div>상위 카테고리 번호</div>
                	<div>
                    	<select name="prCategoryNo" id="prCategoryNo2">
                    	</select>
                	</div>
            	</div>
            	<button type="submit" class="insertbtn" onclick="closeModal()">등록</button>
            </form>
        </div>
    </div>

	<c:set var="url" value="${boardCode }?currentPage=" />

	<c:if test="${not empty param.condition }">
		<c:set var="sUrl"
			value="&condition=${param.condition }&keyword=${param.keyword }" />
	</c:if>

	<script>
        const updateCategory = document.querySelector('.updateCategory');
        const insertCategory = document.querySelector('.insertCategory');
        const insertCategoryModal = document.getElementById('insertCategoryModal');
        const updateCategoryModal = document.getElementById('updateCategoryModal');

        function openModal() {
            insertCategoryModal.style.display = 'block';
            
			$.ajax({
				url : "${contextPath}/selectCategoryList",
				method : "get",
				success : function(result) {
					let str = "<option value=" + 0 + ">없음</option>";
    				for(let i = 0; i < result.length; i++) {
    					if(result[i].prCategoryNo == 0) {
	    					str += "<option value=" + result[i].categoryNo + ">" + result[i].categoryName + "</option>";
    					}
    				}	
    				$("#prCategoryNo2").html(str);
				}
			})            
            
        }

        function closeModal() {
            insertCategoryModal.style.display = 'none';
        }

        function openModal2(categoryNo) {
            updateCategoryModal.style.display = 'block';
            
            $.ajax({
                url: "${contextPath}/selectCategoryList",
                method: "get",
                success: function(result) {
                    let str = "<option value=" + 0 + ">없음</option>";
                    for (let i = 0; i < result.length; i++) {
                        if (result[i].prCategoryNo == 0) {
                            str += "<option value=" + result[i].categoryNo + ">" + result[i].categoryName + "</option>";
                        }
                    }	
                    $("#prCategoryNo").html(str);

                    $.ajax({
                        url: "${contextPath}/selectCategory",
                        method: "post",
                        data: { categoryNo: categoryNo },
                        success: function(data) {
                            $(".updateCategoryNo").val(data.categoryNo);
                            $("#categoryName").val(data.categoryName);
                            // 상위 카테고리 선택
                            $("#prCategoryNo option").each(function() {
                                if ($(this).val() == data.prCategoryNo) {
                                    $(this).prop("selected", true);
                                } else {
                                    $(this).prop("selected", false);
                                }
                            });
                        }
                    });
                }
            });

            
        }

        function closeModal2() {
            updateCategoryModal.style.display = 'none';
        }

        insertCategory.addEventListener('click', openModal);
        updateCategory.addEventListener('click', openModal2);

        window.addEventListener('click', (event) => {
            if (event.target === insertCategoryModal || event.target === updateCategoryModal) {
                closeModal();
            }
        });
        
        $("#header-menu").addClass("header_btn_on").removeClass("header_btn");
    </script>

</body>
</html>