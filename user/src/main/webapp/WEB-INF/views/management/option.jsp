<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>옵션 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
      * {
          /* border: 1px solid red; */
          box-sizing: border-box;
      }

      .content_outer {
          width: 100%;
          height: 100px;
          margin-top: 6%;
      }

      .content_nav > div {
          float: left;
      }
      
      .content_nav {
		  width: 100%;        
      }

      .content_title {
          width: 48.7%;
          font-size: 40px;
          font-weight: bolder;
          margin-left: 6%;
          margin-top : 20px;
      }

      .btn1 {
          width: 8%;
          height: 62px;
          display: flex;
          margin-top : 20px;
      }

      button {
          width: 80%;
          height: 65%;
          border-radius: 5px;
          margin: auto auto;
          cursor: pointer;
          background-color: #FF8B3D;
          color: white;
          font-weight: bolder;
          border: none;
          font-size: 14px;
      }

      button:hover {
          background-color: wheat;
      }

      .content {
          width: 100%;
          margin-top: 130px;
          height: 75vh;
      }

      .option_table {
      	width: 88%;
          margin: 0 auto;
          border-bottom: 1px solid lightgray;
          border-spacing: 0px;
      }

      td {
          text-align: center;
          height: 50px;
          font-size: 2vh;
          border-bottom: 1px solid lightgray;
      }

      th {
          height: 55px;
          background-color: lightgrey;
          font-size: 2.3vh;
          text-align: center;
      }

       /* 모달 스타일 */
       .modal {
          display: block;
          position: fixed;
          z-index: 1;
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.4);
          overflow: auto;
      }

      .modal-content {
          background-color: white;
          margin: 14% auto;
          padding: 20px;
          border: 1px solid #888;
          width: 400px;
          height: 530px;
          border-radius: 5px;
          text-align: center;
          font-size: 20px;
          font-weight: bold;
      }
      
      .modal-content2 {
          background-color: white;
          margin: 14% auto;
          padding: 20px;
          border: 1px solid #888;
          width: 400px;
          height: 440px;
          border-radius: 5px;
          text-align: center;
          font-size: 20px;
          font-weight: bold;
      }

      .close-button {
          color: #aaa;
          float: right;
          font-size: 28px;
          font-weight: bold;
          cursor: pointer;
      }

      .close-button:hover,
      .close-button:focus {
          color: black;
          text-decoration: none;
          cursor: pointer;
      }

      .checkbutton {
          width: 350px;
          margin: 20px auto
      }

      .modal_header {
          font-size: 30px;
          margin-bottom: 10px;
      }

      .modal_content {
          margin-top: 10px;
      }

      .modal_content div{
          text-align: left;
          margin-bottom: 10px;
      }

      .modal_content input[type=text], select {
          height: 30px;
          width: 100%;
          border-radius: 5px;
          border: 1px solid lightgray;
          padding-left: 5px;
      }

      .closeModal{
          position: absolute;
          right: 10%;
          color:#FF8B3D
      }
      
      .closeModal2{
      	position: absolute;
          right: 41%;
          color:#FF8B3D
      }

      .closeModal:hover, .closeModal2:hover{
          cursor: pointer;
      }

      .insertbtn, .updatebtn {
          width: 350px;
          height: 40px;
          margin-top: 20px;
      }

      select {
          height: 30px;
          width: 100%;
          border-radius: 5px;
          border: 1px solid lightgray;
          padding-left: 5px;
      }
      
      .delete-btn {
      	height: 30px;
      	background-color: gray;
      }
      
      .delete-btn:hover {
      	background-color: lightgray;
      }

	  .pagination{
		justify-content: center;
	  }
</style>
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- content 시작 -->
    <div class="content_outer">
        <div class="content_nav">
            <div class="content_title">옵션 관리</div>
            <div class="btn1"><button onClick="location.href='${contextPath}/category'">카테고리 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/menu'">메뉴 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/option'">옵션 관리</button></div>
            <div class="btn1"><button onClick="location.href='${contextPath}/coo'">원산지 관리</button></div>
            <div class="btn1"><button onclick="" class="insertOption">옵션 등록</button></div>
        </div>
        <div class="content">
            <div class="table_outer">
                <table class="option_table">
                    <thead>
                        <tr>
                            <th style="width:5%;">옵션 번호</th>
                            <th style="width:15%;">옵션 이름</th>
                            <th style="width:8%;">가격</th>
                            <th style="width:8%;">상위 옵션 번호</th>
                            <th style="width:15%;">메뉴 이름</th>
                            <th style="width:10%;">수정</th>
                            <th style="width:10%;">삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${empty list}">
                    		<td colspan="6">옵션 리스트가 없습니다.</td>
                    	</c:if>
                    	<c:forEach var="option" items="${list }">
						<tr>
							<td>${option.optionNo }</td>
							<td>${option.optionName }</td>
							<td>${option.price }원</td>
							<td>${option.prOptionNo }</td>
							<c:if test="${option.menuName eq null}">
								<td>-</td>
							</c:if>
							<c:if test="${option.menuName ne null }">
								<td>${option.menuName }</td>
							</c:if>
							<td><button class="update-btn updateOption" type="button" onClick="openModal2(${option.optionNo})">수정</button></td>
							<td>
								<form method="post" action="${contextPath}/deleteOption/${option.optionNo}">
                					<button class="delete-btn" type="submit">삭제</button>
            					</form>
            				</td>
						</tr>
						</c:forEach>
                    </tbody>
                </table>
                
            </div>
        </div>
        
        <c:set var="url" value="option?currentPage="/>
        
        <c:if test="${not empty param.condition }">
			<c:set var="sUrl" value="&condition=${param.condition }&keyword=${param.keyword }"/>
		</c:if>
        
		<div id="pagingArea">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">이전 페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${url}${pi.currentPage - 1}${sUrl}">이전 페이지</a></li>
					</c:otherwise>
				</c:choose>
	
				<c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
					<li class="page-item"><a class="page-link" href="${url}${item}${sUrl}">${item}</a></li>
				</c:forEach>
	
				<c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage}">
						<li class="page-item disabled"><a class="page-link" href="#">다음 페이지</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${url}${pi.currentPage + 1}${sUrl}">다음 페이지</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
        
    </div>

    <br><br><br><br>

    <!-- 옵션 수정 모달 -->
    <div id="updateOptionModal" class="modal" style="display: none;">
    <form action="${contextPath}/updateOption" method="post">
    <input type="hidden" name="optionNo" id="updateOptionNo" value="">
        <div class="modal-content2">
            <div class="modal_header">옵션 수정 <span class="closeModal2" onclick="closeModal2();">X</span></div>
            <hr>
            <div class="modal_content">
                <div class="coo_name">옵션 이름</div>
                <div><input type="text" name="optionName" id="optionName" placeholder="옵션 이름을 입력하세요"></div>
                <div>가격</div>
                <div><input type="text" name="price" id="price" placeholder="가격을 입력하세요"></div>
                <div>상위 옵션</div>
                <div>
                    <select name="prOptionNo" id="prOptionNo">
                    </select>
                </div>
            </div>
            <button class="updatebtn" type="submit">수정</button>
        </div>
        </form>
    </div>

    <!-- 옵션 등록 모달 -->
    <div id="insertOptionModal" class="modal" style="display: none;">
    	<form action="${contextPath }/insertOption" method="get">
        <div class="modal-content">
            <div class="modal_header">옵션 등록 <span class="closeModal" onclick="closeModal();">X</span></div>
            <hr>
            <div class="modal_content">
            	<div>메뉴</div>
                <div>
                	<select name="menuNo" id="menuNo">
                    </select>
                </div>
                <div class="coo_name">옵션 이름</div>
                <div><input type="text" name="optionName" placeholder="옵션 이름을 입력하세요"></div>
                <div>가격</div>
                <div><input type="text" name="price" placeholder="가격을 입력하세요"></div>
                <div>상위 옵션</div>
                <div>
                    <select name="prOptionNo" id="menuOption">
                    </select>
                </div>
            </div>
            <button type="submit" class="insertbtn" onclick="closeModal()">등록</button>
        </div>
        </form>
    </div>

    <script>
    	console.log(${alertMsg});
    
        const updateOption = document.querySelector('.updateOption');
        const insertOption = document.querySelector('.insertOption');
        const insertOptionModal = document.getElementById('insertOptionModal');
        const updateOptionModal = document.getElementById('updateOptionModal');

        // 옵션 등록
        function openModal() {
            insertOptionModal.style.display = 'block';
            
            const selectMenuList = () => $.ajax({
		            	url : "${contextPath}/selectMenuList",
		            	method : "post",
		            	success : function(data) {
		            		console.log(data);
		            		let str1 = "<option value=" + 0 + ">없음</option>";
		            		for(let i = 0; i < data.length; i++) {
			    				str1 += "<option value=" + data[i].menuNo + ">" + data[i].menuName + "</option>";
		    				}
		            		$("#menuNo").html(str1);
		            	}
		            })	
            
            $.ajax({
    			url : "${contextPath}/selectOptionList",
    			method : "GET",
    			success : function(data) {
    				let str1 = "<option value=" + 0 + ">없음</option>";
    				for(let i = 0; i < data.length; i++) {
    					if(data[i].prOptionNo == 0) {
	    					str1 += "<option value=" + data[i].optionNo + ">" + data[i].optionName + "</option>";
    					}
    				}
    				$("#menuOption").html(str1);
    				
    				selectMenuList();
    			}
    		})
        }

        function closeModal() {
            insertOptionModal.style.display = 'none';
        }
		
        // 옵션 수정
        function openModal2(optionNo) {
            updateOptionModal.style.display = 'block';
            
            $.ajax({
                url: "${contextPath}/selectOptionList",
                method: "GET",
                success: function(data) {
                    let str1 = "<option value=" + 0 + ">없음</option>";
                    for (let i = 0; i < data.length; i++) {
                        if (data[i].prOptionNo == 0) {
                            str1 += "<option value=" + data[i].optionNo + ">" + data[i].optionName + "</option>";
                        }
                    }
                    $("#prOptionNo").html(str1);
                    
                    $.ajax({
		            	url : "${contextPath}/selectMenuList",
		            	method : "post",
		            	success : function(data) {
		            		let str1 = "<option value=" + 0 + ">없음</option>";
		            		for(let i = 0; i < data.length; i++) {
			    				str1 += "<option value=" + data[i].menuNo + ">" + data[i].menuName + "</option>";
		    				}
		            		$("#menuNo").html(str1);
		            	}
		            })
		            
                    $.ajax({
                        url: "${contextPath}/selectOption",
                        method: "post",
                        data: { optionNo: optionNo },
                        success: function(result) {
                        	$("#updateOptionNo").val(result.optionNo)
                            $("#optionName").val(result.optionName);
                            $("#price").val(result.price);
                            
                            // 옵션 select 요소 설정
                            let prOptionNo = parseInt(result.prOptionNo); // 문자열을 숫자로 변환
                            $("#prOptionNo option").each(function() {
                                if (parseInt($(this).val()) === prOptionNo) {
                                    $(this).prop("selected", true);
                                } else {
                                    $(this).prop("selected", false);
                                }
                            });
                            
                            let menuNo = parseInt(result.menuNo);
                            $("#menuNo option").each(function() {
                                if (parseInt($(this).val()) === menuNo) {
                                    $(this).prop("selected", true);
                                } else {
                                    $(this).prop("selected", false);
                                }
                            });
                        }
                    });
                }
            });

            
        }

        function closeModal2() {
            updateOptionModal.style.display = 'none';
        }

        insertOption.addEventListener('click', openModal);
        updateOption.addEventListener('click', openModal2);

        window.addEventListener('click', (event) => {
            if (event.target === insertOptionModal || event.target === updateOptionModal) {
                closeModal();
            }
        });
        
        $("#header-menu").addClass("header_btn_on").removeClass("header_btn");
    </script>

</body>
</html>