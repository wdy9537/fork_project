<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
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
        list-style-type: none;
    }

    body{
        margin: 0;
        padding: 0;
    }
    
    .content{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding-top: 100px;
        padding-bottom: 50px;
    }

    #contentArea {
        width: 1000px;
        background-color: white;
        padding: 20px;
        border: none;
        border-top: 2px solid #FF8B3D;
        border-right: 2px solid #ddd;
        border-bottom: 2px solid #FF8B3D;

    }

    h2 {
        color: #333;
        text-align: center;
        font-size: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }


    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        text-align: center;
        background-color: rgb(255, 139, 61, 0.5);
        width: 120px;
        border-bottom : #FF8B3D;
        
    }

    td {
        border-top: 2px solid #ddd;
        padding: 0 0 0 10px;
        margin: 0;
    }

    p {
        line-height: 1.6;
        border: 1px solid #ddd; 
        height: 500px;
    }

    /* 제목 입력 input태그 */
    #title{
        width: 100%;
        height: 40px;
        border: none;
        
    }


    /* 파일 첨부 */
    #upfile{
        width: 100%;
        
    }

    /* 내용입력 input태그 */
    #input_content{
        width: 100%;
        height: 95%;
        border: none;
    }


    /* 버튼(수정, 삭제) 컨테이너 */
    .notice_btn_container{
        display: flex;
        margin-top: 10px;
        justify-content: center;
        align-items: center;

    }

    /* 수정 버튼 */
    .notice_btn_enroll{
        height: 35px; 
        width: 75px; 
        font-size: 15px;
        cursor: pointer;
        background-color: #FF8B3D;
        border: 1px solid #FF8B3D;
        border-radius: 5%;
        color: white;
        margin-right: 15px;
    }

    /* 삭제 버튼 */
    .notice_btn_cancle{
        height: 35px; 
        width: 75px; 
        font-size: 15px;
        cursor: pointer;
        background-color: #6a6a6a;
        border: 1px solid #6a6a6a;
        border-radius: 5%;
        color: white;
    }
    
    
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="content">
	
	<div class="innerOuter">
        <h2>공지사항 등록</h2>
		<form action="${contextPath }/noticeEnroll" enctype="multipart/form-data" method="POST">
			<table id="contentArea" align="center" class="table">
				<tr>
					<th style="width: 15%;">제목</th>
					<td style="border-top: 2px solid #FF8B3D;">
	                     <input type="text" id="title" class="form-control" name="noticeTitle" required>
	                </td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${loginUser.memberId }</td>
				</tr>
				<tr>
	                <th>첨부파일</th>
					<td>
					   <input type="file" id="fileInput" class="form-control" name="upfile" multiple>
	                </td>     
	            </tr>
				<tr>
					<th>내용</th>
					<td style="height: 500px;">
	                    <textarea id="input_content" style="resize:none;" rows="10" class="form-control"
					    name="noticeContent" required="required" style="height: 100%;" ></textarea>
	                </td>				
				</tr>
				
			</table>
	
	        <div class="notice_btn_container">
	            <div><button type="submit" class="notice_btn_enroll">등록</button></div>
	            <div><button type="button" class="notice_btn_cancle">취소</button></div>
	        </div>
        </form>		
	</div>
	
	
	
	
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>