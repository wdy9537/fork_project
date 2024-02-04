<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>회원가입 입력</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/member/enrollPage1.css">
</head>
<body class='snippet-body'>

	<c:if test="${not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg"/>
	</c:if>

    <div class="wrapper bg-white">
        <div class="h2 text-center"><h2>회원가입</h2></div>
        <form class="pt-3" id="enroll-form" action="${contextPath }/member/enroll" method="POST" enctype="multipart/form-data">
            <table>
                <tbody>
                    <tr>
                        <th>아이디</th>
                        <td><input type="text" name="memberId" class="userId" style="width: 220px;" placeholder="아이디를 입력하세요" required></td>
                        <td><input type="button" value="중복확인" class="idCheckButton" onClick="idcheck();"></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td colspan="2">
                        	<input type="password" id="memberPwd" name="memberPwd" class="userPwd" placeholder="비밀번호를 입력하세요" required><br>
                        	<label class="explain">* 영문자, 숫자, 특수문자로 총 8~15자로 입력하시오.</label>
                        </td> 
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td colspan="2">
                        	<input type="password" id="checkPwd" name="checkPwd" class="checkPwd" placeholder="비밀번호를 다시 입력하세요" required>
                        	<label class="explain2"></label>
                        </td>
                    </tr>
                    <tr>
                        <th>사업자명</th>
                        <td colspan="2"><input type="text" name="memberName" class="businessName" placeholder="사업자명을 입력하세요" required></td>
                    </tr>
                    <tr>
                        <th>사업자등록증 번호</th>
                        <td colspan="2"><input type="text" name="fileNo" class="businessNo" placeholder="사업자등록증 번호를 입력하세요" required></td>
                    </tr>
                    <tr>
                        <th>사업자등록증</th>
						<td colspan="2">
						    <div style="display:flex;">
						    	<label class="filelabel" for="businessFile" style="display:inline-block">파일등록</label>
						    	<div class="explain3"></div>
						    </div>
						    <input type="file" name="file" class="businessFile" id="businessFile" style="display:none;" required onchange="updateFileName(this)">
						</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td colspan="2"><input type="button" value="주소찾기" id="searchAddress" style="margin-left: 0px;"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="2"><input type="text" name="addressOne" id="addressOne" placeholder="주소를 입력하세요"></td>
                    </tr>
                    <tr>
                        <th>상세주소</th>
                        <td colspan="2"><input type="text" id="addressDetail" name="addressDetail" placeholder="상세주소를 입력하세요"></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td colspan="2"><input type="text" name="phone" class="phone" placeholder="전화번호를 입력하세요" required></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="2"><input type="text" name="email" class="email" placeholder="이메일을 입력하세요" required></td>
                    </tr>
                </tbody>
            </table>
            <div class="nextpage">
                <button type="submit">회원가입</button>
            </div>
        </form>
    </div>

    <!-- 중복확인 모달 -->
    <div id="idCheckModal" class="modal" style="display: none;">
        <div class="modal-content">
        	<button class="checkbutton" onclick="closeModal()">확인</button>
        </div>
    </div> 

    <script>
    	// 파일 이름 뜨기
    	function updateFileName(input) {
	        const fileNameLabel = document.querySelector('.explain3');
	        const fileName = input.value.split('\\').pop(); // 파일 경로에서 파일 이름 추출
	        fileNameLabel.textContent = fileName;
	    }

    
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
    
    	// 모달창 기능
        const idCheckButton = document.querySelector('.idCheckButton');
        const idCheckModal = document.getElementById('idCheckModal');

        function openModal() {
            idCheckModal.style.display = 'block';
        }

        function closeModal() {
            idCheckModal.style.display = 'none';
        }

        idCheckButton.addEventListener('click', openModal);

        window.addEventListener('click', (event) => {
            if (event.target === idCheckModal) {
                closeModal();
            }
        }); 
        
        function idcheck() {
        	
        	const memberId = $("#enroll-form input[name=memberId]");
        	
        	if(memberId.val() == "") {
        		const html = '아이디를 입력해주세요. <button class="checkbutton" onclick="closeModal()">확인</button>'        				
    			$(".modal-content").html(html);
        		memberId.focus();
        	} else {
	        	$.ajax({
	        		url : "${contextPath}/member/idcheck",
	        		data : {memberId : memberId.val()},
	        		method : "post",
	        		success : function(result) {
	        			if(result != 0) {
							const html = '이미 사용중인 아이디입니다. <button class="checkbutton" onclick="closeModal()">확인</button>'        				
	        				$(".modal-content").html(html);
	        				memberId.val("");
	        				memberId.focus();
	        			} else {
	        				const html = '사용 가능한 아이디입니다. <button class="checkbutton" onclick="closeModal()">확인</button>'
	        				$(".modal-content").html(html);
	        			}
	        		}
	        	});
        	}
        	
        	
        };
    </script>

    <!-- 주소 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        window.onload = function(){
            document.getElementById("searchAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면 카카오 지도 발생
                new daum.Postcode({
                    oncomplete: function(data) { //선택시 입력값 세팅
                        document.getElementById("addressOne").value = data.address; // 주소 넣기
                        document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
                    }
                }).open();
            });
        }
        </script>
</body>

</html>