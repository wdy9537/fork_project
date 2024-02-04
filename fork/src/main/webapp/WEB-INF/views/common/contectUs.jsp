<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CONTECT US</title>
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
            padding-top: 100px;
            padding-bottom: 50px;
            /* display: flex;
            flex-direction: column;
            align-items: center; */
        }

        .contact-us{
            background-color: rgba(177, 177, 177, 0.5);
            padding: 70px 0;
        }

        .contact-us-text{
            font-size: 40px;
            font-weight: bold;
            text-align: center;
            /* color: #FF8B3D; */
            margin: 50px 0;
            
        }

        .cont-list{
            display: flex;
            justify-content: center;
            gap: 5px;
        }

        

        .cont-location,
        .cont-call,
        .cont-mail{
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 400px;
            height: 500px;
            margin: 0;
            border-left: 2px solid rgb(189, 189, 189);
        }

        .no-border {
            border-left: none; /* cont-location의 border 없애기! */
        }

        .cont-location img,
        .cont-call img,
        .cont-mail img{
            height: 70px;
            width: 70px;
            margin: 50px auto;
        }

        

        .visit_us1,
        .call_us1,
        .contact_us1{
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            margin: 0 auto;
        }

        .visit_us2,
        .call_us2,
        .contact_us2{
            font-size: 16px;
            text-align: center;
            margin: 30px auto;
        }

        .visit_us3,
        .call_us3,
        .contact_us3{
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            margin: 30px auto;
            color: #FF8B3D;
        }

       /* 지도부분! */

        .contact-map{
            display: flex;
            flex-direction: column;
            align-items: center;  
            margin: 50px 0;
        }

        .contact-map-text{
            padding-left: 17.5%;
            margin-top: 100px;
            
        }
        .contact-map-text1{
            font-size: 40px;
            font-weight: bold;
            color: #FF8B3D;
        }

        .contact-map-text2{
            font-size: 20px;
            font-weight: bold;
        }

    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content">

        <div class="contact-us">

            <div class="contact-us-text">
                <span>CONTACT US</span>
            </div>

            <div class="cont-list" >

                <div class="cont-location no-border">
                    <img src="resources/img/map.png"><br/>
                    <span class="visit_us1">VISIT US</span><br/>
                    <span class="visit_us2">평일 (09:00 ~ 18:00)</span><br/>
                    <span class="visit_us3">서울 강남구 역삼동 823-24 2층</span><br/>
                </div>
                <div class="cont-call">
                    <img src="resources/img/telephone.png"><br/>
                    <span class="call_us1">CALL US</span><br/>
                    <span class="call_us2">365일 연중무휴 (10:00 ~ 23:00)</span><br/>
                    <span class="call_us3">고객센터: 1207-0718</span>
                </div>
                <div class="cont-mail">
                    <img src="resources/img/email.png"><br/>
                    <span class="contact_us1">CONTACT US</span><br/>
                    <span class="contact_us2">365일 연중무휴 (10:00 ~ 23:00)</span><br/>
                    <span class="contact_us3">이메일: help-fork@gmail.com</span>
                </div>

            </div>
            
            
        </div>

        <div class="contact-map-text">
            <span class="contact-map-text1">오시는 길</span><br/><br/>
            <span class="contact-map-text2">서울 강남구 역삼동 823-24 2층</span>
        </div> 
        <div class="contact-map">   
            
            <div id="map" style="width: 65%; height: 750px;"></div>
        </div>

    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- 카카오 지도 API -->
    <!-- 내 애플리케이션, 앱설정, 플랫폼에서 WEB사이트 도메인 springboot에서 쓸 localhost주소로 새로 등록해야함!
    8083인지 8086인지 까먹음;;;;; -->
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2d6e91a8a2ca7084cc4a15d6a7c3b26b&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center : new daum.maps.LatLng(36.633535, 127.425882), // 지도의 중심좌표
            level : 4
        // 지도의 확대 레벨
        };

        // 지도를 생성합니다    
        var map = new daum.maps.Map(mapContainer, mapOption);
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new daum.maps.services.Geocoder();
        var myAddress = ["강남구 역삼동 823-24" ];
        function myMarker(number, address) {
            // 주소로 좌표를 검색합니다
            geocoder
                    .addressSearch(
                            //'주소',
                            address,
                            function(result, status) {
                                // 정상적으로 검색이 완료됐으면 
                                if (status === daum.maps.services.Status.OK) {
 
                                    var coords = new daum.maps.LatLng(
                                            result[0].y, result[0].x);
 
                                    // 결과값으로 받은 위치를 마커로 표시합니다
                                    var marker = new daum.maps.Marker({
                                        map : map,
                                        position : coords
                                    });
                                    
                                    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                    var content = '<div class="customoverlay">'
                                            + '    <span class="title">'
                                            + '<div style="font-style:normal; color:#FF8B3D; font-weight:bold; font-size:2.0em">'
                                            + '' + '</div>' + '</span>'
                                            + '</div>';
 
                                    // 커스텀 오버레이가 표시될 위치입니다 
                                    var position = new daum.maps.LatLng(
                                            result[0].y, result[0].x);
 
                                    // 커스텀 오버레이를 생성합니다
                                    var customOverlay = new daum.maps.CustomOverlay(
                                            {
                                                map : map,
                                                position : position,
                                                content : content,
                                                yAnchor : 1
                                            });
                                    map.setCenter(coords);
                                }
                            });
        }
 
        for (i = 0; i < myAddress.length; i++) {
            myMarker(i + 1, myAddress[i]);
        }
    </script>
</body>
</html>