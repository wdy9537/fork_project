<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sales Ready</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- bootstrap js: jquery load 이후에 작성할것.-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
    <link rel="stylesheet" href="resources/css/sales.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="outer">
        <div class="content">
            <c:if test="${not empty structureList}">
                <c:forEach var="struc" items="${structureList}">
                    <c:if test="${struc.strucType eq '계산대'}">
                        <c:set var="struc_class" value="struc_pos" />
                    </c:if>
                    <c:if test="${struc.strucType eq '구조물'}">
                        <c:set var="struc_class" value="struc_structure" />
                    </c:if>
                    <c:if test="${struc.strucType eq '테이블'}">
                        <c:set var="struc_class" value="struc_table" />
                    </c:if>
                    
                    <c:if test="${not empty orderList && struc.kioskNo gt 0}">
                        <c:set var="t" value="참" />
                        <c:forEach var="order" items="${orderList}">
                            <c:if test="${struc.kioskNo eq order.kioskNo }">
                                <c:set var="inMenu" value=" in_menu" />
                            </c:if>
                        </c:forEach> 
                    </c:if>
                    
                    <div class="struc ${struc_class}${inMenu}" id="kiosk${struc.kioskNo}" style="transform: translate3d(${struc.positionX}px, ${struc.positionY}px, 0);" onclick="detail_order('${struc.strucTitle}', ${struc.kioskNo})">
                        <div class="struc_title">${struc.strucTitle}</div>
                        <div></div>
      			        <div class="menus">
                        <c:if test="${inMenu eq ' in_menu'}">
                            <c:set var="price" value="0" />
                           	<c:set var="quantity" value="0" />
                            <c:forEach var="order" items="${orderList}" varStatus="status">
                                <c:if test="${struc.kioskNo eq order.kioskNo && quantity le 3}">
                                    <div class="menu">
                                        <div class="menu_title">${order.menuName}</div>
                                        <div class="menu_cnt">${order.cnt}</div>
                                        <c:set var="price" value="${price + order.price}" />
                                        <c:set var="quantity" value="${quantity + 1}" />
                                    </div>
                                </c:if>                                
                            </c:forEach>
                        </c:if>
                        </div>
			            <div class="menu_footer">
                        <c:if test="${inMenu eq ' in_menu'}">
			                	<div class="menu_more">
	                               	<c:if test="${quantity eq 4}">
					                	…
	                               	</c:if>
			                	</div>
			                	<div class="menu_price">
	                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
	                            </div>
                        </c:if>    
			                </div>        
                    </div>
                    
                    <c:set var="inMenu" value="" />
                </c:forEach>
            </c:if>
            <div class="setting" onclick="location.href='salesSetting'">
                <img src="resources/img/change_setting.png"><br>설정
            </div>
        </div>

    </div>

    <div class="modal fade" id="struc_detail">
        <div class="modal-dialog modal-dialog-centered modal-lg" >
            <div class="modal-content" style="min-height: 400px; border: 0">
                <div class="modal-header" style="border-bottom: none;">
                    <div><h4 class="modal-title" id="struc-title"></h4></div>
                    <div class="total_price">
                        <h4 class="modal-title" id="total-price"></h4>
                    </div>
                  </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer" style="border-top: none;">
                    <input type="hidden" id="kiosk-no" value="" />
                    <button class="btn btn-danger cleartable" id="clear-table">클리어테이블</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 호출 확인 모달 -->
    <!-- <div id="alertPage" class="alertPage" style="display: none;">
        <div class="alertPage-content">
        	번 테이블에서 호출하였습니다.
        	<button class="closebutton" onclick="closeModal()">확인</button>
        </div>
    </div> --> 
    
    <audio id="notificationSound" preload="auto">
    	<source src="resources/audio/call2.mp3" type="audio/mpeg">
	</audio>
    
    <script type="text/javascript" src="resources/js/adminLee.js"></script>
    <script>
        $("#sales-ready").addClass("header_btn_on").removeClass("header_btn");
    </script>
</body>