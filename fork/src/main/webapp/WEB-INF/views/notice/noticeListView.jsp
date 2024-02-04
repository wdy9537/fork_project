<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
    
    /* 공지사항 타이틀 */
    #notice_title1{
        font-size: 30px;
        font-weight: bold;
    }
    
    /* 옵션과 검색창 나란히 정렬 */
    .searchForm{
    	display: flex;
    }
    
    /* 옵션태그 */
    .custom-select{
    	height: 30px;
    	width: 90px;
    	font-size: 15px; 
    	padding-top: 3px; 
    	border: 1px solid #FF8B3D;
    }
    
    .custom-select option{
    	margin-top: -10px;
    }

    /* 검색창 전체 div */
    #search{
        float: right;
        margin-right: 860px;
        margin-bottom: 10px;
        height:30px;
        width: 250px;
        border: 1px solid #FF8B3D;
        border-radius: 2px;
       
    }
    /* 검색 input type text태그 */
    #search2{
        font-size: 16px;
        width: 200px;
        height: 25px;
        border: none;
        float: left;
        margin-top: 3px;
        padding:10px;
        
    }
    /* 검색클릭 버튼 */
    #search-btn{
        height: 100%;
        border: 0px;
        background-color: #FF8B3D;
        outline: none;
        float: right;
        color: white;
        cursor: pointer;

    }

   

    /* 공지사항 리스트 */
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
	
	
	/* 페이징바 색상 */
	.page-link{
		color: #FF8B3D;
	} 
	
	
	
	/* *{
		border: 1px solid purple;
	} */ 
    
    /* 버튼(선택삭제, 글쓰기) 컨테이너 */
    .notice_btn_container{
        display: flex;
        margin-top: -25px;

    }

    /* 선택삭제 버튼 */
    .notice_btn_delete{
        margin-right: 1030px;
        height: 35px; 
        width: 75px; 
        font-size: 15px;
        vertical-align: bottom;
        cursor: pointer;
        background-color: #6a6a6a;
        border: 1px solid #6a6a6a;
        border-radius: 5%;
        color: white;
    }

    /* 글쓰기 버튼 */
    .notice_btn_write{
        height: 35px; 
        width: 75px; 
        font-size: 15px;
        vertical-align: bottom;
        cursor: pointer;
        background-color: #FF8B3D;
        border: 1px solid #FF8B3D;
        border-radius: 5%;
        color: white;

    }
    
    .top-img{
    	height: 100px;
    }
    
</style>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="content">
        
    <div id="container">
    	<c:choose>
    		<c:when test="${loginUser.memberId == 'admin' }">
		        <div id="notice_title1">공지사항 관리</div>	
    		</c:when>
    		<c:otherwise>
		        <div id="notice_title1">공지사항</div>	
    		</c:otherwise>
    	</c:choose>
    	
        <br>
        <form class="searchForm" action="" method="get">
        	<div class="select">
				<select class="custom-select" name="condition">
					<option value="title" ${param.condition eq 'title' ? 'selected' : '' }>제목</option>
					<option value="content" ${param.condition eq 'content' ? 'selected' : '' }>내용</option>
					<option value="writer" ${param.condition eq 'writer' ? 'selected' : '' }>작성자</option>
					<option value="titleAndContent" ${param.condition eq 'titleAndContent' ? 'selected' : '' }>제목+내용</option>
				</select>
			</div>
        	
	        <div id="search">
	            <input type="text" id="search2" placeholder="검색어 입력" name="keyword" value="${param.keyword }">
	            <button id="search-btn">검색</button>
	        </div>
        
        </form>

        <table>
            <thead>
                <tr>
                	<c:if test="${loginUser.memberId == 'admin' }">
                		<th style="width: 10%"><input type="checkbox" name='selectall'></th>
                	</c:if>
                    <th style="width: 10%">글번호</th>
                    <th style="width: 30%">제목</th>
                    <th style="width: 20%">작성자</th>
                    <th style="width: 20%">작성일</th>
                    <th style="width: 10%">조회수</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${empty list }">
            		<td colspan="6">게시글이 존재하지 않습니다.</td>
            	</c:if>
            	<c:forEach var="n" items="${list }">
	                <tr> 
	                	<c:if test="${loginUser.memberId == 'admin' }">
	                		<td><input type="checkbox" name='checkbox' value="${n.noticeNo}" data-notice-id="${n.noticeNo}"></td>
	                	</c:if>
	                    <td onclick="movePage(${n.noticeNo});">${n.noticeNo }</td>
	                    <td onclick="movePage(${n.noticeNo});">${n.noticeTitle }</td>
	                    <td onclick="movePage(${n.noticeNo});">${n.noticeWriter}</td>
	                    <td onclick="movePage(${n.noticeNo});">${n.noticeCreateDate }</td>
	                    <td onclick="movePage(${n.noticeNo});">${n.noticeCount }</td>
	                </tr>
            	</c:forEach>
            </tbody>
        </table>
        
        <!-- 관리자 삭제, 글쓰기 버튼 -->
        <c:if test="${loginUser.memberId == 'admin' }">
	        <div class="notice_btn_container">
	            <div><button type="submit" class="notice_btn_delete" onclick="deleteValue();">선택삭제</button></div>
	            <div><button type="submit" class="notice_btn_write" onclick="noticeEnroll();">글쓰기</button></div>
	        </div>
        </c:if>
        
        <!-- 페이징바 -->
        <c:set var="url" value="?currentPage="/>
        
        <c:if test="${not empty param.condition }">
			<c:set var="sUrl" value="&condition=${param.condition }&keyword=${param.keyword }"/>
		</c:if>
			
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						</c:when>
						
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${url}${pi.currentPage -1}${sUrl}">이전</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
						<li class="page-item">
							<a class="page-link" href="${url }${item}${sUrl}">${item}</a>
						</li>
					
					</c:forEach>
					
					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
						</c:when>
						
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${url}${pi.currentPage +1}${sUrl}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
        
        
        
        <!-- 게시글 상세페이지로 이동 -->
        <script>
        	function movePage(no){
        		location.href="${contextPath}/noticeDetail/"+no;
        	}
        </script>
        
        <!-- 글쓰기 페이지로 이동 -->
      	<script>
		    function noticeEnroll() {
		        location.href = "${contextPath}/noticeEnroll";
		    }
		</script>
    
    </div>
        
  
</div> 


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<!-- selectAll 체크박스 클릭시 모든 체크박스가 선택되게함 -->
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	$(function(){
	    var chkObj = document.getElementsByName("checkbox");
	    var rowCnt = chkObj.length;
	
	    $("input[name='selectall']").click(function(){
	        var chk_listArr = $("input[name='checkbox']");
	        for(var i = 0; i < chk_listArr.length; i++){
	            chk_listArr[i].checked = this.checked;
	        }
	    });
	
	    $("input[name='checkbox']").click(function(){
	        if($("input[name='checkbox']:checked").length === rowCnt){
	            $("input[name='selectall']")[0].checked = true;
	        }else{
	            $("input[name='selectall']")[0].checked = false;
	        }
	    });
	});
    
	function deleteValue() {
	    var url = "deleteNoticeList";
	    var valueArr = [];
	    var list = $("input[name='checkbox']");
	    
	    for (var i = 0; i < list.length; i++) {
	        if (list[i].checked) {
	            valueArr.push(list[i].value);
	        }
	    }
	    
	    if (valueArr.length === 0) {
	        alertify.alert(" ", "선택된 리스트가 없습니다.");
	    } else {
	        var chk = alertify.confirm("정말 삭제하시겠습니까?", function (e) {
	            if (e) {
	                $.ajax({
	                    url: url,
	                    type: 'POST',
	                    traditional: true,
	                    data: {
	                        valueArr: valueArr
	                    },
	                    success: function (jdata) {
	                        if (jdata === 1) {
	                            alertify.alert("삭제 실패");
	                        } else {
	                            alertify.alert("삭제 완료", function () {
	                                window.location.href = "/fork/noticeList";
	                            });
	                        }
	                    }
	                });
	            } else {
	            	
	            }
	        });
	    }
	}
           
    
    
    
    
    
    
    
    
    
    
</script>  


</body>
</html>