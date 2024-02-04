<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/common/header.css">
</head>
<body>

	<c:if test="${not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg"/>
	</c:if>

   <div class="header_outer">
        <div class="header">
            <div class="header_btn" onclick="location.href='main'">HOME</div>
            <div class="header_btn" onclick="location.href='salesReady'" id="sales-ready">영업준비</div>
            <div class="header_btn" onclick="location.href='statistics'" id="statistics">판매집계</div>
            <div class="header_btn" onclick="location.href='menu'" id="header-menu">메뉴</div>
            <div class="header_btn" onclick="location.href='license'" id="header-license">결제</div>
            <div class="header_btn" onclick="location.href='http://192.168.30.14:8084/fork/qnaList'">문의</div>
            <div class="header_btn" onclick="location.href='kitchen'">주방으로가기</div>
            <div class="header_btn" onclick="openModal5();">로그아웃</div>
            <div id="time"></div>
            <div class="forklogo">
                <img src="resources/img/fork2.png" width="170px" />
            </div>
        </div>
    </div>
    
    <!-- 로그아웃 확인 모달 -->
    <div id="logoutPage" class="logoutPage" style="display:  none;">
        <div class="logoutPage-content">
        	정말 로그아웃하시겠습니까?<span class="closeModal5" onclick="closeModal5();"><img src="resources/img/동글엑스.svg" style="width:2%"></span>
        	<button class="closebutton5" onclick="location.href='logout'">확인</button>
        </div>
    </div>
    
    <script type="text/javascript" src="resources/js/common/header.js"></script>
</body>
</html>