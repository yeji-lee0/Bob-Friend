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
    <title>HEY BOB!</title>
    <style>
        * {
            box-sizing: border-box;
        }
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
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            overflow: hidden;
            background: #ffffff;
            justify-content: space-between; /*하단 메뉴바와의 사이 조절*/
        }
        
		/*상단 제목효과*/
		.wrapper { 
            position: absolute;
            left: 35%;
            top: 10%;
            transform: translate(-50%, 0);
            width: 100px;
            height: 70px;
            white-space: nowrap;
            z-index: 1;
        }

        .focus {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-family: Arial;
            text-transform: uppercase;
            letter-spacing: 2px;
            filter: blur(3px);
            font-size: 50px; 
            opacity: 0.5;
            color: #fff;
            z-index: 1;
        }

        .mask {
            position: absolute;
            left: 0px;
            top: -2px;
            width: 100px; 
            font-family: Arial;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 50px;
            clip: rect(0px, 100px, 75px, 0px);
            background: linear-gradient(#fff, #fff 0) no-repeat,
                        linear-gradient(to right, #fff, #fff 0) no-repeat,
                        linear-gradient(to right, #fff, #fff 0) bottom left no-repeat,
                        linear-gradient(to right, #fff, #fff 0) bottom left no-repeat,
                        linear-gradient(#fff, #fff 0) bottom right no-repeat,
                        linear-gradient(#fff, #fff 0) bottom right no-repeat,
                        linear-gradient(#fff, #fff 0) top right no-repeat,
                        linear-gradient(#fff, #fff 0) top right no-repeat;
            background-size: 10px 2px, 2px 10px, 2px 10px, 10px 2px, 2px 10px, 10px 2px, 10px 2px, 2px 10px, 10px 2px;
            color: #fff;
            padding: 5px;
            transform: translateX(0);
            box-sizing: border-box;
            animation: mask 5s ease infinite alternate;
    		animation-iteration-count: 5; /* 어지러워서 5번 반복걸어놓음 */
            z-index: 1;

        }

        .text {
            transform: translateX(0);
            animation: text 5s ease infinite alternate;
            z-index: 1;
			animation-iteration-count: 5; /* 어지러워서 5번 반복걸어놓음 */
        }

        @keyframes mask {
            to {
                transform: translateX(600px); 
            }
        }

        @keyframes text {
            to {
                transform: translateX(-600px);
            }
        }

        #globeViz {
            width: 100%;
            height: 100vh;
            position: absolute; 
            top: 0;
            left: 0;
            z-index: 0;
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

        .side-bar {
            position: fixed;
            right: 0; 
            top: 60px;
            width: 150px;
            max-height: 0; 
            overflow: hidden; 
            color: white;
            background-color: rgba(0, 0, 0, 0.3);
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

        /* 사이드바 항목 스타일 */
        .side-bar p { 
            margin: 18px 0; 
            cursor: pointer; 
            transition: color 0.3s; 
			padding-left: 10px;
        }

        .side-bar p:hover {
            color: #75bff0;
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
        /* 하단 메뉴바 스타일 */
        nav { 
            background-color: rgbargba(0, 0, 0, 0.5);
            color: white;
            text-align: center;
            font-family: 'Pretendard-Regular';
            padding: 10px 0;
            z-index: 1;
			position: fixed;
            bottom: -60px;
			width: 100%;
			transition: bottom 0.3s ease;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 150px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 12px;
        }
        nav ul li a:hover {
            text-decoration: underline;
            
        }
        
        /*하단 밥 명언*/
        .bobments {
        position: absolute;
        bottom: 10%; 
        left: 50%;
        transform: translateX(-50%);
        color: white; 
        z-index: 1; 
        font-family: 'JSongMyung-Regular-KO';
        text-align: center;
        font-size: 12px;
    	}
    </style>
    <script type="module" src="https://unpkg.com/three/build/three.module.js"></script>
    <script type="module" src="https://unpkg.com/globe.gl"></script>
</head>
<body>
	<!-- 제목 -->
	<div class="wrapper">
	    <div class="focus">
	            FIND YOUR BOB FRIEND!
	    </div>
	    <div class="mask">
	    	<div class="text">FIND YOUR BOB FRIEND!</div>
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
    
  <!-- 하단 메뉴바 -->
	<nav>
	    <ul>
	        <c:forEach var="coun" items="${coun }">
	            <li>
	                <a href="city?country=${coun.country}">${coun.country.toUpperCase()}</a>
	            </li>
	        </c:forEach>
	    </ul>
	</nav>
    <script>
    	// 하단 메뉴바가 숨겨져 있다가 나타나게 함
		const nav = document.querySelector('nav');
		
		document.addEventListener('mousemove', (event) => {
		    const windowHeight = window.innerHeight;

		    if (event.clientY > windowHeight - 60) {
		        nav.style.bottom = '0'; // 메뉴바를 나타냄
		    } else {
		        nav.style.bottom = '-60px'; // 메뉴바를 숨김
		    }
		});
		
      
	</script>
    
    <!-- 지구본 설정부분 -->
    <div id="globeViz"></div>
    <div class="wave" id="animatedText"></div>
    <script type="module">
        const world = Globe()(document.getElementById('globeViz'))
            .globeImageUrl('https://unpkg.com/three-globe/example/img/earth-blue-marble.jpg')

        world.controls().autoRotate = true;
        world.controls().autoRotateSpeed = 0.35;

        const gData = [
        <c:forEach var="coun" items="${coun}">
            {
                lat: ${coun.lat},
                lng: ${coun.lng},
                link: 'city?country=${coun.country}',
                name: '${coun.country}'
            }, //원래는 if문써서 맨마지막 객체 뒤에는 쉼표 없게 해야되는데 걍 이대로도 작동되서 안씀
        </c:forEach>
    ];

        world.pointOfView({ lat: 0, lng: 0, altitude: 3 }, 0); 

        world.htmlElementsData(gData)
            .htmlElement(d => {
                const el = document.createElement('div');
                el.classList.add('marker');
                el.innerHTML = `<svg width="20" height="30" viewBox="-4 0 36 36">
                    <path d="M14,0 C21.732,0 28,5.641 28,12.6 C28,23.963 14,36 14,36 C14,36 0,24.064 0,12.6 C0,5.641 6.268,0 14,0 Z" fill="red"></path>
                    <circle fill="black" cx="14" cy="14" r="7"></circle>
                </svg>`;
                el.style['pointer-events'] = 'auto';
                el.style.cursor = 'pointer';

                const nameSpan = document.createElement('span');
                nameSpan.innerText = d.name;
                nameSpan.style.position = 'absolute';
                nameSpan.style.left = '25px';
                nameSpan.style.top = '0';
                nameSpan.style.color = 'white';
                nameSpan.style.fontSize = '0.8rem';
                el.appendChild(nameSpan);

                el.onclick = () => {
                    const lat = d.lat;
                    const lng = d.lng;
                    sessionStorage.setItem('lat', lat);
                    sessionStorage.setItem('lng', lng);
                    world.pointOfView({ lat: d.lat, lng: d.lng, altitude: 0.5 }, 1500, { curve: 'easeInOutQuad' });
                    setTimeout(() => {
                        window.location.href = d.link;
                    }, 1500);
                };

                return el;
            });

    </script>
</body>
</html>
