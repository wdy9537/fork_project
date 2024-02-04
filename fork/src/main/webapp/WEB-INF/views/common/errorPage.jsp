<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.content{
	    width: 100%;  
	    padding-top: 100px;
	    padding-bottom: 50px;
	    min-height: 92vh;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<br>
	<div class="content" align="center">
		<img src="https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678069-sign-error-64.png">
		<br><br><br><br><br><br>     
		<h1 style="font-weight:bold;">${errorMsg}</h1>
	</div>
	<br>
	<jsp:include page="footer.jsp"/>



</body>
</html>