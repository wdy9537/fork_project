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
<link rel="stylesheet" href="../resources/css/member/changePwd.css">
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
	        <h2>비밀번호 변경</h2>
	    </div>
	    <hr>
	    <form class="pt-3" action="${contextPath}/member/changePwd" method="post">
	        <table>
	            <tbody>
	                <tr>
	                    <th>
	                        <h3>변경할 비밀번호</h3>
	                    </th>
	                </tr>
	                <tr>
	                    <td>
	                    	<input type="password" class="memberPwd" id="memberPwd" name="memberPwd" placeholder="변경할 비밀번호를 입력해주세요">
	                    	<label class="explain">* 영문자, 숫자, 특수문자로 총 8~15자로 입력하시오.</label>
	                    </td>
	                    
	                </tr>
	                <tr>
	                    <th>
	                        <h3>비밀번호 확인</h3>
	                    </th>
	                </tr>
	                <tr>
	                    <td>
	                    	<input type="password" class="checkPwd" id="checkPwd" name="checkPwd" placeholder="비밀번호를 다시 입력해주세요">
	                    	<label class="explain2"></label>
	                    </td>
	                    <td><input type="hidden" class="memberId" name="memberId" value="${m.getMemberId()}"></td>
	                </tr>
	            </tbody>
	        </table>
	        <div class="nextpage">
	            <button type="submit">비밀번호 바꾸기</button>
	        </div>
	    </form>
	</div>
	
	<script>
		// 비밀번호 정규표현식
		const memberPwd = document.getElementById("memberPwd");
		const checkPwd = document.getElementById("checkPwd");
		const label = document.querySelector(".explain");
		const label2 = document.querySelector(".explain2");
		
		memberPwd.addEventListener("keyup", pwdCheck1);
		checkPwd.addEventListener("keyup", pwdCheck2);
		
		const checkedPwd1 = /^[a-z\d\`\~!@#\$\%\^\&\*\(\)-\_\=\+]{8,15}$/i;
		
		function pwdCheck1(){
			
			const passwordValue = memberPwd.value;
			
			if (!checkedPwd1.test(passwordValue)) {
		        label.textContent = "양식에 맞게 작성하세요";
		        label.style.color = "red";
		    } else {
		        label.textContent = "사용가능한 비밀번호입니다.";
		        label.style.color = "green";
		    }
			
			// 비밀번호가 공백인 경우
		    if (passwordValue.trim() === "") {
		        label.textContent = "* 영문자, 숫자, 특수문자로 총 8~15자로 입력하시오.";
		        label.style.color = "black";
		    }
		}
		
		function pwdCheck2() {
			
		    const passwordValue = memberPwd.value;
		    const confirmPasswordValue = checkPwd.value;
		    
	
		    if (passwordValue !== confirmPasswordValue) {
	    	    label2.style.display = "block";
		        label2.textContent = "비밀번호가 일치하지 않습니다.";
		        label2.style.color = "red";
		    } else {
	    	    label2.style.display = "block";
		        label2.textContent = "비밀번호가 일치합니다.";
		        label2.style.color = "green";
		    }
		    
		 	// 비밀번호가 공백인 경우
		    if (confirmPasswordValue.trim() === "") {
		        label2.textContent = "";
		    }
		}
	</script>

</body>
</html>