<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%= request.getContextPath() %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업소개</title>
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

        /* 1번째 사진 */
        .info1-img>img{
            width: 100%;
            height: 500px;
        }

        /* 1번째 텍스트 welcome to fork */
        .info1-text1{
            text-align: center;
            margin-top: 50px;
        }

        .info1-text1>span{
            font-size: 40px;
            font-weight: bold;
        }

        /* 2번째 텍스트 */
        .info1-text2{
            text-align: center;
            margin-top: 30px;
            margin-bottom: 150px;
        }

        .info1-text2>span{
            font-size: 20px;
            font-weight: bold; 
             
        }

        /* 2-1 , 2-3 */
        
        .info2_1-container{
            display: flex;
            background-color: rgba(177, 177, 177, 0.5);
        }

        .info2_1-img{
            width: 50%;
            height: 500px;  
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-right: 50px;
            
        }

        .info2_1-img>img{
            width: 550px;
            height: 350px;
        }

        .info2_1-text span{
            line-height: 2;
        }

        .info2_1-text{
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .info2_1-text span:first-child{
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 20px;
            
        }

        .info2_1-text span:last-child{
            font-size: 20px;
            border-top: 3px solid #FF8B3D;
            padding-top: 20px;
            
        }


        /* 2-2 , 2-4*/
        .info2_2-container{
            display: flex;
        }

        .info2_2-img{
            width: 50%;
            height: 500px;  
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin-left: 50px;
            
        }

        .info2_2-img>img{
            width: 550px;
            height: 350px;
        }

        .info2_2-text{
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: right;
        }

        .info2_2-text span{
            line-height: 2;
        }

        .info2_2-text span:first-child{
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 20px;
            
        }

        .info2_2-text span:last-child{
            font-size: 20px;
            border-top: 3px solid #FF8B3D;
            padding-top: 20px;
            
        }


    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content">
        <div class="comp-info1">
            <div class="info1-img"><img src="resources/img/comp-info3.jpg"></div>
            <div class="info1-text1"><span>WELCOME TO FORK</span></div>
            <div class="info1-text2">
                <span>우리 기업은 자영업자 고객님들과의 <br>
                최적화된 소통과 서비스를 제공하는 기업입니다.
                </span>
            </div>
        </div>

        <div class="comp-info2">
            <div class="info2_1-container" data-aos="fade-in" data-aos-delay="200">
                <div class="info2_1-img"><img src="resources/img/img-3.jpg"></div>
                <div class="info2_1-text">
                    <span>기업소개<br/></span>
                    <span>
                        우리 기업은 자영업자 고객님들과의 최적화된 소통과 서비스를 제공하는 기업입니다.<br/>
                        연중무휴 상담 가능하며, 고객의 다양한 요구에 신속하게 대응합니다.<br/>
                        고객님들과의 원활한 의사소통과 성장을 위해 돕는 것이 우리의 목표입니다.
                    </span>
                </div>
            </div>

            <div class="info2_2-container" data-aos="fade-in" data-aos-delay="300">
                <div class="info2_2-text">
                    <span>고객혜택<br/></span>
                    <span>
                        '1개월 무료 체험'을 통해 먼저 사용해 보실 수 있는 혜택을 제공합니다.<br/>
                        무료로 사용해보시고 결정하세요!<br/>
                    </span>
                </div>
                <div class="info2_2-img"><img src="resources/img/img-4.jpg"></div>
            </div>

            
            <div class="info2_1-container" data-aos="fade-in" data-aos-delay="300">
                <div class="info2_1-img"><img src="resources/img/img-3.jpg"></div>
                <div class="info2_1-text">
                    <span>테이블에서 편하게 주문부터 결제까지<br/></span>
                    <span>
                        외식업과 IT기술이 만나, 자영업자들에게 혁신적인 1위 솔루션을 만들었습니다.<br/>
                        주문부터 결제까지 자동화 시스템을 통한 합리적인 운영으로 가게 매출상승에 기여합니다
                    </span>
                </div>
            </div>


            <div class="info2_2-container" data-aos="fade-in" data-aos-delay="300">
                <div class="info2_2-text">
                    <span>세상에 없던 광고 플렛폼<br/></span>
                    <span>
                        테이블오더를 통해 세상에 없던<br/>
                        테블릿 광고플랫폼을 만들어나갈 예정입니다
                    </span>
                </div>
                <div class="info2_2-img"><img src="resources/img/img-6.jpg"></div>
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