<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹점 정보</title>

<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
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
        
    }

    .shop-info-container{
        display: flex;    
        flex-wrap: wrap;
        gap: 50px;
        justify-content: center;
        margin-bottom: 100px;
        
    }

    .shop-info-text{
        font-size: 40px;
        font-weight: bold;
        color: #FF8B3D;
        margin: 70px 0;
        text-align: center;
    }

    .shop-info{
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0 20px;
    }

    .shop-img{
        background-color: rgba(177, 177, 177, 0.5);
        width: 250px;
        height: 250px;
        border-radius: 15%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .shop-img img{
        max-width: 100%; /* 이미지의 최대 너비를 조정하여 이미지가 컨테이너 내에 맞게 표시되도록 설정 */
        max-height: 100%;
        
    }

    .shop-name{
        font-size: 20px;
        font-weight: bold;
        margin-top: 20px;
    }

    

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content">
        <div class="shop-info-text">FORK와 함께하는 고객사</div>
        <div class="shop-info-container">

            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img18.png"></div>
                <div class="shop-name">이바돔감자탕</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img19.png"></div>
                <div class="shop-name">신선설농탕</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img20.png"></div>
                <div class="shop-name">한촌설렁탕</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img21.png"></div>
                <div class="shop-name">김가네김밥</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img23.png"></div>
                <div class="shop-name">BBQ치킨</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img24.png"></div>
                <div class="shop-name">인생설렁탕</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img3.png"></div>
                <div class="shop-name">고기듬뿍 대왕비빔밥</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img4.png"></div>
                <div class="shop-name">처갓집 양념치킨</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img5.png"></div>
                <div class="shop-name">당치땡</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img6.png"></div>
                <div class="shop-name">한신포차</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img30.png"></div>
                <div class="shop-name">범맥주</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img7.png"></div>
                <div class="shop-name">새마을식당</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img10.png"></div>
                <div class="shop-name">인생설렁탕</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img11.png"></div>
                <div class="shop-name">명륜진사갈비</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img12.png"></div>
                <div class="shop-name">원할머니보쌈</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img13.png"></div>
                <div class="shop-name">하남돼지집</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img14.png"></div>
                <div class="shop-name">국수나무</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img15.png"></div>
                <div class="shop-name">포베이</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img16.png"></div>
                <div class="shop-name">채선당</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img17.png"></div>
                <div class="shop-name">본죽</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img8.png"></div>
                <div class="shop-name">한신포차</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img26.png"></div>
                <div class="shop-name">굽네치킨</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img29.png"></div>
                <div class="shop-name">1943</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img27.png"></div>
                <div class="shop-name">샤브향</div>
            </div>
            <div class="shop-info" data-aos="fade-in" data-aos-delay="300">
                <div class="shop-img"><img src="resources/img/shopinfo-img28.png"></div>
                <div class="shop-name">봉추찜닭</div>
            </div>
            
            
            
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- 스크롤이벤트 스크립트 -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>