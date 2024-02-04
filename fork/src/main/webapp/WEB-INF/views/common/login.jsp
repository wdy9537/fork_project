<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' rel='stylesheet'>
    <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
    <script type='text/javascript'src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Poppins&display=swap');
        
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
		
        a {
            text-decoration: none;
            color: #FF8B3D;
        }

        a:hover {
            text-decoration: none;
            color: #FF8B3D
        }
        

        * {
            padding: 0;
            margin: 0;
        }

        body {
            background-color: #eee;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .content{
        	padding-top: 200px;
        	min-height: 92vh;
        	position: relative;
        }

        .wrapper {
            border-radius: 10px; 
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 30px 40px;
            border: 3px solid #FF8B3D;
        }
  

        .input-field {
            border-radius: 5px;
            padding: 5px;
            display: flex;
            align-items: center;
            cursor: pointer;
            border: 1px solid #FF8B3D;
            color: #FF8B3D
        }

        .input-field:hover {
            color: #FF8B3D;
            border: 1px solid #FF8B3D
        }

        input {
            border: none;
            outline: none;
            box-shadow: none;
            width: 100%;
            padding: 0px 2px;
        }

        .fa-eye-slash.btn {
            border: none;
            outline: none;
            box-shadow: none
        }

        .option {
            position: relative;
            padding-left: 30px;
            cursor: pointer
        }

        .option label.text-muted {
            display: block;
            cursor: pointer
        }

        .option input {
            display: none
        }

        .checkmark {
            position: absolute;
            top: 3px;
            left: 0;
            height: 20px;
            width: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 50%;
            cursor: pointer
        }

        .option input:checked~.checkmark:after {
            display: block
        }

        .option .checkmark:after {
            content: "";
            width: 13px;
            height: 13px;
            display: block;
            background: #FF8B3D;
            position: absolute;
            top: 48%;
            left: 53%;
            border-radius: 50%;
            transform: translate(-50%, -50%) scale(0);
            transition: 300ms ease-in-out 0s
        }

        .option input[type="radio"]:checked~.checkmark {
            background: #fff;
            transition: 300ms ease-in-out 0s;
            border: 1px solid #FF8B3D;
        }

        .option input[type="radio"]:checked~.checkmark:after {
            transform: translate(-50%, -50%) scale(1)
        }

        .btn.btn-block {
            border-radius: 20px;
            background-color: #FF8B3D;
            color: #fff
        }

        .btn.btn-block:hover {
            background-color: #FF8B3D;
        }   

        .text-center > img {
            width: 250px;
        }

        #forgot {
            display: inline-block;
            text-align: center;
            margin-bottom: 0;
            margin-right: 30px;
            margin-left: 30px;
        }

        .forgot-links {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap; 
            margin-bottom: 10px;
        }
    </style>
    
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="content">
    <div class="wrapper bg-white">
        <div class="h2 text-center"><img src="resources/img/fork-logo2.png"></div>
        <form class="pt-3" action="${contextPath }/login.me" method="post" >
            <div class="form-group py-2">
                <div class="input-field">
                    <span class="far fa-user p-2"></span>
                    <input type="text" placeholder="아이디를 입력하세요" name="memberId" required>
                </div>
            </div>
            <div class="form-group py-1 pb-2">
                <div class="input-field">
                    <span class="fas fa-lock p-2"></span>
                    <input type="password" placeholder="비밀번호를 입력하세요" name="memberPwd" required>
                </div>
            </div>
            <div class="d-flex align-items-start forgot-links">
                <a href="#" id="forgot">아이디 찾기</a>
                |
                <a href="#" id="forgot">비밀번호 찾기</a>
            </div>
            <button type="submit" class="btn btn-block text-center my-3">로그인</button>
            
        </form>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>