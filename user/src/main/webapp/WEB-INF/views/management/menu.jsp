<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메뉴 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
* {
	/* border: 1px solid red; */
	box-sizing: border-box;
}

.content_outer {
	width: 100%;
	height: 100px;
	margin-top: 7%;
}

.content_nav>div {
	float: left;
}

.content_nav{
	width: 100%;
}

.content_title {
	width: 48.7%;
	font-size: 40px;
	font-weight: bolder;
	margin-left: 6%;
	margin-top: 20px;
}

.btn1 {
	width: 8%;
	height: 62px;
	display: flex;
	margin-top: 20px;
}

button {
	width: 80%;
	height: 70%;
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
	margin-top: -1.5vh;
}

table * {
	border: 1px solid lightgray;
}

.menuTable {
	width: 88%;
	height: 50px;
	margin: 0 auto;
	text-align: left;
}

.menuTable td.menu_img:hover {
	cursor: pointer;
}

th {
	height: 50px;
	font-weight: bolder;
	font-size: 20px;
	padding-left: 10px;
	background-color: rgb(50, 50, 50);
	color: white;
}

td {
	height: 300px;
	width: 20%;
}

.footer-text {
	height: 20px;
	text-align: center;
	max-width: 300px;
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
	margin: 7% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 450px;
	height: 680px;
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

.close-button:hover, .close-button:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.checkbutton {
	width: 350px;
	margin: 20px auto;
	height: 5%;
}

.checkbutton1 {
	width: 350px;
	margin: 20px auto;
	height: 40px;
}

.modal_header {
	font-size: 30px;
	margin-bottom: 10px;
}

.modal_content {
	margin-top: 10px;
}

.modal_content div {
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

label {
	color: white;
	background-color: #FF8B3D;
	width: 80px;
	height: 30px;
	border: none;
	cursor: pointer;
	display: block;
	border-radius: 3px;
	text-align: center;
	line-height: 30px;
	font-size: 15px;
}

textarea {
	resize: none;
	width: 100%;
	height: 100px;
	border: 1px solid lightgray;
	border-radius: 5px;
	padding: 5px;
}

.closeModal {
	position: absolute;
	right: 40.5%;
	color: #FF8B3D;
}

.closeModal2 {
	position: absolute;
	right: 33%;
	color: #FF8B3D;
}

.closeModal:hover, .closeModal2:hover {
	cursor: pointer;
}

.modal-content-detail {
	background-color: white;
	margin: 13% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 710px;
	border-radius: 5px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

.updatebutton, .deletebutton {
	width: 150px;
	margin-left: 20px;
	margin-top: 20px;
	height: 4vh;
}

.menu-detail {
	margin-bottom: 40px;
}

.menu-detail>* {
	float: left;
}

.menu_detail_table {
	width: 300px;
	margin-left: 30px;
}

.menu_detail_table * {
	border: none;
}

.menu_detail_table th {
	text-align: left;
	font-size: 24px;
	padding-left: 0;
	background-color: white;
	color: black;
}

.menu_detail_table td {
	height: 40px;
	font-size: 13px;
	text-align: left;
	font-weight: normal;
}

.menu_detail_img {
	width: 300px;
	height: 300px;
	border: 1px solid lightgray;
	border-radius: 10px;
}
.top-menu{
	height: 50px;
	font-weight: bolder;
	font-size: 20px;
	padding-left: 10px;
	background-color: rgb(50, 50, 50);
	color: white; 
	width: 88%;
	margin: 0 auto; 
	line-height: 50px;
}
.menu_img>img{
	width: 300px;
	height: 300px;
}

#fileName{
	font-size: 15px;
	font-weight: normal;
}

#lowOptionName , #lowOptionPrice{
	width: 170px;
}

#highOptionName {
	width: 345px;
}

#addHighOptionButton, #addLowOptionButton{
	width: 40px;
	height: 30px;
}

#insertOptionButton {
	width: 350px;
	height: 30px;
	margin-left: 30px;
	margin-top: 10px;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- content 시작 -->
	<div class="content_outer">
		<div class="content_nav">
			<div class="content_title">메뉴 관리</div>
			<div class="btn1"><button onClick="location.href='${contextPath}/category'">카테고리 관리</button></div>
			<div class="btn1"><button onClick="location.href='${contextPath}/menu'">메뉴 관리</button></div>
			<div class="btn1"><button onClick="location.href='${contextPath}/option'">옵션 관리</button></div>
			<div class="btn1"><button onClick="location.href='${contextPath}/coo'">원산지 관리</button></div>
			<div class="btn1"><button onclick="insertMenu1()" class="insertMenu">메뉴 등록</button></div>
		</div>
	</div>
	<div class="content">
		<!-- 메뉴가 들어가는 곳 -->
	</div>

	<!-- 메뉴 등록 모달 -->
	<div id="insertMenuModal" class="modal" style="display: none">
	    <div class="modal-content">
	        <form action="${contextPath}/insertMenu" method="post" enctype="multipart/form-data">
	            <div class="modal_header">
	                메뉴 등록 <span class="closeModal" id="closeModalButton" onClick="closeModal()">X</span>
	            </div>
	            <hr>
	            <div class="modal_content">
	                <div class="menu_name">메뉴 이름</div>
	                <div>
	                    <input type="text" name="menuName" placeholder="메뉴 이름을 입력하세요" required>
	                </div>
	                <div>가격</div>
	                <div>
	                    <input type="text" name="price" placeholder="가격을 입력하세요" required>
	                </div>
	                <div>카테고리</div>
	                <div>
	                    <select name="categoryNo" id="categoryNo">
	                    </select>
	                </div>
	                <div>메뉴 이미지</div>
	                <div>
	                    <label>파일 선택<input type="file" name="file" style="display: none;" class="fileInput"></label>
	                    <span id="fileName"></span>
	                </div>
	                <div>메뉴 상세정보</div>
	                <div>
	                    <textarea name="menuDetail" placeholder="메뉴 상세정보를 입력하세요" required></textarea>
	                </div>
	            </div>
	            <button class="checkbutton1" id="closeModalButton" type="submit">등록</button>
	        </form>
	    </div>
	</div>

	<!-- 메뉴 수정 모달 -->
	<div id="updateMenuModal" class="modal" style="display: none">
		<form action="${contextPath }/updateMenu" method="post" enctype="multipart/form-data">
		<input type="hidden" name="menuNo" value="" id="updateMenuNo">
			<div class="modal-content">
				<div class="modal_header">
					메뉴 수정<span class="closeModal" onclick="closeModal2();">X</span>
				</div>
				<hr>
				<div class="modal_content">
					<div class="menu_name">메뉴 이름</div>
					<div>
						<input type="text" id="updateMenuName" name="menuName" placeholder="메뉴 이름을 입력하세요">
					</div>
					<div>가격</div>
					<div>
						<input type="text" id="updatePrice" name="price" placeholder="가격을 입력하세요">
					</div>
					<div>카테고리</div>
					<div>
						<select name="categoryNo" id="categoryNo2">
						</select>
					</div>
					<div>메뉴 이미지</div>
					<div style="width: 100px;">
						<label>파일 선택<input type="file" name="file" style="display: none;" class="fileInput"></label>
	                    <span id="fileName"></span>
					</div>
					<div>메뉴 상세정보</div>
					<div>
						<textarea id="updateMenuDetail" name="menuDetail" placeholder="메뉴 상세정보를 입력하세요"></textarea>
					</div>
				</div>
				<button class="checkbutton" type="submit">수정</button>
			</div>
		</form>
	</div>

	<!-- 메뉴 상세정보 모달 -->
	<div id="menuDetailModal" class="modal" style="display: none">
	<form action="deleteMenu" method="post">
		<input type="hidden" name="menuNo" id="deleteMenuNo" value="">
		<div class="modal-content-detail">
			<div class="modal_content menu-detail">
				<div class="menu_detail_img_tol">
					<img class="menu_detail_img">
				</div>
				<table class="menu_detail_table">
					<thead>
						<tr>
							<th colspan="2" id="modalmenuName"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="font-weight: bolder; width: 100px;">가격</td>
							<td id="modalprice"></td>
						</tr>
						<tr>
							<td style="font-weight: bolder;">카테고리</td>
							<td id="modalcategory"></td>
						</tr>
						<tr>
							<td style="font-weight: bolder;">옵션</td>
							<td id="modaloption"></td>
						</tr>
						<tr>
							<td colspan="2" style="font-weight: bolder;">상세정보</td>
						</tr>
						<tr>
							<td colspan="2" id="modalDetail"></td>
						</tr>
					</tbody>
				</table>
				<div class="closeModal2" onclick="closeModal3();">X</div>
			</div>
			<button class="updatebutton" onclick="openModal2()" type="button">수정</button>
			<button class="deletebutton" type="submit">삭제</button>
		</div>
		</form>
	</div>

	<br><br><br><br><br><br>
	
	
	<script>
	// 파일 입력(input type="file) 요소의 변경 이벤트 감지
	$(".fileInput").change(function () {
	    // 선택한 파일의 이름 가져오기
	    var fileName = $(this).val().split("\\").pop(); // 파일 경로에서 파일 이름 추출

	    // 파일 이름을 <span>에 표시
	    $(this).closest(".modal-content").find("#fileName").text(fileName);

	    // .modal-content 요소의 높이를 700px로 설정
	    $(this).closest(".modal-content").css("height", "700px");
	});

	// 등록 또는 수정 버튼 클릭 이벤트
	$(".checkbutton[type='submit']").click(function () {
	    // .modal-content 요소의 높이를 680px로 설정
	    $(this).closest(".modal-content").css("height", "680px");
	});


	/* ------------------------------------------------------------------------------------ */
	
	// 메뉴 리스트 불러오기
	const content = document.querySelector(".content");
	
		$.ajax({
			// 전체 카테고리 불러오기
			url : "${contextPath}/category",
			type : "POST",
			success(category){
				// 카테고리 로드 성공시 전체 메뉴 불러오기
				$.ajax({
					url : "${contextPath}/menu",
					type : "POST",
					async: false,
					success(menus){
						
						// 상위 카테고리 시작점  
						for (prCate of category){
							let topMenu = ""; // 상위 카테고리 이름이 들어갈 영역
							let table = ""; // 메뉴 리스트 들어갈 영역
							
							// 카테고리 번호가 0일 경우 상위 카테고리
							if ( prCate.prCategoryNo === 0 ) {
								
								// 제목에 상위 카테고리 이름 뿌려줌
								topMenu = `<div class="top-menu" onclick='topMenuClick(this);'>\${prCate.categoryName}</div>`;
								
								// 카테고리 메뉴 시작점
								table += `<div class="table_outer">`
								
								// 전체 카테고리 리스트 중 카테고리 번호와 상위 카테고리 번호가 일치할시 같은 카테고리로 분류
								for (c of category){
									if ( prCate.categoryNo === c.prCategoryNo) {
										
										table += `<table class="menuTable">`;
										
										table += `<thead>
										    <tr>
									            <th colspan="5" style="background-color: gray">\${c.categoryName}</th>
									        </tr>
									       </thead>`;
										
										table += `<tbody>`;
										
										// 전체 메뉴들 중 현재 카테고리 번호와 메뉴의 카테고리 번호가 일치하는 것들을 필터
										let menu = menus.filter( (menu) =>  {
											if ( c.categoryNo == menu.categoryNo) {
													return menu;
												}
											}
										)
										
										// 메뉴 순차적으로 반복 (1. 5의 배수)
										let index = 0; // 배열의 숫자를 담아줄 변수 index
										
			 							for ( i=0; i<(Math.floor(menu.length/5)); i++) {
			 								table += `<tr>`;
			 								for ( j=0; j<5; j++ ) {
			 									table += `<td class="footer-text menu_img" onclick="openModal3(\${menu[index].menuNo})"><img src='http://192.168.30.14:8082/user\${menu[index].filePath}\${menu[index].changeName}' /><br>\${menu[index].menuName}</td>`;
			 									index++;
			 								}
											table += `</tr>`;
										}
										
										// 메뉴 순차적으로 반복 (2. 5의 배수 나머지 [0~4개])
			 							
			 							if ( (Math.round(menu.length%5)) > 0 ) {
			 								table += `<tr>`;
			 								for ( i=0; i<(Math.round(menu.length%5)); i++ ) {
			 									table += `<td class="footer-text menu_img" onclick="openModal3(\${menu[index].menuNo})	"><img src='http://192.168.30.14:8082/user\${menu[index].filePath}\${menu[index].changeName}' /><br>\${menu[index].menuName}</td>`;
			 									index++;
			 								}
			 	 							for ( i=0; i<5-(Math.floor(menu.length%5)); i++ ) {
			 									table += `<td class="footer-text">-</td>`;
			 								} 
			 	 							table += `</tr>`;
			 							} 
									}
								}
								table += `</div>`
							}
							// 카테고리 메뉴 종료
							
							// content영역에 상위 카테고리 제목과 카테고리 리스트 넣어줌
							$(content).append(topMenu);
							$(content).append(table);
							
						}
						// 상위 카테고리 종료
					}
				})
			}
		})
		
		// 상위 카테고리 클릭시 하위 카테고리 슬라이드 토글
		function topMenuClick(title){
			$(title).next().slideToggle();	
		}
	
	
	
    	// 메뉴 등록
    	function insertMenu1() {
    		
    		$.ajax({
    			url : "${contextPath}/selectCategoryList",
    			method : "GET",
    			success : function(result) {
    				let str = "<option value=" + 0 + ">없음</option>";
    				for(let i = 0; i < result.length; i++) {
    					if(!result[i].prCategoryNo == 0) {
	    					str += "<option value=" + result[i].categoryNo + ">" + result[i].categoryName + "</option>";
    					}
    				}	
    				$("#categoryNo").html(str);
    			}
    		});
    		
    	};
    
        const insertMenu = document.querySelector('.insertMenu');
        const insertMenuModal = document.getElementById('insertMenuModal');

        const updatebutton = document.querySelector('.updatebutton');
        const updateMenuModal = document.getElementById('updateMenuModal');

        const menu_img_elements = document.querySelectorAll('.menu_img');
        const menuDetailModal = document.getElementById('menuDetailModal');
        
        // 메뉴 등록 모달창
        function openModal() {
            insertMenuModal.style.display = 'block';
        }

        function closeModal() {
            insertMenuModal.style.display = 'none';
        }

        insertMenu.addEventListener('click', openModal);

        // 메뉴 수정 모달창
        function openModal2() {
            updateMenuModal.style.display = 'block';
            menuDetailModal.style.display = 'none';
            
            const loadData = () => $.ajax({
    			url : "${contextPath}/selectDetailMenu",
    			method : "post",
    			data : {menuNo : $("#deleteMenuNo").val()},
    			success : function(data) {
    				$("#updateMenuNo").val(data.menuNo);
    				$("#updateMenuName").val(data.menuName);
    				$("#updatePrice").val(data.price);
    				$("#categoryNo2 option").each(function() {
                        if ($(this).val() == data.categoryNo) {
                            $(this).prop("selected", true);
                        } else {
                            $(this).prop("selected", false);
                        }
                    });
    				$("#updateMenuDetail").val(data.menuDetail);
    			}
    		})
    		
            $.ajax({
    			url : "${contextPath}/selectCategoryList",
    			method : "GET",
    			success : function(result) {
    				let str = "<option value=" + 0 + ">없음</option>";
    				for(let i = 0; i < result.length; i++) {
    					str += "<option value=" + result[i].categoryNo + ">" + result[i].categoryName + "</option>";
    				}	
    				$("#categoryNo2").html(str);
    				loadData();
    			}
    		});
    		
    		
            
        }

        function closeModal2() {
            updateMenuModal.style.display = 'none';
        }

        updatebutton.addEventListener('click', openModal2);

        // 메뉴 상세정보 모달창
        function openModal3(menuNo) {
            menuDetailModal.style.display = 'block';
            
            $.ajax({
            	url : "${contextPath}/selectDetailMenu",
            	method : 'post',
            	data : {menuNo : menuNo},
            	success : function(data) {
            		$("#deleteMenuNo").val(data.menuNo);
            		$("#modalmenuName").html(data.menuName);
            		$("#modalprice").html(data.price);
            		$("#modalcategory").html(data.categoryName);
            		$("#modalDetail").html(data.menuDetail);
            		$(".menu_detail_img_tol").html("<img class='menu_detail_img' src='" + "${contextPath}" + data.filePath + data.changeName + "'>");
            	}
            });
            
            $.ajax({
                url: "${contextPath}/selectMenuOptionList",
                method: "post",
                data: { menuNo: menuNo },
                success: function (options) {
                    let html = "";

                    if (options.length === 0) {
                        html += "-";
                    } else {
                        for (var i = 0; i < options.length; i++) {
                            html += options[i].optionName;
                            if (i < options.length - 1) {
                                html += ", "; // 마지막 옵션 이름 뒤에는 쉼표를 추가하지 않음
                            }
                        }
                    }

                    $("#modaloption").html(html);
                },
            });
        }

        function closeModal3() {
            menuDetailModal.style.display = 'none';
        }

        menu_img_elements.forEach((menu_img_element) => {
            menu_img_element.addEventListener('click', openModal3);
        });
        
        window.addEventListener('click', (event) => {
            if (event.target === insertMenuModal) {
                closeModal();
            }

            if (event.target === updateMenuModal) {
                closeModal2();
            }

            if (event.target === menuDetailModal) {
                closeModal3();
            }
        });
        
        $("#header-menu").addClass("header_btn_on").removeClass("header_btn");
    </script>

</body>

</html>
