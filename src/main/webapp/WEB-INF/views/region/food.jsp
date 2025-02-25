<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    	
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: black;
        }
        #slide {
            width: 900px;
            height: 500px;
            position: relative;
            overflow: hidden;
            border-radius: 15px;
        }
        .slider-container {
        	display: flex; /* Flexbox 사용 */
            width: 100%;
            height: 100%;
            position: relative;
        }
        .leftBtn, .rightBtn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            z-index: 99;
            cursor: pointer;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            border-radius: 50%;
            padding: 10px;
        }
        .leftBtn {
            left: 5%;
        }
        .rightBtn {
            right: 5%;
        }
        .slider {
            display: flex; /* Flexbox 사용 */
              transition: transform 0.8s ease;        
            height: 100%;
        }
        .fdetail {
            position: relative;
            width: 900px; /* 각 슬라이드의 너비 설정 */
            height: 500px; /* 각 슬라이드의 높이 설정 */
            background-size: cover;
            background-position: center;
        }
         .city {
            color: white;
            position: absolute;
            left: 5%;
            font-family: 'Pretendard-Regular';
        }
        .f_des {
            top: 83%;
            right: 10%;
            position: absolute;
            text-align : right;
            color: white;
            font-family: 'Pretendard-Regular';
        }
        .f_name {
        	color: white;
            position: absolute;
            text-align : right;
			right: 10%;
            top: 50%;   
            font-size: 5em;
            font-family: 'GangwonEduPowerExtraBoldA';
        }
        
        
        #globeViz { 
            width: 100%;
            height: 100vh;
            position: absolute; 
            top: 0;
            left: 0;
            z-index: -2;
        }
        .button-container {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 20px;
        }
        
        .find-friend-button, .back-button {
            padding: 10px 20px;
            font-family: 'Pretendard-Regular';
            border: none;
            border-radius: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            color: black;
            cursor: pointer;
            transition: background-color 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .back-button:hover {
            background-color:#E0805B;
            color: white;
        }
        
        .find-friend-button:hover {
            background-color:#75A6C0;
            color: white;
        }
        
         .bookmark {
		    position: absolute;
		    top: 0;
		    right: 0;
		    width: 0;
		    height: 0;
		    border-top: 70px solid rgba(191, 233, 94, 0.0);
		    border-right: 70px solid  rgba(191, 233, 94, 0.0); /* 오른쪽 변의 색상 */
		    border-bottom: 70px solid transparent;
		    border-left: 70px solid transparent;
		    z-index: 10; /* 다른 요소보다 위에 표시 */
		}
        .heart-btn {
        	position: absolute;
        	top: 11px;
            right: 10px;
        	background-color: rgba(51, 90, 219, 0);
		    border: none;
		    color: red; /* 텍스트 색상 */
		    font-size: 3em; /* 아이콘 크기를 키우기 위해 font-size 조정 */
		    transition: background-color 0.3s;
            z-index: 30; /* 다른 요소보다 위에 표시 */
        }
        
        .heart-btn i {
           
		    font-size: inherit; /* 부모 요소의 font-size를 상속받아 아이콘 크기 조정 */
		}

        /* 하트 버튼에 마우스를 올렸을 때 bookmark 색상 변경 */
		.bookmark:hover, .heart-btn:hover  {
		    border-top-color: rgb(245, 184, 161);
		    border-right-color: rgb(245, 184, 161);
		}
        
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
    </style>
    <script src="https://unpkg.com/globe.gl"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>
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
    <div id="globeViz"></div>
    <div id="slide">
        <div class="slider-container">
            <button class="leftBtn">
                <i class="fa-solid fa-chevron-left"></i>
            </button>
            <div class="slider">
                <c:if test="${not empty foodList}">
                    <c:forEach var="food" items="${foodList}">
                        <div class="fdetail" style="background-image: url('${food.f_img}');" data-foodname="${food.f_name}">
                            <div class="text-wrap">
                                <h5 class="city">${food.city}에서 뭐먹지?</h5>
                                <h1 class="f_name">${food.f_name}</h1>
                                <h3 class="f_des">${food.f_des}</h3>
                                
                                <c:if test="${not empty loginUser }"><!-- 로그인한 상태면 즐겨찾기 가능 -->
                                	
						            <form action="likeFood" method="post" class="heart-form">
						            	<input type="hidden" name="member_id" value="${loginUser.id}">
						            	<input type="hidden" name="f_name" value="${food.f_name}">
						            	<input type="hidden" name="country" value="${param.country}">
						            	<input type="hidden" name="city" value="${param.city}">
						            	
						            	<c:if test="${food.liked}">
										    <div class="bookmark" style="border-top-color: rgb(245, 184, 161); border-right-color: rgb(245, 184, 161);">
										    </div>
										</c:if>
										<c:if test="${not food.liked}">
										    <div class="bookmark">
										    </div>
										</c:if>
									
							            	<button type="submit" class="btn heart-btn">
						                         <c:choose>
										            <c:when test="${food.liked}">
										                <i class="bi bi-heart-fill"></i> <!-- 꽉 찬 하트 -->
										            </c:when>
										            <c:otherwise>
										                <i class="bi bi-heart"></i> <!-- 빈 하트 -->
										            </c:otherwise>
										        </c:choose>
						                    </button>
						         		</form>
						         </c:if>						        
                            </div>                         
                        </div>		                 
                    </c:forEach>
                </c:if>
            </div>
            <button class="rightBtn">
                <i class="fa-solid fa-chevron-right"></i>
            </button>          
        </div>
    </div>
    <div class="button-container">
    	
        <button class="back-button" onclick="location.href='${pageContext.request.contextPath}/city?country=${param.country }'"> 이전화면 </button>
         <button class="find-friend-button" id="friendButton"> 게시판 </button>
    </div>
    
    <script type="module">
    document.addEventListener('DOMContentLoaded', () => {
        const urlParams = new URLSearchParams(window.location.search);
        const country = urlParams.get('country'); // 국가 이름
        const lat = parseFloat(sessionStorage.getItem('lat')); // 이전 화면에서 가져오는 경도와 위도
        const lng = parseFloat(sessionStorage.getItem('lng'));

        // 배경을 확대된 국가로 설정하는 부분
        const world = Globe({ animateIn: true })
            (document.getElementById('globeViz'))
            .globeImageUrl('https://unpkg.com/three-globe/example/img/earth-blue-marble.jpg')

        world.controls().autoRotate = true; // 자동 회전 
        world.controls().autoRotateSpeed = 0.05;
        world.pointOfView({ lat: lat, lng: lng, altitude: 0.5 }, 0); // 국가 확대
      
    });
    </script>
    <script type="module">
	document.addEventListener('DOMContentLoaded', () => {
        const slider = document.querySelector('.slider');
        const slides = document.querySelectorAll('.fdetail');
        const leftBtn = document.querySelector('.leftBtn');
        const rightBtn = document.querySelector('.rightBtn');
		const friendButton = document.getElementById('friendButton');
		
         // 도시 목록에서 음식 목록으로 처음 넘어올 때는 첫 번째 슬라이드로 설정
    let currentIndex = document.referrer.includes('/city') ? 0 : parseInt(localStorage.getItem('currentIndex'), 10) || 0;
	let currentFood;

 	const updateSliderPosition = () => {
    const slideWidth = slides[0].clientWidth;

    var translateXValue = -currentIndex * slideWidth;

    var transformValue = 'translateX(' + translateXValue + 'px)';
    slider.style.transform = transformValue;

    localStorage.setItem('currentIndex', currentIndex);

    // 현재 슬라이드에 맞춰 currentFood 설정
    currentFood = slides[currentIndex].dataset.foodname;
    console.log('현재 음식 이름:', currentFood);
    
    friendButton.onclick = () => {
        window.location.href = 'http://localhost/team_project/post/list?city=&f_name=' + encodeURIComponent(currentFood);
    };
};

$('.heart-btn').click(function(event) {
    event.preventDefault(); // 폼 제출 방지
    const $heartButton = $(this); // 클릭된 버튼을 참조
    console.log('this:', this);
    console.log('jQuery this:', $heartButton);

    const memberId = '${loginUser.id}'; // 로그인한 사용자의 ID

    // currentFood 값 확인
    console.log('AJAX 요청 전 currentFood:', currentFood);
    
    if (!currentFood) {
        console.error('currentFood가 정의되지 않았습니다.');
        return; // currentFood가 정의되지 않았다면 요청을 보내지 않음
    }

   

    $.ajax({
        type: 'POST',
        url: 'likeFood', // 요청할 URL
        data: {
            member_id: memberId,
            f_name: currentFood, // currentFood 사용
            country: '${param.country}',
            city: '${param.city}'
        },

        success: function(response) {

			const currentlyLiked = $heartButton.data('liked') || false; // liked 상태 가져오기
    		console.log('현재 liked 상태:', currentlyLiked);

    		// 새로운 liked 상태 계산
    		const newLikedState = !currentlyLiked; // 새로운 liked 상태
    		console.log('새로운 liked 상태:', newLikedState);

   			// 아이콘 변경
    		$heartButton.html(currentlyLiked ? '<i class="bi bi-heart"></i>' : '<i class="bi bi-heart-fill"></i>'); // 아이콘 변경

    		// liked 상태 반전
    		$heartButton.data('liked', newLikedState); // liked 상태 업데이트
    		console.log('업데이트된 liked 상태:', $heartButton.data('liked')); // 업데이트된 liked 상태 로그
			
        },
        error: function(xhr, status, error) {
            console.error('AJAX 요청 실패:', error);
            console.error('상태:', status);
            console.error('응답:', xhr.responseText);

			   // AJAX 요청 실패 시 원래 상태로 복원
            $heartButton.html(currentlyLiked ? '<i class="bi bi-heart-fill"></i>' : '<i class="bi bi-heart"></i>'); // 원래 상태로 복원
            $heartButton.data('liked', currentlyLiked); // 상태 복원
        }
    });
});

        

        leftBtn.addEventListener('click', () => {
            if (currentIndex > 0) {
                currentIndex--; // 이전 슬라이드로 이동
                //console.log('왼쪽 버튼 클릭, 새로운 인덱스:', currentIndex);
            }else {
        		currentIndex = slides.length - 1; // 마지막 슬라이드로 이동
   			}
				updateSliderPosition();
        });

        rightBtn.addEventListener('click', () => {
            if (currentIndex < slides.length - 1) {
                currentIndex++; // 다음 슬라이드로 이동
                //console.log('오른쪽 버튼 클릭, 새로운 인덱스:', currentIndex);
            }else{
       		 currentIndex = 0; // 첫 번째 슬라이드로 이동
			}
    		updateSliderPosition();
        });

		 
    });


 
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
