<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
<link rel="stylesheet" href="../resources/css/member/searchId.css">
</head>
<body class='snippet-body'>

	<c:if test="${not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg"/>
	</c:if>
	
    <div class="wrapper bg-white">
        <div class="h2 text-center"><h2>아이디 찾기</h2></div>
        <hr>
        <form class="pt-3">
            <table>
                <tbody>
                    <tr>
                        <th><h3>사업자명</h3></th>
                    </tr>
                    <tr>
                        <td><input type="text" class="memberName" name="memberName" placeholder="사업자명을 입력해주세요"></td>
                    </tr>
                    <tr>
                        <th><h3>전화번호</h3></th>
                    </tr>
                    <tr>
                        <td><input type="text" class="phone" name="phone" placeholder="전화번호를 입력해주세요"></td>
                    </tr>
                </tbody>
            </table>
           <div class="nextpage">
               <button id="openModalButton" type="button">아이디 찾기</button>
           </div>
        </form>
    </div>
    
	 <!-- 모달 배경과 내용 -->
    <div class="modal-background" id="modalBackground">
        <div class="modal">
            <div class="modal-content"></div>
            <button class="modal-button" id="closeModalButton">확인</button>
        </div>
    </div>

    <script>
        // 모달 열기 버튼 클릭 이벤트
        document.getElementById('openModalButton').addEventListener('click', function() {
		    document.getElementById('modalBackground').style.display = 'flex';
		    
		    var memberName = document.querySelector('.memberName').value;
		    var phone = document.querySelector('.phone').value;
		    
		    $.ajax({
		        url: "${contextPath}/member/searchId",
		        method: "post",
		        data: {
		            memberName: memberName,
		            phone: phone
		        },
		        success: function(response) {
		        	if(response.memberName != undefined) {
			            var html = response.memberName + "님의 아이디는 " + response.memberId + "입니다.";
			            $(".modal-content").html(html);
			            
			            // '확인' 버튼 클릭 이벤트
	                    document.getElementById('closeModalButton').addEventListener('click', function() {
	                        location.href="${contextPath}/login.jsp";
	                    });
			            
		        	} else {
		        		var html1 = "사업자명 또는 전화번호를 잘못입력하셨습니다. <br> 다시 입력해주세요";
			            $(".modal-content").html(html1);
			            
			            document.getElementById('closeModalButton').addEventListener('click', function() {
			            	document.querySelector('.memberName').value = ""; // 입력 필드 비우기
	                        document.querySelector('.phone').value = ""; 
	                    });
		        	}
		        }
		    });
		});

        // 모달 닫기 버튼 클릭 이벤트
        document.getElementById('closeModalButton').addEventListener('click', function() {
            document.getElementById('modalBackground').style.display = 'none';
        });
    </script>
    
</body>

</html>