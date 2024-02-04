<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이용권 결제</title>
<style>
* {
	/* border: 1px solid red; */
	box-sizing: border-box;
}
.content { 
    width: 1500px; 
    height: 800px; 
    margin: 0 auto;
    margin-top: 80px;
    padding-top: 40px;
    position: relative;
    overflow: hidden;
}
.content_title {
	font-size: 40px;
	font-weight: bolder;
}
.lisence-category{
	font-size: 24px;
}
.lisence-outer{
	display: flex;
	align-content: space-around;
}
.lisence-list{
	box-shadow: 0 5px 7px #ccc;
	border-radius: 15px;
	padding: 30px;
	align-items: center;
	margin: 0 auto;
}
.lisence-content{
	display: flex;
}
.license-year{
	width: 49%;
}
.license-month{
	width: 32%;
}
.license-info{
	flex: 1 1 0;
}

.lisenece-title{color: orange; font-size: 20px;}
.lisenece-price{margin-bottom: 30px;}

.lisenece-btn{
	flex: 1 1 0;
	text-align: center;
	width: 100%;
}
.pay {
	width: 100%;
	padding: 12px 0;
	font-size: 16px;
	border: none;
	background-color: orange;
	color: white;
}
.pay:hover{
	background-color: #FF8B3D;
}
.pay:active{
    position: relative;
    top: 1px;
}
.lisence-list>li{font-size: 12px; color: gray; margin-top: 10px;}

button {
    border-radius: 5px;
    background-color: #eee;
    cursor: pointer;
    border:none;
    box-shadow: 1px 3px 4px rgb(0, 0, 0, 0.3);
}
button:active {
    box-shadow: 1px 1px 0 rgb(0, 0, 0, 0.1);
    position: relative;
    top: 2px;
}

</style>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="outer">
	<div class="content">
		<div class="content_title">이용권 결제</div><br>
		
		<div class="lisence-category">연간 이용권</div><br>
		
		<div class="lisence-outer">
			<div class="lisence-list license-year">
				<div class="lisence-content">
					<div class="license-info">
						<span class="lisenece-title">2년 이용권</span><br>
						<span class="lisenece-price"><s>1,200,000</s> ▶ 900,000원</span>
					</div>
					<div class="lisenece-btn"><button value="결제" class="pay" onclick="requestPay(900000)">결제</button></div>
				</div>
				<br>
				<li>FORK 2년(24개월) 이용권</li>
				<li>300,000원 절감 효과</li>
			</div>
			<div class="lisence-list license-year">
				<div class="lisence-content">
					<div class="license-info">
						<span class="lisenece-title">1년 이용권</span><br>
						<span class="lisenece-price"><s>600,000</s> ▶ 550,000원</span>
					</div>
					<div class="lisenece-btn"><button value="결제" class="pay" onclick="requestPay(550000)">결제</button></div>
				</div>
				<br>
				<li>FORK 1년(12개월) 이용권</li>
				<li>50,000원 절감 효과</li>
			</div>
		</div>
		
		<br>
		
		<br><div class="lisence-category">월간 이용권</div><br>
		
		<div class="lisence-outer">
			<div class="lisence-list license-month">
				<div class="lisence-content">
					<div class="license-info">
						<span class="lisenece-title">9개월 이용권</span><br>
						<span class="lisenece-price">450,000원</span>
					</div>
					<div class="lisenece-btn"><button value="결제" class="pay" onclick="requestPay(450000)">결제</button></div>
				</div>
			</div>
			<div class="lisence-list license-month">
				<div class="lisence-content">
					<div class="license-info">
						<span class="lisenece-title">6개월 이용권</span><br>
						<span class="lisenece-price">300,000원</span>
					</div>
					<div class="lisenece-btn"><button value="결제" class="pay" onclick="requestPay(300000)">결제</button></div>
				</div>
			</div>
			<div class="lisence-list license-month">
				<div class="lisence-content">
					<div class="license-info">
						<span class="lisenece-title">3개월 이용권</span><br>
						<span class="lisenece-price">150,000원</span>
					</div>
					<div class="lisenece-btn"><button value="결제" class="pay" onclick="requestPay(100)">결제</button></div>
				</div>
		</div>
		
		
	</div>
</div>

	<!-- 결제API -->
	<!-- <script src="payAPI.js"></script> -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
    	$("#header-license").addClass("header_btn_on").removeClass("header_btn");
   	  
   	    var today = new Date();   
		    
		function requestPay(amount) {
			IMP.init("imp52171157"); 
	    	IMP.request_pay({
	    		pg : 'nice', 
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '이용권'/*상품명*/,
			    amount : amount/*상품 가격*/, 
			    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
			    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
			    buyer_postcode : '123-456'/*구매자 우편번호*/
		    }, function (rsp) { // callback
		        if (rsp.success) {
		        	$.ajax({
		        		url : "${contextPath}/insertLicense",
		        		method : "post",
		        		data : {
		        			memberNo : ${loginUser.getMemberNo()},
		        			licensePrice : amount
		        		},
		        		success : function(data) {
		        			alert("결제에 성공하셨습니다.");
		        			location.href="http://localhost:8082/user/license";
		        		},
		        		error : function() {
		        			alert("결제에 실패했습니다.");
		        			location.href="http://localhost:8082/user/license";
		        		}
		        	})
		        } else {
		            console.log("결제 실패: " + rsp.error_msg);
		        }
		    });
		}
</script>

</body>

</html>