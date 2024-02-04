<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>원산지 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        * {
            /* border: 1px solid red; */
            box-sizing: border-box;
        }

        .content_outer {
            width: 100%;
            height: 100px;
            margin-top: 6%;
        }
        
        .content_nav {
        	width: 100%;
        }

        .content_nav > div {
            float: left;
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
            border: none;
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

        .insertbtn {
            width: 350px;
            height: 40px;
            margin-top: 20px;
        }
        
        .delete-btn {
        	height: 30px;
        	background-color: gray;
        }
        
        .delete-btn:hover {
        	background-color: lightgray;
        }

		.pagination{
			justify-content: center;
		}
	
    </style>
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- content 시작 -->
    <div class="content_outer">
        <div class="content_nav">
            <div class="content_title">원산지 관리</div>
            <div class="btn1"><button onClick="location.href='${contextPath}/category'">카테고리 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/menu'">메뉴 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/option'">옵션 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/coo'">원산지 관리</button></div>
            <div class="btn1"><button onclick="" class="insertCoo">원산지 등록</button></div>
        </div>
        <div class="content">
            <div class="table_outer">
                <table class="option_table">
                    <thead>
                        <tr>
                            <th style="width:5%;">원산지 번호</th>
                            <th style="width:20%;">재료 이름</th>
                            <th style="width:20%;">원산지</th>
                            <th style="width:7%;">삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${empty list}">
                    		<td colspan="4">원산지 리스트가 없습니다.</td>
                    	</c:if>
                    	<c:forEach var="coo" items="${list }">
						<tr>
							<td>${coo.cooNo }</td>
							<td>${coo.cooName }</td>
							<td>${coo.cooCountry }</td>
							<td>
								<form method="post" action="${contextPath}/deleteCoo/${coo.cooNo}">
                					<button class="delete-btn" type="submit">삭제</button>
            					</form>
            				</td>
						</tr>
						</c:forEach>
                    </tbody>
                </table>
                
            </div>
        </div>
        
        <c:set var="url" value="coo?currentPage="/>
        
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

    <!-- 메뉴 등록 모달 -->
    <div id="insertCooModal" class="modal" style="display: none;">
    <form action="${contextPath }/insertCoo" method="post">
        <div class="modal-content">
            <div class="modal_header">원산지 등록 <span class="closeModal" onclick="closeModal();">X</span></div>
            <hr>
            <div class="modal_content">
                <div class="coo_name">재료 이름</div>
                <div><input type="text" name="cooName" placeholder="재료 이름을 입력하세요"></div>
                <div>원산지</div>
                <div><input type="text" name="cooCountry" placeholder="원산지를 입력하세요"></div>
            </div>
            <button class="insertbtn" onclick="closeModal()">등록</button>
        </div>
        </form>
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script>
        const insertCoo = document.querySelector('.insertCoo');
        const insertCooModal = document.getElementById('insertCooModal');

        function openModal() {
            insertCooModal.style.display = 'block';
        }

        function closeModal() {
            insertCooModal.style.display = 'none';
        }

        insertCoo.addEventListener('click', openModal);

        window.addEventListener('click', (event) => {
            if (event.target === insertCooModal) {
                closeModal();
            }
        });
        
        $("#header-menu").addClass("header_btn_on").removeClass("header_btn");
    </script>

</body>
</html>