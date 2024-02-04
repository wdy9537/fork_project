<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.7.0/alertify.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.7.0/css/alertify.min.css" /> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.7.0/css/themes/default.min.css" /> -->


<style>
	/* content영역 css 확인 한번 더 하기 */
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
       
   }

   td {
       border-top: 2px solid #ddd;
   }

   #text-area {
       line-height: 1.6;
       border: 1px solid #ddd; 
       height: 500px;
   }

   .reply-update-btn{
       background-color: #FF8B3D;
       color: #ddd;
       border: 1px solid #FF8B3D;
       border-radius: 10%;
       cursor: pointer;

   }

   .reply-delete-btn{
       background-color: #6a6a6a;
       color: #ddd;
       border: 1px solid #6a6a6a;
       border-radius: 10%;
       cursor: pointer;
   }

   #replyContent{
       height: 50px; 
       width: 89%;
       background-color: white;
       border: 1px solid #acabab;
       border-radius: 3px;
   }

   #reply_btn{
       height: 50px; 
       width: 70px; 
       font-size: 17px;
       vertical-align: bottom;
       margin-left: 11px;
       cursor: pointer;
       background-color: #FF8B3D;
       border: 1px solid #FF8B3D;
       border-radius: 5%;
       color: white;
       
   }
  

   .qna_btn_container{
       display: flex;
       margin-top: 10px;
       justify-content: center;
       align-items: center;

   }

   /* 수정 버튼 */
   .qna_btn_enroll{
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
   .qna_btn_delete{
       height: 35px; 
       width: 75px; 
       font-size: 15px;
       cursor: pointer;
       background-color: #6a6a6a;
       border: 1px solid #6a6a6a;
       border-radius: 5%;
       color: white;
   }
   
   .update-submit-btn{
   	   height: 23px; 
       width: 40px; 
       font-size: 12px;
       color: white;
       cursor: pointer;
       background-color: #FF8B3D;
       border: 1px solid #FF8B3D;
       border-radius: 5%;
   
   }
   
   
</style>

</head>
<body>
<script>
	/* 댓글 삭제 */
	function deleteReply(replyNo) {
	    alertify.confirm("댓글을 삭제하시겠습니까?", function (e) {
	        if (e) { 
	            $.ajax({
	                url: "${contextPath}/deleteReply",
	                method: "POST",
	                data: {
	                    replyNo: replyNo
	                },
	                success: function (result) {
	                    if (result == "1") {
	                        alertify.alert("", "댓글이 삭제되었습니다.", function () {
	                            location.reload(true);
	                        });
	                    } else {
	                        alertify.alert("", "댓글 삭제 실패");
	                    }
	                },
	                error: function (xhr, status, error) {
	                    console.error("댓글 삭제 오류: " + error);
	                }
	            });
	        } else {
	        	
	        }
	    });
	}
</script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="content">
		
	<div class="innerOuter">
           <h2>Q&A 상세보기</h2>
           <br>
		
		<table id="contentArea" align="center" class="table">
			<tr>
				<th>제목</th>
				<td colspan="5" style="border-top: 2px solid #FF8B3D;">${qna.boardTitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${qna.boardWriter }</td>

				<th>작성일</th>
				<td style="text-align: center; width: 20%;">${qna.boardCreateDate }</td>

			</tr>
			
			<tr>
				<th>내용</th>
				<td colspan="5" style="height: 500px;">
                       <p id="text-area">${qna.boardContent }</p>
                   </td>
				
			</tr>
			
               <tr style="border-top: 1px solid #FF8B3D;">
                   <th>댓글(<span id="rcount">${qna.replyList.size() }</span>)</th>
                   <td colspan="3" style="border-top: 1px solid #FF8B3D;">
                   
                   <div id="replyArea">
	                   <c:forEach var="reply" items="${qna.replyList }" > 
	                           <table id="replyArea" style="background-color: #ddd; ">
	                           	   <!-- 댓글 작성자/작성일 -->
	                               <tr style="border: none;">
	                                   <td style="border: none; font-weight: bold;">${reply.replyWriter }</td>
	                                   <td colspan="" style="text-align: end; border: none;">${reply.replyCreateDate }</td>
	                                   
	                               </tr>
	                               <!-- 댓글내용/수정삭제버튼 -->
	                               <tr>
	                               	   <!-- 댓글내용 (수정버튼 클릭시 hide) -->
	                                   <td id="replyContent-${reply.replyNo }" style="border: none;" >
	                                       ${reply.replyContent }
	                                   </td>
	                                   <!-- 댓글 수정버튼 클릭시 나올 input태그 -->
	                                   <td class="edit-reply-div" id="edit-reply-${reply.replyNo}" style="display: none;">
										    <input type="text" id="edited-reply-content-${reply.replyNo}" value="${reply.replyContent}" style="font-size: 16px; border: none; width: 700px; height: 27px">
										</td>
										<!-- 수정/삭제버튼 loginUser에 따라 다르게 나타나기 -->
	                                   <c:if test="${reply.replyWriter == loginUser.memberId}">
		                                   <td style="text-align: end;">
		                                       <button type="button" class="reply-update-btn" id="reply-update-btn-${reply.replyNo}" onclick="editReply(${reply.replyNo}, '${reply.replyContent}')">수정</button>
		                                       <button type="submit" class="reply-delete-btn" id="reply-delete-btn-${reply.replyNo}" onclick="deleteReply(${reply.replyNo})">삭제</button>
										       <button type="button" class="update-submit-btn" id="update-submit-btn-${reply.replyNo}" onclick="updateReply(${reply.replyNo})"style="display: none">저장</button>
		                                   </td>
	                                   </c:if>
	                                   <c:if test="${reply.replyWriter != loginUser.memberId && loginUser.memberId == 'admin'}">
		                                   <td style="text-align: end;">
		                                       <button type="button" class="reply-delete-btn" id="reply-delete-btn-${reply.replyNo}" onclick="deleteReply(${reply.replyNo})">삭제</button>
		                                   </td>
	                                   </c:if>
	                                    
	                               </tr>
	                               
	                           </table>
	                   </c:forEach>
                   </div>
                       
				   <c:if test="${loginUser.memberId == 'admin' || loginUser.memberId == qna.boardWriter }">
                       <div style="margin-top: 20px; padding: 0;">
                           <input type="text" id="replyContent" name="replyContent">
                           <button type="submit" id="reply_btn" onclick="insertReply();">등록</button>
                       </div>
                   </c:if>
                       
                   </td>
                  
               </tr>
		</table>
		<c:if test="${loginUser.memberId == 'admin' || loginUser.memberId == qna.boardWriter }">
	      <div class="qna_btn_container">
	          <button type="submit" class="qna_btn_enroll" onclick="updateQna(${qna.boardNo})">수정</button>
	          <button type="submit" class="qna_btn_delete" onclick="deleteQna(${qna.boardNo})">삭제</button>
	      </div>
		</c:if>
		
	</div>
</div>

<script>
	function updateQna(no){
		location.href = "${contextPath}/qnaUpdate/"+no;
	}
	
	function deleteQna(no){
		location.href = "${contextPath}/deleteQna/"+no;
	}
	
</script>

<script>
	/* 댓글 등록 */
	function insertReply() {
	    var replyContent = $("#replyContent").val();
	    
	    // 댓글 길이가 너무 길 때의 최대 길이 설정 (예: 100자)
	    var maxReplyLength = 500;
	    
	    if (replyContent.length > maxReplyLength) {
	        // 댓글 길이가 최대 길이보다 길 경우 알림창 표시
	        alertify.alert("알림", "댓글이 너무 깁니다. " + maxReplyLength + "자 이내로 작성해주세요.");
	    } else {
	        $.ajax({
	            url: "${contextPath}/insertReply",
	            data: {
	                refBno: ${boardNo},
	                replyContent: replyContent
	            },
	            success: function (result) {
	                if (result == "1") {
	                    alertify.alert("알림", "댓글이 등록되었습니다.", function () {
	                        location.reload(true);
	                    });
	                } else {
	                    alertify.alert("알림", "댓글 등록 실패");
	                }
	            }
	        });
	    }
	}
     
	/* 댓글 수정 */
	function editReply(replyNo, replyContent) {
		$('#replyContent-' + replyNo).hide(); /* 댓글 숨기기 */
		$('#reply-delete-btn-' + replyNo).hide(); /* 삭제버튼 숨기기 */
		$('#reply-update-btn-' + replyNo).hide(); /* 수정버튼 숨기기 */
		$('#edit-reply-' + replyNo).show(); /*댓글수정 input태그 보이기  */
		$('#update-submit-btn-' + replyNo).show(); /* 저장버튼 보이기 */
		
		$('#edited-reply-content-' + replyNo).val(replyContent);
	} 
	
	/* 댓글 수정 후 저장 */
	function updateReply(replyNo) {
	    var replyContent = $('#edited-reply-content-' + replyNo).val(); 
	    
	    alertify.confirm("댓글을 수정하시겠습니까?", function (e) {
	        if (e) { // 사용자가 확인 버튼을 누른 경우
	            $.ajax({
	                url: "${contextPath}/updateReply", 
	                method: "POST", 
	                data: {
	                    replyNo: replyNo, 
	                    replyContent: replyContent 
	                },
	                success: function (result) {
	                    if (result == "1") {
	                        alertify.alert("", "댓글이 수정되었습니다.", function () {
	                            location.reload(true);
	                        });
	                    } else {
	                        alertify.alert("", "댓글 수정 실패");
	                    }
	                },
	                error: function (xhr, status, error) {
	                    console.error("댓글 수정 오류: " + error);
	                }
	            });
	        } else {
	            // 사용자가 취소 버튼을 누른 경우 아무 작업도 하지 않음
	        }
	    });
	}
	

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>