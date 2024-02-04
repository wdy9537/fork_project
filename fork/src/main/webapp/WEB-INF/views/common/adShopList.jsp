<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹점 관리</title>
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
        min-height:92vh;
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
    
    .notice_btn_container{
        display: flex;
        margin-top: -25px;

    }

    /* 선택삭제 버튼 */
    .notice_btn_delete{
        margin-right: 1080px;
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

    
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="content">       
    <div id="container">
        <div id="notice_title1">가맹점 현황 관리</div>
        <br><br>
        
        <table>
            <thead>
                <tr>
                	<th style="width: 10%"><input type="checkbox" name='selectall'></th>
                    <th>회원번호</th>
                    <th>사업자명</th>
                    <th>매장 전화번호</th>
                    <th>가입일</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="member" items="${list}">
	                <tr>
	                	<td><input type="checkbox" name='checkbox' value="${member.memberNo}" data-notice-id="${member.memberNo}"></td>
	                    <td onclick="movePage(${member.memberNo})">${member.memberNo }</td>
	                    <td onclick="movePage(${member.memberNo})">${member.memberName }</td>
	                    <td onclick="movePage(${member.memberNo})">${member.phone }</td>
	                    <td onclick="movePage(${member.memberNo})">${member.modifyDate }</td>
	                </tr>
            	</c:forEach>
            </tbody>
        </table>
        
        <div class="notice_btn_container">
            <div><button type="submit" class="notice_btn_delete" onclick="deleteValue();">선택삭제</button></div>
        </div>
  	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
	function movePage(no){
		location.href="${contextPath}/adShopDetail/"+no;
	}
</script>

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
	    var url = "deleteShopList";
	    var valueArr = [];
	    var list = $("input[name='checkbox']");
	    
	    for (var i = 0; i < list.length; i++) {
	        if (list[i].checked) {
	            valueArr.push(list[i].value);
	        }
	    }
	    
	    if (valueArr.length === 0) {
	        alertify.alert("","선택된 리스트가 없습니다.");
	    } else {
	        alertify.confirm("정말 삭제하시겠습니까?", function (e) {
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
	                            alertify.alert("","삭제 실패");
	                        } else {
	                            alertify.alert("","삭제 완료", function () {
	                                window.location.href = "/fork/shopList";
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