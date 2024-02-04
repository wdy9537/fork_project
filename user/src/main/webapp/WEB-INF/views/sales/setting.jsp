<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sales Setting</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- bootstrap js: jquery load 이후에 작성할것.-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/sales.css">
    
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="outer">
        
        <div class="content">
            <c:if test="${not empty structureList}">
                <c:forEach var="struc" items="${structureList}">
                    <c:if test="${struc.strucType eq '테이블'}">
                        <c:set var="struc_class" value="struc_table_setting" />
                    </c:if>
                    <c:if test="${struc.strucType eq '계산대'}">
                        <c:set var="struc_class" value="struc_pos_setting" />
                    </c:if>
                    <c:if test="${struc.strucType eq '구조물'}">
                        <c:set var="struc_class" value="struc_structure" />
                    </c:if>
                    <div class="struc ${struc_class}" draggable="true" style="transform: translate3d(${struc.positionX}px, ${struc.positionY}px, 0); z-index: 1">
                        <input type="hidden" id="struc_type" value="${struc.strucType}" />
                        <div class="struc_del" onclick='delItem(this)'>X</div>
                        <input type="text" name="struc_name" value="${struc.strucTitle}" size="10" id="struc_name" /> <br>
                        <c:if test="${struc.strucType eq '테이블'}">
                            <span class="struc_title">기계번호</span> <input type="text" name="kiosk_no" value="${struc.kioskNo}" size="2" id="kiosk_no" />
                        </c:if>
                    </div>
                </c:forEach>
            </c:if>
            
            <div class="setting" onclick="saveStructure();">
                <img src="resources/img/change_save.png"><br>저장
            </div>
            <div class="add-item">
                <span onClick='addItem("table");'>테이블 추가</span> | 
                <span onClick='addItem("pos");'>계산대 추가</span> | 
                <span onClick='addItem("structure");'>구조물 추가</span>
            </div>
        </div>

    </div>
    
    <script type="text/javascript" src="resources/js/adminLee.js"></script>
    <script type="text/javascript" src="resources/js/sales/drag.js"></script>
    <script>
        $("#sales-ready").addClass("header_btn_on").removeClass("header_btn");
    </script>

</body>
</html>