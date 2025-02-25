<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${country}</title>
    <style>
    	@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		
		}
		@font-face {
		    font-family: 'GangwonEduPowerExtraBoldA';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		
		}
		@font-face {
		    font-family: 'JSongMyung-Regular-KO';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/JSongMyung-Regular-KO.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		
		}
		
		/*사이드바 설정*/	
        .menu { 
            color: white;
           	font-family: 'Pretendard-Regular';
            font-size: 30px;
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 20px;
            z-index: 1001;
        }
		.title {
			font-size: 20px; 
		}
        .side-bar {
            position: fixed;
            right: 0; 
            top: 60px;
            width: 150px;
            max-height: 0; 
            overflow: hidden; 
            color: white;
            background-color: rgba(0, 0, 0, 0.8);
            box-shadow: -2px -2px 5px rgba(0, 0, 0, 0.5);
            z-index: 1000;
            transition: max-height 0.6s ease; 
        }

        .side-bar.visible {
            max-height: 400px; 
        }

        .side-bar .title {
            margin: 0;
			color: #90c0e0;
            text-decoration: underline;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            display: none; 
            z-index: 900; 
        }
        .side-bar p { 
            margin: 18px 0; 
            cursor: pointer; 
            transition: color 0.3s; 
			padding-left: 10px;
        }

        .side-bar p:hover {
            color: #75bff0;
        }
        * {
            box-sizing: border-box;
        }
        
         .side-bar a {
		    color: #ffffff; /* 링크 색상 */
		    text-decoration: none; /* 밑줄 제거 */
		    font-size: 16px; /* 글자 크기 */
		    padding: 10px; /* 여백 */
		    display: block; /* 블록으로 표시하여 전체 너비를 클릭 가능하게 함 */
		    transition: background-color 0.3s; /* 배경색 변화 효과 */
		}
		
		.side-bar a:hover {
		    background-color: rgba(255, 255, 255, 0.2); /* 호버 시 배경색 변화 */
		    color: #75bff0; /* 호버 시 텍스트 색상 변화 */
		}
		
        .material-symbols-outlined menu {
        	font-family: 'GangwonEduPowerExtraBoldA';
        	text-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        	font-size: 40px;
        	top: 20px;
        	margin-bottom: 30px;
        	background: linear-gradient(to top, rgba(191, 255, 161, 0.2) calc(20% + 3px), rgba(191, 255, 161, 0) calc(40% + 3px));
        }
		
		/*제목과 배경지구본 설정*/
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            overflow: hidden; /* 스크롤 방지 */
            position: relative;       
        }
        
        .maintitle {
         	top: 10%;
         	font-family: 'GangwonEduPowerExtraBoldA';
         	font-size: 40px;
         	margin-bottom: 10%;
         	text-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
        }
        #globeViz {
            width: 100%;
            height: 100vh;
            position: absolute; 
            top: 0;
            left: 0;
            z-index: -1;
            
        }
        .content {
            z-index: 1; 
            color: white;
            text-align: center;
            margin: 10px; 
        }
        
        /*도시선택 버튼*/
        .box {
		    display: flex;
		    justify-content: center;
		    width: auto;         
		    min-width: 80px;   
		    margin: 0px 0; 
		    margin-top: 20px;
		    margin-bottom: 30px;     
		    padding: 0 10px;  
		}
        
        .city {
            display: flex;
            align-items: center; 
            justify-content: center; 
            width: auto;         
		    min-width: 90px;
            margin: 10px;
            padding: 15px;
            background-color: #DCDCDC;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            font-family: 'Pretendard-Regular';
            font-size: 1em;
            color: black;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s;
            transition: box-shadow 0.3s;
        }
        .city:hover {
            background-color: #E0805B; /* 마우스 오버 시 배경색 */
            color: white;
        }
        .back-button {
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #75A6C0;
            font-family: 'Pretendard-Regular';
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .back-button:hover {
            background-color: #DCDCDC; /* 마우스 오버 시 색상 변경 */
            color: #4A7691;
        }

        #loading {
            display: flex; 
            position: fixed;
            background: rgba(255, 255, 255, 0.9);
            width: 100%; 
            height: 100%;
            z-index: 2;
            align-items: center;
            justify-content: center; 
        }
        
        /*하단 밥 명언*/
        .bobments {
        position: absolute;
        bottom: 10%; 
        left: 50%;
        transform: translateX(-50%);
        color: white; 
        z-index: 100; 
        font-family: 'JSongMyung-Regular-KO';
        text-align: center;
        font-size: 12px;
    	}        
        
    </style>
    <script src="https://unpkg.com/globe.gl"></script>
</head>
<body>
    <div id="loading">
        <h2>${country}로 떠납니다..</h2>
    </div>

    <div id="globeViz"></div> <!-- 지구본을 표시할 영역 -->

    <div class="content"> <!-- 모든 내용을 포함할 div -->
        <h2 class="maintitle">${country}의 어느 도시로 여행하나요?</h2> <!-- 국가 제목 -->
        <div class="box">
		    <c:forEach var="city" items="${cityList}">
		        <div class="city" onclick="location.href='food?country=${country}&city=${city}'">${city}</div>
		    </c:forEach>
        </div>
    </div>
	
	<!-- 사이드바 -->
    <span class="material-symbols-outlined menu">☰</span>
    <div class="side-bar">
        <div>
            <h2 class="title"> Menu</h2>
            <p id="main"><a href="<c:url value='/country' />">Main</a></p>
            <p id="friend"><a href="<c:url value='/post/list' />" >Friend</a></p> 
            
            <c:if test="${empty loginUser }"> <!-- 로그인 안 됐을 때 -->
            <p id="login"><a href="<c:url value='/member/login' />">Login</a></p> 
            <p id="join"><a href="<c:url value='/member/join' />">Join us</a></p> 
            </c:if>
            
            <c:if test="${ not empty loginUser }"> <!-- 로그인 됐을 때 -->
            <p id="profile"><a href="<c:url value='/member/profile' />">${loginUser.id}'s page</a></p> 
            <p id="logout"><a href="<c:url value='/member/logout' />">Logout</a></p> 
            </c:if>
        </div>
    </div>
    
    <div class="overlay"></div>
     <script>
        const menuBtn = document.querySelector('.menu');
        const sideBar = document.querySelector('.side-bar');
        const overlay = document.querySelector('.overlay');

        menuBtn.addEventListener('click', () => {
            sideBar.classList.add('visible');
            overlay.style.display = 'block';
            menuBtn.style.display = 'none';
        });

        overlay.addEventListener('click', () => {
            closeSidebar();
        });

        
        function closeSidebar() {
            sideBar.classList.remove('visible');
            overlay.style.display = 'none';
            menuBtn.style.display = 'block';
        }
    </script>
  	<!-- <button class="back-button" id="backButton" >지구본으로 돌아가기</button>  -->
	<button class="back-button" onclick="location.href='country'">지구본으로 돌아가기</button> 
    <!-- 지구본 -->
    <script type="module">
        const urlParams = new URLSearchParams(window.location.search);
        const country = urlParams.get('country'); // 국가 이름
        const lat = parseFloat(sessionStorage.getItem('lat')); // 이전 화면에서 가져오는 경도와 위도
        const lng = parseFloat(sessionStorage.getItem('lng'));

        // 배경을 확대된 국가로 설정하는 부분
        const world = Globe({ animateIn: false })
            (document.getElementById('globeViz'))
            .globeImageUrl('https://unpkg.com/three-globe/example/img/earth-blue-marble.jpg')
            .bumpImageUrl('https://unpkg.com/three-globe/example/img/earth-topology.png');

        world.controls().autoRotate = true; // 자동 회전 
        world.controls().autoRotateSpeed = 0.05;
        world.pointOfView({ lat: lat, lng: lng, altitude: 0.5 }, 0); // 국가 확대

        // 1초 후에 로딩 스크린 숨기기
        setTimeout(() => {
            document.getElementById('loading').style.display = 'none';
        }, 1000);

        /* 축소 애니메이션 처리
        document.getElementById('backButton').addEventListener('click', function() {
    	const globe = document.getElementById('globeViz');
   		world.pointOfView({ lat: lat, lng: lng, altitude: 3 }, 1500, { curve: 'easeInOutQuad' });
    
  		 setTimeout(() => {
                window.history.back();
            }, 1500); // 애니메이션 시간과 일치
        }); */

    </script>
</body>
</html>
