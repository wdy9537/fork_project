<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹점 상세 관리</title>
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
    	min-height: 92vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding-top: 150px;
        padding-bottom: 100px;
    }

    .container{
        background-color: rgba(177, 177, 177, 0.5);
        padding: 40px;
    }

    .title_text{
        font-size: 30px;
        font-weight: bold;
        color: #FF8B3D;
        margin: 40px 0 ;
    }
    
    .store_map_container{
        display: flex;
    }

    table{
        width: 700px;
        height: 400px;
        font-size: 20px;
    }

    th{
        text-align: left;
        padding-right: 30px;
        width: 30%;
    }

    td{
        color: #FF8B3D;
        font-weight: bold;
    }

    .store_map{
        width: 700px; 
        height: 400px;
    }

    #map{
        border: px solid #FF8B3D;
    }

    #store_delete_btn{
        height: 45px; 
        width: 90px; 
        font-size: 17px;
        cursor: pointer;
        background-color: #6a6a6a;
        border: 1px solid #6a6a6a;
        border-radius: 5%;
        color: white;
        margin-top: 30px;
        margin-left: 650px;
    }
    
     /* 파일 다운로드 버튼 */
    .download-btn{
    	cursor: pointer;
    	border: 1px solid #FF8B3D;
    	border-radius: 3px;
    	height: 30px;
    	font-size: 15px;
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
    <div class="container">

        <div class="title_text"><span>가맹점 상세정보</span></div>
        
        <div class="store_map_container">

            <div class="store_info">
                <table>
                    <tr>
                        <th>매장명</th>
                        <td>${member.memberName }</td>
                    </tr>
                    <tr>
                        <th>매장전화번호</th>
                        <td>${member.phone }</td>
                    </tr>
                    <tr>
                        <th>사업자 등록번호</th>
                        <td>${member.fileNo }</td>
                    </tr>
                    <tr>
                        <th>사업자 등록증</th>
                        <td>
                            <button type="button" class="download-btn"
                            onclick="location.href='http://localhost:8082/user/shopDetail/fileDownload/${member.memberNo }'">
                                ${member.fileOriginName} - 다운로드
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td>${member.modifyDate }</td>
                    </tr>
                    <tr>
                        <th>매장주소</th>
                        <td>${member.address }</td>
                    </tr>
                </table>
            </div>

            <div class="store_map">
                <div id="map" style="width: 100%; height: 100%;"></div>
            </div>

        </div>
        
        <div><button type="submit" id="store_delete_btn" onclick="deleteShop(${member.memberNo})">매장삭제</button></div>
    </div>

</div>

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
        var myAddress = ['${member.address}'];
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
    
    <script>
		function deleteShop(no){
			location.href = "${contextPath}/deleteShop/"+no;
		}
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>