<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="resources/css/kitchen/kitchen.css">
</head>
<body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<div class="outer">
	<div>
		<audio id="notificationSound" preload="none">
	    	<source src="resources/audio/kitchenCall.mp3" type="audio/mpeg">
		</audio>
	</div>

	<c:if test="${not empty orderList}">
		<c:forEach var="orderPage" items="${orderList}">
		<div class="order-page">
			<div class="order-page-top">
				${orderPage.strucTitle} ${orderPage.payDate}
			</div>
			<div class="order-page-content">
				<c:forEach var="menuList" items="${orderPage.menuOption}">
					<li>
						${menuList.cnt} x ${menuList.menuName}
						<c:if test="${menuList.optionName ne null}">
							( ${menuList.optionName} )
						</c:if>
					</li>
				</c:forEach>	
			</div>
		</div>
   		</c:forEach>
	</c:if>

</div>
    
<script type="text/javascript" src="resources/js/kitchen/kitchen.js"></script>    
</body>
</html>