<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>로그인</title>
<link rel="stylesheet" href="resources/css/login.css">
<link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' rel='stylesheet'>
<!-- alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- alertify css -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
   <style>
    a {
        text-decoration: none;
        color: #FF8B3D;
        font-weight: 700
    }

    a:hover {
        text-decoration: none;
        color: #FF8B3D
    }
</style>
<script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
</head>
<body oncontextmenu='return false' class='snippet-body'>

	<c:if test="${not empty alertMsg }">
		<script>
			alertify.alert(" ", '${alertMsg}');
		</script>
		<c:remove var="alertMsg"/>
	</c:if>
	
    <div class="wrapper bg-white">
        <div class="h2 text-center"><img src="resources/img/로고누끼.png"></div>
        <form class="pt-3" action="${contextPath }/member/login" method="post">
            <div class="form-group py-2">
                <div class="input-field">
                    <span class="far fa-user p-2"></span>
                    <input type="text" name="memberId" placeholder="아이디를 입력하세요" required>
                </div>
            </div>
            <div class="form-group py-1 pb-2">
                <div class="input-field">
                    <span class="fas fa-lock p-2"></span>
                    <input type="password" name="memberPwd" placeholder="비밀번호를 입력하세요" required>
                </div>
            </div>
            <div class="d-flex align-items-start forgot-links">
                <a href="${contextPath }/member/searchId" id="forgot">아이디 찾기</a>
                |
                <a href="${contextPath }/member/searchPwd" id="forgot">비밀번호 찾기</a>
            </div>
            <button type="submit" class="btn btn-block text-center my-3">로그인</button>
            <div class="text-center pt-3 text-muted" id="pt3">
                <a href="${contextPath }/member/enrollForm1">회원가입</a>
            </div>
        </form>
    </div>
    
    <script type='text/javascript'></script>
</body>

</html>