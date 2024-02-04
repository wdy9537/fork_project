<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
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
        font-family: Arial, sans-serif;
    }
    
    .content{
        width: 100%;
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
    }

    p {
        line-height: 1.6;
        border: 1px solid #ddd; 
        height: 500px;
    }
    
        /* 버튼(수정, 삭제) 컨테이너 */
    .notice_btn_container{
        display: flex;
        margin-top: 10px;
        justify-content: center;
        align-items: center;

    }

    /* 수정 버튼 */
    .notice_btn_update{
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
    .notice_btn_delete{
        height: 35px; 
        width: 75px; 
        font-size: 15px;
        cursor: pointer;
        background-color: #6a6a6a;
        border: 1px solid #6a6a6a;
        border-radius: 5%;
        color: white;
    }
    
    /* 파일 다운로드 버튼 */
    .download-btn{
    	cursor: pointer;
    	border: 1px solid #FF8B3D;
    	border-radius: 3px;
    	height: 25px;
    	font-size: 13px;
    	color: #FF8B3D;
    }
    
    .download-btn:hover{
    	 box-shadow: 0px 0px 10px 0px #888888;
    	 background-color: #FF8B3D;
    	 color: white;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content">
		
		<div class="innerOuter">
            <h2>공지사항 상세보기</h2>
			
			<table id="contentArea" align="center" class="table">
				<tr>
					<th>제목</th>
					<td colspan="5" style="border-top: 2px solid #FF8B3D;">${notice.noticeTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td style="width: 55%;">${notice.noticeWriter }</td>

					<th>작성일</th>
					<td style="text-align: center;">${notice.noticeCreateDate }</td>

				</tr>
				<tr>
                    <th>첨부파일</th>
				    <td>
						<c:forEach items="${notice.attachList}" var="attachment">
				        	<button type="button" class="download-btn"
				        		onclick="location.href='${contextPath}/notice/fileDownload/${attachment.faNo}'">
				            	${attachment.faOriginName} - 다운로드
				        	</button> 
						</c:forEach>
				    </td>

                    
                    <th>조회수</th>
                    <td style="text-align: center;" >${notice.noticeCount }</td>
                </tr>
				<tr>
					<th rowspan="2" >내용</th>
					<td colspan="5" style="height: 500px;"><p id="textarea">${notice.noticeContent }</p></td>
				</tr>
			</table>
			
			<c:if test="${loginUser.memberId == 'admin' }">
				<div class="notice_btn_container">
		            <div><button type="submit" class="notice_btn_update" onclick="updateNotice(${notice.noticeNo})" >수정</button></div>
		            <div><button type="submit" class="notice_btn_delete" onclick="deleteNotice(${notice.noticeNo})">삭제</button></div>
		        </div>
			</c:if>
	        
			
		</div>
	</div>
	<script>
		function updateNotice(no){
			location.href = "${contextPath}/noticeUpdate/"+no;
		}
	</script>
	<script>
		function deleteNotice(no){
			location.href = "${contextPath}/deleteNotice/"+no;
		}
	</script>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>