<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- alertify css -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>

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
            list-style: none;
        }

        body{
            margin: 0;
            padding: 0;
            height: 8vh;
        }

        #headerr{
            position: fixed;
            width: 100%;
            background-color: rgb(255, 255, 255, 0.7);
            z-index: 100;
            
        }

        #navi{
            display: flex;
            align-items: center; 
            justify-content: space-between;          
        }

        #navi-list>ul{
            display: flex;
            justify-content: center;
            
        }

        #navi-list>ul>li{
            margin-right: 80px;
            
        }

        #navi-login{
            margin-right: 50px;
        }


        #navi-login>ul{
            display: flex;
            justify-content: flex-end;
        }

        #main-logo {
            width: 180px;
            height: 60px;
            padding: 0 0 0 20px;
        }

        .navi-item, .navi-item a {
            display: flex;
            font-size: 21px;
            font-style: none;
            color: #FF8B3D;
            font-weight: bold;
            line-height: 3;
            cursor: pointer;
            text-decoration: none;
        }


        #login-btn, #login-welcome-text{
            font-size: 15px;
            color: black;
            padding-right: 20px;
            margin-top: 30px;
            
        }
        
        #logout-btn {
        	font-size: 15px;
            color: black;
            padding-right: 20px;
            margin-top: 30px;
        }

        #enroll-btn{
            font-size: 15px;
            color: black;
            margin-top: 30px;
        }

        #login-btn-text, #enroll-btn-text{
            cursor: pointer;
            text-decoration: none;
            color: black;
        }
        
        #logout-btn-text{
        	cursor: pointer;
            text-decoration: none;
            color: black;
            line-height: 1.6em;
        }

		

    </style>
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert(" ",'${alertMsg}');
		</script>
		<c:remove var="alertMsg"/>
	</c:if>
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.comfirm(" ",'${comfirmMsg}');
		</script>
		<c:remove var="alertMsg"/>
	</c:if>
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.error(" ",'${arrorMsg}');
		</script>
		<c:remove var="errorMsg"/>
	</c:if>
	
	<div id="headerr" class="fixed-top">
        <div id="navi">
            <a href="${contextPath}/"><img src="${contextPath}/resources/img/fork-logo.png" id="main-logo"></a>
            <div id="navi-list">
            	<c:if test="${loginUser.memberId != 'admin' }">
	                <ul>
	                    <li class="navi-item"><a href="${contextPath}/companyInfo">기업소개</a></li>
	                    <li class="navi-item"><a href="${contextPath}/contectUs">CONTECT US</a></li>
	                    <li class="navi-item"><a href="${contextPath}/shopInfo">가맹점 정보</a></li>
	                    <li class="navi-item"><a href="${contextPath}/noticeList">공지사항</a></li>
	                    <li class="navi-item"><a href="${contextPath}/qnaList">Q&A</a></li>            
	                </ul>
            	
            	</c:if>
            	<c:if test="${loginUser.memberId == 'admin' }">
           			<ul>
	                    <li class="navi-item"><a href="${contextPath}/singupList">가입승인</a></li>
	                    <li class="navi-item"><a href="${contextPath}/shopList">가맹점 관리</a></li>
	                    <li class="navi-item"><a href="${contextPath}/noticeList">공지사항 관리</a></li>
	                    <li class="navi-item"><a href="${contextPath}/qnaList">Q&A 관리</a></li>     
	                </ul>
            	
            	</c:if>
            		
            	
            
            </div>
            <div id="navi-login">
            	<c:choose>
            		<c:when test="${ empty loginUser }">
		                <ul>
		                    <li id="login-btn"><a id="login-btn-text" href="${contextPath}/login">로그인</a></li>
		                    <li id="enroll-btn"><a id="enroll-btn-text" href="http://localhost:8082/user/login.jsp">회원가입</a></li>
		                </ul>
            		</c:when>
            		<c:otherwise>
            			<ul>
		            		<li id="login-welcome-text">${loginUser.memberName }님 환영합니다.</li>
		            		<li id="logout-btn"><a id="logout-btn-text" href="${contextPath}/logout.me" >로그아웃</a></li>
			                
            			</ul>
            		</c:otherwise>
            	</c:choose>
            	
            </div>

        </div>
    </div>
</body>
</html>