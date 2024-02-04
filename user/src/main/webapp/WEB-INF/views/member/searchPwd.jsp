<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>비밀번호 찾기</title>
<script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/member/searchPwd.css">
</head>
<body class='snippet-body'>

	<c:if test="${not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg"/>
	</c:if>
	
    <div class="wrapper bg-white">
	    <div class="h2 text-center">
	        <h2>비밀번호 찾기</h2>
	    </div>
	    <hr>
	    <form class="pt-3" action="${contextPath}/member/selectPwd" method="post">
	        <table>
	            <tbody>
	                <tr>
	                    <th>
	                        <h3>아이디</h3>
	                    </th>
	                </tr>
	                <tr>
	                    <td><input type="text" class="userId" name="memberId" placeholder=" 아이디를 입력해주세요"></td>
	                </tr>
	                <tr>
	                    <th>
	                        <h3>이메일</h3>
	                    </th>
	                </tr>
	                <tr>
	                    <td><input type="text" class="email" name="email" placeholder=" 이메일을 입력해주세요"></td>
	                </tr>
	            </tbody>
	        </table>
	        <div class="nextpage">
	            <button type="submit">인증번호 보내기</button>
	        </div>
	    </form>
	</div>
	

</body>

</html>