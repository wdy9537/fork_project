<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>FORK</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	
    <script type="text/javascript" src="resources/js/waypoints.min.js"></script>
    <script type="text/javascript" src="resources/js/jquery.counterup.min.js"></script>
   
    <script type="text/javascript" src="resources/js/slick.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/js/slick-theme.css" /> 
    <link rel="stylesheet" type="text/css" href="resources/js/slick.css" />
	
   <style>
        *{
            box-sizing: border-box;
            font-family: 'GmarketSansMedium';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
        }
        
        @font-face {
		    font-family: 'GmarketSansMedium';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}

        li{
            list-style-type: none;
        }

        body{
            margin: 0;
            padding: 0;
            
        }

        #content{
            width: 100%;  
            padding-top: 100px;
            padding-bottom: 50px;
        }

        /* 슬라이드가 페이지를 확대/축소해도 크기 고정!! */
        .content1-container {
            width: 100%; 
        }

        .slide1>img {
            width: 100%; 
            height: auto; 
            max-width: 100%; 
            max-height: 100%; 
        }


        /* 텍스트 content */
        #content2{
            display: flex;
            justify-content: space-around;
            padding: 50px 0;
        }
        
        #content2-1{
            font-size: 20px;
            font-weight: bold;
            color: darkgray;        
        }

        #content2-2{
            font-size: 70px;
            font-weight: 900;  
            margin-bottom: 50px;        
        }

        #content2-3{
            font-size: 20px;
            /* font-weight: bold; */
            
        }

        .content2-box{
            border-left: 5px solid #FF8B3D;
        }

        .content2-text{
            text-align: center;
            text-shadow: 3em;
        }

        .content2-text1{
            font-size: 20px;
            font-weight: 600;
            color: #FF8B3D;
        }

        .content2-text2{
            font-size: 30px;
            font-weight: 600;

        }

        .content2-container{
            /* background-color:rgb(241, 218, 182) ; */
            padding: 100px 0;
            /* background-image: linear-gradient(rgba(17, 17, 17, 0.5), rgba(17, 17, 17, 0.5)), 
                              url(resources/img/main-img2.jpg); */
        }

        /* 롤링배너 */

        .content3-container{
            margin: 100px 0;
        }

        .rolling-text{
            margin: 30px 0;
            text-align: center;
        }
        
        .rolling-text1 {
            font-size: 20px;
            color: #FF8B3D;  
            font-weight: bold;
        }

        .rolling-text2{
            font-size: 30px;        
            font-weight: bold;
            margin-bottom: 30px;
        }

        .content3-1, .content3-2, .content3-3 {
            display: flex;
            overflow: hidden;         
        }

        .content3-1 .rolling-list1 ul,
        .content3-2 .rolling-list2 ul,
        .content3-3 .rolling-list3 ul{ 
	        display: flex;
            padding: 0;
            margin: 0; 
        }

        

        .content3-1 .rolling-list1 ul li,
        .content3-2 .rolling-list2 ul li,
        .content3-3 .rolling-list3 ul li{
            width: 120px;
            height: 60px; 
        }

        .content3-1 .rolling-list1 ul li .image-wrap img,
        .content3-2 .rolling-list2 ul li .image-wrap img,
        .content3-3 .rolling-list3 ul li .image-wrap img{        
            width: 100%;
            height: 100%; 
        }

        .content3-btn{
            text-align: center;
            margin: 50px 0 100px 0;
        }
        .content3-btn>button{
            border: 1px solid #FF8B3D;
            border-radius: 12px;
            background-color: #FF8B3D;
            color: white;
            width: 190px;
            height: 70px;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
            
        }

        .content3-btn>button:hover{
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2), -2px -2px 4px rgba(255, 255, 255, 0.2);
        }
        
        /* 롤링배너 애니메이션 & 키프레임!! */

        .rolling-list1.original {
            animation: rollingleft1 70s linear infinite;
        }
        .rolling-list1.clone {
            animation: rollingleft2 70s linear infinite;   
        }

        @keyframes rollingleft1 {
            0% { transform: translateX(0); }
            50% { transform: translateX(-100%); }
            50.01% { transform: translateX(100%); }
            100% { transform: translateX(0); }
        }

        @keyframes rollingleft2 {
            0% { transition: translateX(0); }
            100% { transform: translateX(-200%); }
        }

        .rolling-list2.original2 {
            animation: rollingleft3 60s linear infinite;
        }
        .rolling-list2.clone2 {
            animation: rollingleft4 60s linear infinite;   
        }

        @keyframes rollingleft3 {
            0% { transform: translateX(0); }
            50% { transform: translateX(-100%); }
            50.01% { transform: translateX(100%); }
            100% { transform: translateX(0); }
        }

        @keyframes rollingleft4 {
            0% { transition: translateX(0); }
            100% { transform: translateX(-200%); }
        }

        .rolling-list3.original3 {
            animation: rollingleft5 70s linear infinite;
        }
        .rolling-list3.clone3 {
            animation: rollingleft6 70s linear infinite;   
        }

        @keyframes rollingleft5 {
            0% { transform: translateX(0); }
            50% { transform: translateX(-100%); }
            50.01% { transform: translateX(100%); }
            100% { transform: translateX(0); }
        }

        @keyframes rollingleft6 {
            0% { transition: translateX(0); }
            100% { transform: translateX(-200%); }
        }

        
        
        .content4-container{
            padding: 100px 0;
            background-color: rgba(177, 177, 177, 0.5);
        }

        #content4 {
            padding: 0 80px;
        }

        .content4-text{
            text-align: center;
            margin : 0 0 50px 0;
            
        }

        .content4-text1{
            font-size: 20px;
            font-weight: 600;
            color: #FF8B3D;

        }

        .content4-text2{
            font-size: 30px;
            font-weight: 600;

        }

        .slide2>img{
            width: 340px;
            height: 310px;
            border-radius: 15%;
            border: 3px solid #FF8B3D;
        }

        /* 슬라이드2 사이 간격 조정해서 옆에 살짝 보이는 슬라이드를 없애기! */
        .slide2 {
            margin: 0 34px; 
        }

        
        #chatbot-button {
            position: fixed;
            bottom: 100px;
            right: 150px;
            border: none;
            padding: none;
            
        }

        #chatbot-button img{
            width: 100px;
            height: 100px;
            cursor: pointer;
        }
        
        
        /* 모달 스타일 */
		.modal {
		    display: none;
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0, 0, 0, 0.6); 
		}
		
		.chatbot-modal, .chatbot-modal2 {
		    position: absolute;
		    top: 50%;
		    left: 82%;
		    transform: translate(-50%, -50%);
		    background-color: white;
		    padding: 20px;
		    border-radius: 25px;
		    width: 50%; /* 너비 조절 */
		    max-width: 380px; /* 최대 너비 설정 (원하는 값으로 조절) */
		    height: 55%; /* 높이 조절 */
		    max-height: 600px; /* 최대 높이 설정 (원하는 값으로 조절) */
		    /* overflow: auto;  */ /* 내용이 넘칠 경우 스크롤 표시 */
		    
		}
		
		.modal-header{
        	padding-left: 10px;
		
		}
		
		#modal-header-logo{
			width: 160px;
			height: 60px;
			max-width: 100%; /* 이미지의 최대 너비를 조정하여 이미지가 컨테이너 내에 맞게 표시되도록 설정 */
        	max-height: 100%;
		}
		
		/* 닫기 버튼 스타일 */
		.close-button {
		    position: absolute;
		    top: 35px;
		    right: 30px;
		    font-size: 24px;
		    cursor: pointer;
		}
		
		.modal-content{
			background-color: #DCDCDC;
			border-radius: 15px;
			display: flex;
			padding-bottom: 15px;
			margin: 20px 0 20px 0;
			
		}
		
		
		
		#fork-profile{
			background-color: white;
			border-radius: 20px;
			width: 60px;
			height: 60px;
			display: flex;
		    justify-content: center; 
		    align-items: center;
		    margin-left: 5%;
		    margin-top: 5%;
		}
		
		#modal-content-logo{
        	width: 100%; 
		    max-width: 50px; 
		    max-height: 60px; 
        	
		}
		
		#fork-profile-name{
			font-size: 20px;
			margin-top: 8%;
			margin-bottom: 3%;
		}
		
		#question-btn{
			background-color: #FF8B3D;
			border-radius: 15px;
			height: 50px;
			display: flex;
		    justify-content: center; 
		    align-items: center;
		    cursor: pointer;
		}
		
		#question-btn-text{
			font-size: 20px;
			margin-right: 5px;
			font-weight: bold;
			color: white;
		}
		
		.low-btn{
			margin-top:15px;
			display: flex;
		    justify-content: center; 
		    align-items: center;
		}
		
		#home-btn{
			width: 40px;
			height: 40px;
			border: 2px solid gray;
			border-radius: 100%;
			cursor: pointer;
		}
		
		#home-btn:hover{
			border: 2px solid #FF8B3D;
		}
		
		#top-icon-contain{
			margin-top: -5px;
			display: flex;
		    justify-content: center; 
		    align-items: center;
		}
		
		#top-icon1{
			width: 40px;
			height: 10px;
			background-color: rgb(81,81,81);
			border-radius: 10px;
			margin-right: 5px;
		}
		
		#top-icon2{
			width: 10px;
			height: 10px;
			background-color: rgb(81,81,81);
			border-radius: 10px;
		}
		
		/* 채팅방 모달 */
		.modal-content-container{
			padding: 0 15px;
		}
		
		.modal-content-container2{
			padding: 0 15px;
			overflow: auto;
		}
		
		.welcome-text{
			border-radius: 15px;
			font-size: 12px;
			background-color: lightgray;
			padding: 5px 0;
			text-align: center;
		}
		
		.ad-group-first{
			margin-top: 10px;
			display: block;
		}
		
		.ad-group{
			margin-top: 10px;
			/* display: none; */
		}
		
		.ad-group .ad-group-div{
			/* display: block; */
		}
		
		.admin-logo-container, .user-logo-cotainer{
			padding: 7px;
			margin-right: 8px;
			margin-top: 70px;
			border: 1px solid #FF8B3D;
			border-radius: 15px;
			
			display: flex;
		    justify-content: center; 
		    align-items: center;
		}
		
		.display{
			border:1px solid gray; 
			border-radius: 15px; 
			margin-top:10px; 
			height: 87%;
		}
		
		#chat-admin-logo{
			width:40px;
			height: 40px;
		}
		
		/* 챗봇 관리자 말풍선 */
		.chatting-admin-box {
			width: 220px;
			height: auto;
			background-color:#FF8B3D; 
			border-radius: 15px;
			padding: 10px;
		}
		
		.chatting-user-box{
			width: 220px;
			height: auto;
			background-color: rgb(78, 190, 58); 
			border-radius: 15px;
			padding: 10px;
		}
		
		/* 질문버튼모음 */
		.user-btn-group{ 
			margin: 15px 0;
		}
		
		/* 질문버튼 */
		.chatting-user-btn{
			text-align: center;
			border: 1px solid gray;
			border-radius: 10px;
			margin: 10px 0;
			padding: 7px 5px;
			cursor: pointer;
		}
		
		.user-group{
			padding-bottom: 30px;
		}
		
		.chat-name{
			text-align: right; 
			margin-bottom: 3px;
		}
		
		.other-question-btn{
			border-radius: 20px;
			border: 2px solid rgb(78, 190, 58);
			margin: 10px 0 10px 45px;
			padding: 8px 15px;
			cursor: pointer;
			font-weight: bold;
			  
		}
		
		.other-question-btn:hover{
			background-color: rgb(78, 190, 58); 
			color: white;
		}
		
		/* *{
			border: 1px solid blue; 
		}   */
		
		
		
           
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="content">

        <div class="content1-container">
            <div id="content1">
                <div class="slide1"><img src="resources/img/comp-info1.jpg"></div>
                <div class="slide1"><img src="resources/img/comp-info2.jpg"></div> 
            </div>
        </div>
        
        <div class="content2-container">
            <div class="content2-text">
                <span class="content2-text1">Congraturation</span><br>
                <span class="content2-text2">FORK 신기록 달성</span>
            </div>
            <div id="content2">
                <div class="content2-box">
                    <ul>
                        <li id="content2-1">매달 가입자 수</li>
                        <li id="content2-2"><span class="counter1">10</span>만명</li>
                        <li id="content2-3">매월 신규 가입자 수 10만명 돌파!</li>
                    </ul>
    
                </div>
                <div class="content2-box">
                    <ul> 
                        <li id="content2-1">누적 주문건 수</li>
                        <li id="content2-2"><span class="counter2">3500</span>만건</li>
                        <li id="content2-3">총 누적 주문건 수 3500만건 돌파!</li>
                    </ul>
                </div>
                <div class="content2-box">
                    <ul>
                        <li id="content2-1">누적 회원 가입자 수</li>
                        <li id="content2-2"><span class="counter3">30</span>만명</li>
                        <li id="content2-3">누적 회원 가입자 수 30만명 돌파!</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="content4-container">
            <div class="content4-text">
                <span class="content4-text1">Example</span><br>
                <span class="content4-text2">'FORK'를 이용하고 있는<br>가맹점들의 실제 매장입니다</span>
            </div>
            <div id="content4">
                <div class="slide2"><img src="resources/img/img-1.jpg"></div>
                <div class="slide2"><img src="resources/img/img-2.jpg"></div> 
                <div class="slide2"><img src="resources/img/img-3.jpg"></div> 
                <div class="slide2"><img src="resources/img/img-4.jpg"></div> 
                <div class="slide2"><img src="resources/img/img-5.jpg"></div> 
                <div class="slide2"><img src="resources/img/img-6.jpg"></div> 
            </div>
        </div>
		
        <div class="content3-container">
            <div class="rolling-text">
                <span class="rolling-text1">Partners</span><br>
                <span class="rolling-text2">국내 탑 요식업 브랜드는 <br>'FORK'만 사용합니다</span>
                <br>
            </div>
            <div class="content3-1">
                <div class="rolling-list1">
                    <ul>
                        
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_26.9a9e74fd.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_27.a36f263e.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_11.6f6ddb61.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_12.b199d785.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_13.289d4ed0.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_14.a8c3dbb3.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_15.2fd77471.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_16.9177b924.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_17.bdfbe8b7.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_10.1e78fd8b.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_19.216192c4.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_20.ac9586ef.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_21.767db50f.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_22.323333d3.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_23.56f2a87a.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_25.e67de62d.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_18.1f50b8f0.png" alt=""></div>
                        </li>
                        
                        
                    </ul>            
                </div>  
            </div>
    
            <div class="content3-2">
                <div class="rolling-list2">
                    <ul>
                        
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_12.b199d785.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_10.1e78fd8b.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_11.6f6ddb61.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_14.a8c3dbb3.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_27.a36f263e.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_17.bdfbe8b7.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_13.289d4ed0.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_23.56f2a87a.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_25.e67de62d.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_26.9a9e74fd.png" alt=""></div>
                        </li>
                        
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_15.2fd77471.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_16.9177b924.png" alt=""></div>
                        </li>
                        
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_18.1f50b8f0.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_19.216192c4.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_20.ac9586ef.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_21.767db50f.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_22.323333d3.png" alt=""></div>
                        </li>
                        
                        
                        
                    </ul>            
                </div>  
            </div>
    
            <div class="content3-3">
                <div class="rolling-list3">
                    <ul>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_10.1e78fd8b.png" alt=""></div>
                        </li>
                        
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_12.b199d785.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_13.289d4ed0.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_14.a8c3dbb3.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_15.2fd77471.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_16.9177b924.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_17.bdfbe8b7.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_18.1f50b8f0.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_11.6f6ddb61.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_21.767db50f.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_22.323333d3.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_23.56f2a87a.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_25.e67de62d.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_26.9a9e74fd.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_27.a36f263e.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_19.216192c4.png" alt=""></div>
                        </li>
                        <li>
                            <div class="image-wrap"><img src="resources/img/m_rolling_logo_20.ac9586ef.png" alt=""></div>
                        </li>
                        
                    </ul>            
                </div>  
            </div>
            <div class="content3-btn">
                <button type="button" onclick="location.href='${contextPath}/shopInfo'">가맹점 LIST 보기!</button>
            </div>
        </div>
        
        <!-- 페이지 챗봇 버튼 -->
        <div id="chatbot-button" onclick="openModal()"><img src="resources/img/chatbot_btn.png" alt="Chatbot Button"></div>
        
        <!-- 챗봇 메인화면 모달 -->
        <div id="chatbot-modal" class="modal">
	        <div class="chatbot-modal">
	        	<div id="top-icon-contain">
	        		<div id="top-icon1"></div>
	        		<div id="top-icon2"></div>
	        	</div>
		        <div class="display">
		            <div class="modal-header">
			            <span><img src="resources/img/fork-logo.png" id="modal-header-logo"></span>
			            <span class="close-button" onclick="closeModal()">&times;</span>
		            </div>
		            <div class="modal-content-container" style="height: 340px;">
			            <div class="modal-content">
			            	<div id="fork-profile">
			            		<div></div>
				            	<img src="resources/img/fork-logo3.png" id="modal-content-logo">
			            	</div>
			            	<div style="margin-left: 15px;">
				            	<div id="fork-profile-name"><b>FORK</b></div>
				            	<span style="font-size: 13px;">편하게 매장을 관리하며<br><b>매출을 올릴 수 있는 비법!</b></span><br>
				            	<span style="font-size: 13px; vertical-align: -5px;">자동화된 POS와 KIOSK를 제공하는<br></span>
				            	<span style="font-size: 13px;"><b>FORK</b> 입니다.</span>
			            	</div>
			            </div>
		            	<div id="question-btn">
		            		<span id="question-btn-text" onclick="openModal2()">문의하기</span>
		            		<span><img src="resources/img/headset.png"></span>
		            	</div>
			            
		            </div>
		        </div>
		            <div class="low-btn">
		            	<div id="home-btn">
		            </div>
	        	</div>
	    	</div>
    	</div>
    	
    	
    	<!-- ========================================================================================= -->
    	<!-- ========================================================================================= -->
    	<!-- ========================================================================================= -->
    	<!-- ========================================================================================= -->
    	<!-- 채팅방 모달 -->
    	<div id="chatbot-modal2" class="modal">
	        <div class="chatbot-modal">
	        
	        	<div id="top-icon-contain">
	        		<div id="top-icon1"></div>
	        		<div id="top-icon2"></div>
	        	</div>
	        	
		        <div class="display">
		            <div class="modal-header">
			            <span><img src="resources/img/fork-logo.png" id="modal-header-logo"></span>
			            <span class="close-button" onclick="closeModal2()">&times;</span>
		            </div>
		            
		            <div class="modal-content-container2" id="chat-area" style="height: 340px;">
		            	<c:if test="${empty loginUser }">
			            	<div class="welcome-text">환영합니다! 방문자님:)</div>
		            	</c:if>
		            	<c:if test="${!empty loginUser }">
		            	<div class="welcome-text">환영합니다! ${loginUser.memberName } 사장님:)</div>
		            	</c:if>
		            	<div class="ad-group-first">
			            	<p style="margin-bottom: 3px;">FORK</p>
				        	<div class="chatting-admin-box"> 
				        		안녕하세요.아래의 항목 중에서 궁금한 항목을 클릭해주세요😊      	
				        	</div>    
		            	</div>
		            		
		            	<div class="user-btn-group">
		            		<div class="chatting-user-btn" id="ask1" onclick="answer1()">
		            			FORK 사용법 📃
		            		</div>
		            		<div class="chatting-user-btn" id="ask2" onclick="answer2()">
		            			이용권 문의 💰
		            		</div>
		            		<div class="chatting-user-btn" id="ask3" onclick="answer3()">
		            			신규가입 문의 🤞
		            		</div>
		            		<div class="chatting-user-btn" id="ask4" onclick="answer4()">
		            			해지 문의 💧
		            		</div>
		            		<div class="chatting-user-btn" id="ask5" onclick="answer5()">
		            			FORK 비상메뉴얼 📢
		            		</div>
		            	</div>
		            	
		            	
		            </div>
		            
		            
		        </div>
		        
		            <div class="low-btn" id="low-btn">
		            	<div id="home-btn" id="home-btn" onclick="moveHome()">
		            </div>
	        	</div>
	    	</div>
        

    	</div>
    	
    	
    	
    	
    </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    
	<script>
        // 모달 열기 함수
        function openModal() {
            var modal = document.getElementById("chatbot-modal");
            modal.style.display = "block";
        };
        
        function openModal2() {
            var modal = document.getElementById("chatbot-modal");
            modal.style.display = "none";
            var modal2 = document.getElementById("chatbot-modal2");
            modal2.style.display = "block";
        };

        // 모달 닫기 함수
        function closeModal() {
            var modal = document.getElementById("chatbot-modal");
            modal.style.display = "none";
        };

        // 모달 내용 닫기 함수
        function closeModal2() {
            var modalContent = document.getElementById("chatbot-modal2");
            modalContent.style.display = "none";
        };
        
        // 홈버튼
        function moveHome(){
            var modal2 = document.getElementById("chatbot-modal2");
            modal2.style.display = "none";
        	var modal = document.getElementById("chatbot-modal");
            modal.style.display = "block";
        	
        };
		
       

        function answer1() {
        	
		    var chatArea = document.getElementById("chat-area");
		    var newAnswerDiv = document.createElement("div");
		    
		    newAnswerDiv.className = "ad-group";
		    newAnswerDiv.style.display = "block";
		    newAnswerDiv.innerHTML = `
		            <div class="user-group">
		                <div>
		                    <p class="chat-name">
		                        <c:if test="${!empty loginUser }">
		                            ${loginUser.memberName }님
		                        </c:if>
		                        <c:if test="${empty loginUser }">
		                            방문자님
		                        </c:if>
		                    </p>
		                    <div class="chatting-user-box" style="float: right;">
		                    	FORK 사용법이 궁금해요
		                    </div>
		                </div>
		            </div>
		      
		    `;
		    
			var newAnswerDiv2 = document.createElement("div");
		    newAnswerDiv2.className = "ad-group";
		    newAnswerDiv2.style.display = "block";
		    newAnswerDiv2.innerHTML = `
		            <div class="ad-group-div">
		                <p style="margin-bottom: 3px;">FORK</p>
		                <div class="chatting-admin-box">
		                	FORK 사용법은 공지사항에 자세한 안내가 있으니, 공지사항을 참고해 주시길 바랍니다.
		                </div>
		            </div> 
		    `;
		    
		    var newAnswerDiv3 = document.createElement("div");
		    newAnswerDiv3.className = "ad-group";
		    newAnswerDiv3.style.display = "block";
		    newAnswerDiv3.innerHTML = `
		            
		            <div class="ad-group-div">
	                	<p style="margin-bottom: 3px;">FORK</p>
		                <div class="chatting-admin-box">
		                	<span>더 궁금한게 있으시다면?</span>
		                	<button type="button" class="other-question-btn" onclick="scrollToTop()">CLICK ME!</button>
		                </div>
		            </div> 
		            
		    `;
		    
		    chatArea.appendChild(newAnswerDiv);
		    scrollToBottom();
		    
		    setTimeout(function() {
		        chatArea.appendChild(newAnswerDiv2);
		        scrollToBottom();
		    }, 1000);
		    
		    setTimeout(function() {
		        chatArea.appendChild(newAnswerDiv3);
		        scrollToBottom();
		    }, 2000);
		    
		    
		    
		};
		
		function answer2(){
			var chatArea = document.getElementById("chat-area");
 		    var newAnswerDiv = document.createElement("div");
 		    
 		    newAnswerDiv.className = "ad-group";
 		    newAnswerDiv.style.display = "block";
 		    newAnswerDiv.innerHTML = `
 		            <div class="user-group">
 		                <div>
 		                    <p class="chat-name">
 		                        <c:if test="${!empty loginUser }">
 		                            ${loginUser.memberName }님
 		                        </c:if>
 		                        <c:if test="${empty loginUser }">
 		                            방문자님
 		                        </c:if>
 		                    </p>
 		                    <div class="chatting-user-box" style="float: right;">
 		                   		이용권은 얼마인가요??
 		                    </div>
 		                </div>
 		            </div>
 		         
 		            
 		    `;
 		    
 		    var newAnswerDiv2 = document.createElement("div");
		    newAnswerDiv2.className = "ad-group";
		    newAnswerDiv2.style.display = "block";
		    newAnswerDiv2.innerHTML = `
			    	<div class="ad-group-div">
		                <p style="margin-bottom: 3px;">FORK</p>
		                <div class="chatting-admin-box">
		               		[연간이용권]<br>2년 90만원 / 1년 55만원<br><br>[월간이용권]<br>6개월 30만원<br>3개월 15만원 입니다.
		                </div>
		            </div>  
		    `;
		    
		    var newAnswerDiv3 = document.createElement("div");
		    newAnswerDiv3.className = "ad-group";
		    newAnswerDiv3.style.display = "block";
		    newAnswerDiv3.innerHTML = `
		            <div class="ad-group-div">
	                	<p style="margin-bottom: 3px;">FORK</p>
		                <div class="chatting-admin-box">
		                	<span>더 궁금한게 있으시다면?</span>
		                	<button type="button" class="other-question-btn" onclick="scrollToTop()">CLICK ME!</button>
		                </div>
		            </div> 
		            
		    `;
		    
		    chatArea.appendChild(newAnswerDiv);
		    scrollToBottom();
		    
		    setTimeout(function() {
		        chatArea.appendChild(newAnswerDiv2);
		        scrollToBottom();
		    }, 1000);
		    
		    setTimeout(function() {
		        chatArea.appendChild(newAnswerDiv3);
		        scrollToBottom();
		    }, 2000);
			
		}
		
		function answer3(){
			var chatArea = document.getElementById("chat-area");
 		    var newAnswerDiv = document.createElement("div");
 		    
 		    newAnswerDiv.className = "ad-group";
 		    newAnswerDiv.style.display = "block";
 		    newAnswerDiv.innerHTML = `
 		            <div class="user-group">
 		                <div>
 		                    <p class="chat-name">
 		                        <c:if test="${!empty loginUser }">
 		                            ${loginUser.memberName }님
 		                        </c:if>
 		                        <c:if test="${empty loginUser }">
 		                            방문자님
 		                        </c:if>
 		                    </p>
 		                    <div class="chatting-user-box" style="float: right;">
 		                   		신규 가입을 하고 싶어요
 		                    </div>
 		                </div>
 		            </div>
 		    `;
 		    
 		    var newAnswerDiv2 = document.createElement("div");
		    newAnswerDiv2.className = "ad-group";
		    newAnswerDiv2.style.display = "block";
		    newAnswerDiv2.innerHTML = `
			    	<div class="ad-group-div">
		                <p style="margin-bottom: 3px;">FORK</p>
		                <div class="chatting-admin-box">
		               		홈페이지 왼쪽 상단에 회원가입을 통해 가입하실 수 있습니다.<br>가입 승인과 이용권 결제가 완료되면 이용 가능합니다.
		                </div>
		            </div>   
		    `;
		    
		    var newAnswerDiv3 = document.createElement("div");
		    newAnswerDiv3.className = "ad-group";
		    newAnswerDiv3.style.display = "block";
		    newAnswerDiv3.innerHTML = `
		            <div class="ad-group-div">
	                	<p style="margin-bottom: 3px;">FORK</p>
		                <div class="chatting-admin-box">
		                	<span>더 궁금한게 있으시다면?</span>
		                	<button type="button" class="other-question-btn" onclick="scrollToTop()">CLICK ME!</button>
		                </div>
		            </div> 
		            
		    `;
		    
		    chatArea.appendChild(newAnswerDiv);
		    scrollToBottom();
		    
		    setTimeout(function() {
		        chatArea.appendChild(newAnswerDiv2);
		        scrollToBottom();
		    }, 1000);
		    
		    setTimeout(function() {
		        chatArea.appendChild(newAnswerDiv3);
		        scrollToBottom();
		    }, 2000);
			
		}
		
		function answer4(){
			var chatArea = document.getElementById("chat-area");
 		    var newAnswerDiv = document.createElement("div");
 		    
 		    newAnswerDiv.className = "ad-group";
 		    newAnswerDiv.style.display = "block";
 		    newAnswerDiv.innerHTML = `
 		            <div class="user-group">
 		                <div>
 		                    <p class="chat-name">
 		                        <c:if test="${!empty loginUser }">
 		                            ${loginUser.memberName }님
 		                        </c:if>
 		                        <c:if test="${empty loginUser }">
 		                            방문자님
 		                        </c:if>
 		                    </p>
 		                    <div class="chatting-user-box" style="float: right;">
 		                   		이용권을 해지하고 싶어요
 		                    </div>
 		                </div>
 		            </div>
 		    `;
 		    
 		   var newAnswerDiv2 = document.createElement("div");
		    newAnswerDiv2.className = "ad-group";
		    newAnswerDiv2.style.display = "block";
		    newAnswerDiv2.innerHTML = `
		            <div class="ad-group-div">
		                <p style="margin-bottom: 3px;">FORK</p>
		                <div class="chatting-admin-box">
		               		이용권 해지는 Q&A 게시판 또는 고객센터 1207-0718로 연락 주시면<br>남은 일수를 계산하여 환불해드립니다.
		                </div>
		            </div> 
		    `;
		    
		    var newAnswerDiv3 = document.createElement("div");
		    newAnswerDiv3.className = "ad-group";
		    newAnswerDiv3.style.display = "block";
		    newAnswerDiv3.innerHTML = `
		            <div class="ad-group-div">
	                	<p style="margin-bottom: 3px;">FORK</p>
		                <div class="chatting-admin-box">
		                	<span>더 궁금한게 있으시다면?</span>
		                	<button type="button" class="other-question-btn" onclick="scrollToTop()">CLICK ME!</button>
		                </div>
		            </div> 
		            
		    `;
		    
		    chatArea.appendChild(newAnswerDiv);
		    scrollToBottom();
		    
		    setTimeout(function() {
		        chatArea.appendChild(newAnswerDiv2);
		        scrollToBottom();
		    }, 1000);
		    
		    setTimeout(function() {
		        chatArea.appendChild(newAnswerDiv3);
		        scrollToBottom();
		    }, 2000);
			
		}
		
		function answer5(){
			var chatArea = document.getElementById("chat-area");
 		    var newAnswerDiv = document.createElement("div");
 		    
 		    newAnswerDiv.className = "ad-group";
 		    newAnswerDiv.style.display = "block";
 		    newAnswerDiv.innerHTML = `
 		            <div class="user-group">
 		                <div>
 		                    <p class="chat-name">
 		                        <c:if test="${!empty loginUser }">
 		                            ${loginUser.memberName }님
 		                        </c:if>
 		                        <c:if test="${empty loginUser }">
 		                            방문자님
 		                        </c:if>
 		                    </p>
 		                    <div class="chatting-user-box" style="float: right;">
 		                   		갑자기 프로그램이 작동하지 않아요
 		                    </div>
 		                </div>
 		            </div>
 		    `;
 		    
 		   var newAnswerDiv2 = document.createElement("div");
		    newAnswerDiv2.className = "ad-group";
		    newAnswerDiv2.style.display = "block";
		    newAnswerDiv2.innerHTML = `
		            <div class="ad-group-div">
		                <p style="margin-bottom: 3px;">FORK</p>
		                <div class="chatting-admin-box">
		               		FORK 비상 메뉴얼이 공지사항에 첨부파일로 등록되어 있으니 참고하여 주시고 
		               		더 궁금하신 부분이 있으시면 고객센터 1207-0718로 문의해주시기 바랍니다.
		                </div>
		            </div>  
		    `;
		    
		    var newAnswerDiv3 = document.createElement("div");
		    newAnswerDiv3.className = "ad-group";
		    newAnswerDiv3.style.display = "block";
		    newAnswerDiv3.innerHTML = `
		            <div class="ad-group-div">
	                	<p style="margin-bottom: 3px;">FORK</p>
		                <div class="chatting-admin-box">
		                	<span>더 궁금한게 있으시다면?</span>
		                	<button type="button" class="other-question-btn" onclick="scrollToTop()">CLICK ME!</button>
		                </div>
		            </div> 
		            
		    `;
		    
		    chatArea.appendChild(newAnswerDiv);
		    scrollToBottom();
		    
		    setTimeout(function() {
		        chatArea.appendChild(newAnswerDiv2);
		        scrollToBottom();
		    }, 1000);
		    
		    setTimeout(function() {
		        chatArea.appendChild(newAnswerDiv3);
		        scrollToBottom();
		    }, 2000);
			
		};
		
		function scrollToTop() {
		    var chatArea = document.getElementById("chat-area");
		    chatArea.scrollTop = 100;
		}
		

        function scrollToBottom() {
            var chatArea = document.getElementById("chat-area");
            chatArea.scrollTop = chatArea.scrollHeight;
        };
    </script>
    
    
    

    <!-- 첫번째 슬라이드 -->
    <script>
        $(document).ready(function(){
            $('#content1').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 1000,
                dots: false,
                arrows: false,
                centerPadding: '115px'
            });
        });
    </script>

    <!-- 롤링배너 -->
    <script>
        // 앞의 배너
        let roller = document.querySelector('.rolling-list1');
        roller.id = 'roller1'; 
        // 뒤에 붙는 클론배너
        let clone = roller.cloneNode(true)
        clone.id = 'roller2';
        document.querySelector('.content3-1').appendChild(clone);   

        document.querySelector('#roller1').style.left = '0px';
        document.querySelector('#roller2').style.left = '0px';
        
        
        roller.classList.add('original');
        clone.classList.add('clone');      
    </script>
    <script>
        let roller2 = document.querySelector('.rolling-list2');
        roller2.id = 'roller3'; 
        
        let clone2 = roller2.cloneNode(true)
        clone2.id = 'roller4';
        document.querySelector('.content3-2').appendChild(clone2);   

        document.querySelector('#roller3').style.left = '0px';
        document.querySelector('#roller4').style.left = '0px';
        
        roller2.classList.add('original2');
        clone2.classList.add('clone2');
    </script>
    <script>
        let roller3 = document.querySelector('.rolling-list3');
        roller3.id = 'roller5'; 
        
        let clone3 = roller3.cloneNode(true)
        clone3.id = 'roller6';
        document.querySelector('.content3-3').appendChild(clone3);   

        document.querySelector('#roller5').style.left = '0px';
        document.querySelector('#roller6').style.left = '0px';
        
        roller3.classList.add('original3');
        clone3.classList.add('clone3');     
    </script>

    <!-- 숫자 카운트 js -->
    <script>
        $('.counter1').waypoint(function() {
            $('.counter1').counterUp({
                delay: 20,
                enableScrollSpy: true,
                time: 1000
            });
        }, { offset: '50%' });  
        $('.counter1').waypoint(function() {
            $('.counter2').counterUp({
            delay: 50,
            enableScrollSpy: true,
            time: 2000
            });
        }, { offset: '50%' }); 

        $('.counter1').waypoint(function() {
            $('.counter3').counterUp({
            delay: 20,
            enableScrollSpy: true,
            time: 1000
            });
        }, { offset: '50%' });    
    </script>

    
    
    <!-- 매장 사진들 슬라이드 -->
    <script>
        $(document).ready(function(){
            $('#content4').slick({
                autoplay: true,
                autoplaySpeed: 1000,
                centerMode: true,
                slidesToShow: 4,
                slidesToScroll: 1,
                dots: false,
                arrows: false,
                infinite: true
                
            });
        });
    </script>
 
    
</body>
</html>