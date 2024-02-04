<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        }

        #footer ul {
            margin: 0;
            padding: 0;
        }

        #footer{
            display: flex;
            width: 100%;
            font-size: 12px;
            
        }

        #footer1{
            line-height: 2;
            margin-left: 15px;
            
        }

        #footer2{
            text-align: right;
            flex: 1;
            margin-right: 15px;
            line-height: 2;
        }

    </style>
</head>
<body>
	<hr style="width: 98.5%">
	<div id="footer">
        <div id="footer1">
            <ul>
                <li>서울 강남구 역삼동 823-24 2층 (주)천지창조</li>
                <li>사업자등록번호: 119-82-50686  | 통신판매업신고번호: 2021-서울강남-01750</li>
                <li>Copyright © 2023 FORK. All rights reserved.</li>
            </ul>
        </div>
        <div id="footer2">
            <ul>
                <li>고객센터: 1207-0718</li>
                <li>365일 연중무휴 (10:00 ~ 23:00)</li>
                <li>이메일: help-fork@gmail.com</li>
            </ul>
        </div>
    </div>
</body>
</html>