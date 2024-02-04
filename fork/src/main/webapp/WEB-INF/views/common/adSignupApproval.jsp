<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입승인 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	}}

    li{
        list-style-type: none;
    }

    body{
        margin: 0;
        padding: 0; 
    }

    .content{
        width: 100%;
        min-height: 92vh;
        padding-top: 100px;
        padding-bottom: 50px;
    }

    #container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100%;
        margin: 50px 0;
    }
    
    /* 가입승인 타이틀 */
    #notice_title1{
        font-size: 30px;
        font-weight: bold;
    }



    /* 가입승인 리스트 */
    table {
            border-collapse: collapse;
            float: left;
            margin: 0 0 2em;
            width: 1200px;
            
    }

    thead {
            border-bottom: 2px solid #FF8B3D;
            font-size: 13px;
            font-weight: 700;
            background-color: rgb(255, 139, 61, 0.5);
    }

    th {
        padding: 0.35em 0 .35em;
        font-weight: 400;
        font-size: 1.3em;
    }
                
            

    tbody {
        border-bottom: 2px solid #FF8B3D;
        cursor: pointer;
    }

    tr {
        border-bottom: 1px solid lightgray;
        height: 50px;
        text-align: center;
    }
    
    .ok_btn{
        background-color: #FF8B3D;
        color: #ddd;
        border: 1px solid #FF8B3D;
        border-radius: 10%;
        cursor: pointer;

    }

    .delete_btn{
        background-color: #6a6a6a;
        color: #ddd;
        border: 1px solid #6a6a6a;
        border-radius: 10%;
        cursor: pointer;
    }

    
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="content">   
    <div id="container">
        <div id="notice_title1">가입승인 대기</div>
        <br><br>
        <table>
            <thead>
                <tr>
                    <th>회원번호</th>
                    <th>사업자명</th>
                    <th>매장 전화번호</th>
                    <th>가입일</th>
                    <th>승인/거절</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="member" items="${list}">
	                <tr>
	                    <td>${member.memberNo }</td>
	                    <td>${member.memberName }</td>
	                    <td>${member.phone }</td>
	                    <td>${member.modifyDate }</td>
	                    <td>
	                        <button type="submit" class="ok_btn" onclick="approveMember(${member.memberNo})">승인</button>
	                        <button type="submit" class="delete_btn" onclick="rejectMember(${member.memberNo})">거절</button>
	                    </td>
	                </tr>
            	</c:forEach>
            </tbody>
        </table>   
    </div>
</div>    
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script type="text/javascript">
	function approveMember(memberNo) {
	    alertify.confirm("가입승인을 하시겠습니까?", function (e) {
	        if (e) {
	            $.ajax({
	                type: "POST",
	                url: "/fork/approveMember",
	                data: JSON.stringify({ memberNo: memberNo }), // 데이터를 JSON 문자열로 변환
	                contentType: "application/json", // 컨텐츠 타입 설정
	                success: function(data) {
	                    alertify.alert("가입승인 완료");
	                    location.reload(true);
	                }
	            });
	        } else {
	        }
	    });
	}
	
	function rejectMember(memberNo) {
	    alertify.confirm("승인 거절하시겠습니까?", function (e) {
	        if (e) {
	            $.ajax({
	                type: "POST",
	                url: "/fork/rejectMember",
	                data: JSON.stringify({ memberNo: memberNo }), // 데이터를 JSON 문자열로 변환
	                contentType: "application/json", // 컨텐츠 타입 설정
	                success: function(data) {
	                    alertify.alert("승인 거절");
	                    location.reload(true);
	                }
	            });
	        } else {
	            // 사용자가 취소를 선택한 경우 아무 작업도 하지 않음
	        }
	    });
	}
</script>

</body>
</html>