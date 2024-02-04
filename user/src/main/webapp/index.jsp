<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fork User Main Choice</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        list-style: none;
        font-family: 'Noto Sans KR', sans-serif; 
    }
    .back{
        background: white;
        background: linear-gradient(rgb(255, 198, 91), white);
        width: 100%;
        min-height: 100vh;
        position: relative;
    }
    .back>div{
        position: absolute;
        left: 50%; top: 50%;
        transform: translate(-50%,-50%)
    }
    .logo { text-align: center; margin-top: -40px;}
    .notice { 
        margin: 0 auto; 
        width: 1000px; 
        height: 60px; 
        background-color: white;
        border-radius: 1.5em;
        border: 2px solid black;
        line-height: 55px;
        padding-left: 24px;
        margin-top: 20px;
        cursor: pointer;
        overflow: hidden;
    }
    .new {
        background-color: red;
        border-radius: 8px;
        color: white;
        text-align: center;
        display: inline-block;
        width: 50px;
        height: 22px;
        line-height: 20px;
    }
    .content{ 
        width: 1000px; 
        margin: 0 auto; 
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
    .content>.con {
        height: 150px;
        border-radius: 1em;
        margin-top: 20px;
        width: 32%;
        color: white;
        font-size: 16pt;
        font-weight: bold;
        padding-top: 20px;
        padding-left: 20px;
        background-repeat: no-repeat;
        background-size: 35%;
        background-position: 90% 50%;
        cursor: pointer;
        
        box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
                    0 2px 0 -1px rgba(0,0,0,0.13), 
                    0 3px 0 -1px rgba(0,0,0,0.08), 
                    0 3px 13px -1px rgba(0,0,0,0.21);
    }
    .content>.con:active, .notice:active, #noticeListModal li:active{
        position: relative;
        top: 1px;
        box-shadow: 0 1px 0 rgba(255,255,255,0.89),0 1px rgba(0,0,0,0.05) inset;
    }
    .content>.con1 { 
        width: 66%; 
        background-color: rgb(237,92,82); 
        background-image: url('/user/resources/img/ready.png'); 
        background-size: 45%;
        background-position: 110% -40px;
    }
    .content>.con2 { 
        background-color: rgb(16,136,230); 
        background-image: url('/user/resources/img/statistics.png'); 
    }
    .content>.con3 { 
        background-color: rgb(146,61,196); 
        background-image: url('/user/resources/img/menu.png'); 
    }
    .content>.con4 { 
        background-color: rgb(0,180,143); 
        background-image: url('/user/resources/img/setting.png'); 
    }
    .content>.con5 { 
        background-color: rgb(235, 146, 63);
        background-image: url('/user/resources/img/qna.png'); 
    }
    #noticeListModal li{background-color: white;}
    #noticeListModal li:hover{
        cursor: pointer;
        background-color: antiquewhite;
    }
    .notice-list>li{
        transition: 0.5s;
    }
    
    .content>.disabled{
    	background-color: lightgray;
        box-shadow: none;
        background-image: none;
        color: black;
        text-decoration: line-through;
    }
    .content>.disabled:active{
        position: unset;
        top: 0px;
        box-shadow: none;
    }
</style>
</head>
<body>
    <div class="back">
        <div>
            <div class="logo">
                <img src="/user/resources/img/fork2.png" width="500px" />
            </div>
            <div class="notice">
                <ul class="notice-list" style="position: relative">
                	<c:if test="${not empty list}">
                	
                		<c:forEach var="notice" items="${list}">
                    		<li onclick="noticeDetail(${notice.noticeNo})">[${notice.noticeCreateDate}] ${notice.noticeTitle}
                    			<c:if test="${notice.newNotice lt 14 }" ><span class="new">new</span></c:if> 
                    		</li>
                		</c:forEach>
					</c:if>
                    <!-- <li>[2023-08-04] Pork 서비스 시작1 <span class="new">new</span></li> -->
                </ul>
            </div>
            <div class="content">
                <div class="con con1" onclick="location.href='salesReady'">영업준비<h6>Sales Ready</h6></div>
                <div class="con con2" onclick="location.href='statistics'">판매집계<h6>Statistics</h6></div>
                <div class="con con3" onclick="location.href='menu'">메뉴<h6>Menu</h6></div>
                <div class="con con4" onclick="location.href='license'">결제<h6>License</h6></div>
                <div class="con con5" onclick="location.href='qna'">상담<h6>QnA</h6></div>
            </div>
        </div>
    </div>

	<div class="modal fade" id="noticeModal">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content ">
				<div class="modal-body">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span>X</span>
					</button>
                    <h6 id="notice_create_date"></h6>
                    <h2 id="notice_title"></h2><br>
                    <span id="notice_content"></span>
                </div>
                <div id="noticeList" class="btn btn-dark" style="margin-left: auto;margin-right: 20px;margin-bottom:20px;">전체보기</div>
			</div>
		</div>
	</div>

	<!-- 팝업 공지사항 리스트 -->
    <div class="modal fade" id="noticeListModal">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content bg-dark" style="min-height: 450px">
				<div class="modal-body">
                    <button class="close text-white" type="button" data-dismiss="modal" aria-label="Close">
                        <span>X</span>
                    </button>
                    <h2 class="text-white">공지사항</h2>
                    <ul id="lists">
                    	<c:if test="${not empty list}">
	                    	<c:forEach var="notice" items="${list}" begin="0" end="4">
	                        	<li class="rounded p-2" style="margin-top: 20px;" onclick="noticeDetail(${notice.noticeNo})">[${notice.noticeCreateDate}] ${notice.noticeTitle} 
	                        		<c:if test="${notice.newNotice lt 14 }" ><span class="new">new</span></c:if>
	                        	</li>
	                    	</c:forEach>
                    	</c:if>
                    </ul>
                </div>
                <div class="modal-fotter">
					<ul class="pagination" style="justify-content: center;">
						<c:forEach var="pageNumber" begin="1" end="${ pi.endPage }">
							<li class="page-item">
								<div class="page-link" onclick="noticePaging(this)">${ pageNumber }</div>
							</li>
						</c:forEach>
                   	</ul>
                </div>
			</div>
		</div>
	</div>
	
	

    <script>
    	function noticeDetail(nno){
    		$('#noticeListModal').modal("hide");
    		const notice_create_date = $('#notice_create_date');
    		const notice_title = $('#notice_title');
    		const notice_content = $('#notice_content');
    		$.ajax({
    			url : `${contextPath}/noticeDetail/\${nno}`,
    			success(notice){
    				notice_create_date.text(notice.noticeCreateDate);
    				notice_title.text(notice.noticeTitle);
    				notice_content.text(notice.noticeContent);
    				$('#noticeModal').modal("show");
    			}
    		})
    	}

        $('#noticeList').click(function(e){
            $('#noticeModal').modal("hide");
			$('#noticeListModal').modal("show");
		});

        $('#lists li').each(function(){
                $(this).click(function(e){
                    $('#noticeListModal').modal("hide");
                    $('#noticeModal').modal("show");
            });
        });

        let height = $(".notice").height();
        const noticeNum = $(".notice-list li").length;
        const maxHeight = height*noticeNum;
        let move = 0;

        function noticeRolling(){
            move += height;
            $(".notice-list").animate({"top":-move},800,function(){
                
                if ( move >= maxHeight ) {
                    $(this).css("top",0);
                    move=0;
                }
                
            })
        }
        $(".notice-list").append($(".notice-list li").first().clone());
        
        setInterval(noticeRolling,2000);
        

        function noticePaging(num){
        	$.ajax({
        		url : "selectNotice",
        		data : { currentPage : $(num).text() },
        		success(notice){
        			let li = "";
        			for (i in notice) {
        				li += `<li class='rounded p-2' style='margin-top: 20px;' onclick='noticeDetail(\${notice[i].noticeNo})'>[\${notice[i].noticeCreateDate}] \${notice[i].noticeTitle}` 
        				if ( notice[i].newNotice < 14 ) {
        					li += ` <span class='new'>new</span>`
        				}
                		li += `</li>`
        			};
        			
        			$("#lists").html(li);
        			
        		}
        	})
        }
        
        if ( ${licenseYN} == 0 ) {
        	$(".con1").addClass(" disabled");
        	$(".con2").addClass(" disabled");
        	$(".con3").addClass(" disabled");
        }
        
    </script>
    
 
</body>
</html>
