<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        @font-face {
            font-family: 'Cafe24Ssurround';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
		    font-family: 'password-font';
		    src: local('Arial'); 
		    unicode-range: U+2022; /* 모든 문자를 `●` 유니코드로 표시 */
		}
		@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		
		}
		@font-face {
		    font-family: 'JSongMyung-Regular-KO';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/JSongMyung-Regular-KO.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		
		}
		body {
			background-color: white;
		}
		
		/* 상단 메뉴바 */
		nav {
			font-size: 10pt;
			color: white;
			font-family: 'PT Sans', Arial, sans-serif;
			position: fixed;
			top: 0;
			left: 0;
    		right: 0;
			z-index: 100;
			margin: 0;
			padding: 0;
			display: flex;
			justify-content: center;
			white-space: nowrap;
			text-align: center;
		}

		nav ul {
			margin: 0 ;
			padding: 0;
			display: flex;
		}

		nav li {
			display: inline-block;
			text-align: center;
			color: white; 
		}

		nav a {
			line-height: 50px;
			height: 30px;
			padding: 0 120px;
			text-decoration: none;
			color: white;
			text-align: center;
		}

		nav a:hover {
			color : #f2b42e;
		}
		
		.menu { /*메뉴막대 도형*/
			width: 100%;
			height: 50px;
			text-align: center;
			background-color: #363636;
			color: white;
			position: fixed;
			left: 0;
			right: 0;
			top: 0;
			z-index: 2;
			box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
		}
		
		/*비디오와 로그인 화면 묶어놓음*/
		.container {
		    position: relative; 
		    display: flex;
		    flex-direction: row;
		    align-items: center; 
		    justify-content: center; 
		    height: 100vh;
		    font-family: 'Pretendard-Regular';
		}
		.container::after {
		    content: ''; 
		    position: absolute;
		    bottom: 10px; 
		    left: 0;
		    width: 100%; 
		    height: 2px; 
		    background-color: black; 
		}
		.video-container {
		    margin-right: 0;
		}

		video {
		    width: 350px; 
		    height: 300px; 
		    object-fit: cover;
		    opacity: 0.7;
		}
		
		.login-form {
		    padding: 10px;
		    background-color: white;
		    width: 350px; 
		    height: 300px;
		    margin-left: 30px;
		    font-family: 'Pretendard-Regular';
		    background-color: transparent;
		    border: none; 
		}
		
		/* 아이디 라벨 및 입력칸 스타일 */
		#id-label {
		    color: #3C3C8C; 
		    font-family: 'Pretendard-Regular'; 
		    margin-bottom: 10px; 
		   
		}
		
		#id-input {
		    width: 230px;
		    height: 80px; 
		    padding: 5px;
		    border: none;
		    border-radius: 5px; 
		    margin-bottom: 10px; 
		    font-family: 'Pretendard-Regular'; 
		    font-size: 16px; 
		    transition: border-color 0.3s ease;
		    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.2);
		}
		
		#id-input:focus {
		    border: none;
		    outline: none; 
		}
		
		#id-input::placeholder {
		    color: #999;
		}
		
		.inputlog { /*부모요소 때문에 간격을 벌리려면 필수 */
		    display: flex;
		    flex-direction: column; /* 세로로 정렬 */
		    gap: 10px; /* 요소 간격 */
		}
		
		/* 비밀번호 라벨 및 입력칸 스타일 */
		#pw-label {
		    color: #3C3C8C; 
		    font-family: 'Pretendard-Regular'; 
		    margin-bottom: 10px; 
		}
		
		#pw-input {
		    width: 230px;
		    height: 80px; 
		    padding: 5px;
		    border: none;
		    border-radius: 5px; 
		    margin-bottom: 10px; 
		    font-family: 'Pretendard-Regular'; 
		    font-size: 16px; 
		    transition: border-color 0.3s ease;
		    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.2);
		}
		
		#pw-input:focus {
		    border-color: #91c1db; 
		    outline: none; 
		}
		
		#pw-input::placeholder {
		    color: #999; 
		}
		
		/*로그인, 취소 버튼*/
		.button-container {
	    display: flex;
	    justify-content: center;
	    gap: 20px; 
	    margin-left: 170px;
		}
	
		.button-container input {
	    padding: 5px 10px; 
	    font-size: 14px; 
	    border: none;
	    width: 100px; 
	    border-radius: 5px; 
	    cursor: pointer; 
	    transition: background-color 0.3s; /
		}
	
		.button-container input[type="submit"] {
	    background-color: #DCDCDC;
	    margin-bottom: 5px;
	    text-align: center;
	    width: 70px;
	    height: 30px; 
	    color: black; 
		}
	
		.button-container input[type="reset"] {
	    background-color: #DCDCDC;
	    text-align: center;
	    margin-bottom: 5px;
	    width: 70px;
	    height: 30px; 
	    color: black; 
		}
	
		.button-container input:hover {
		background-color: #8bbed9; 
        color: white;
	    opacity: 0.9; 
		}
		
        /*하단 밥 명언*/
        .bobments {
        display: absolute;
        bottom: 50%; 
        position: center;
        transform: translateX(-50%);
        color: #5c5c5c;
        z-index: 100; 
        font-family: 'JSongMyung-Regular-KO';
        text-align: center;
        font-size: 12px;
    	}
    </style>
    <script>
        window.onload = function() {
            var message = '${message}'; // 회원가입 환영 메시지
            if (message) {
                alert(message); 
            }
            const errorMessage = '${errorMessage}'; // 세션에서 에러 메시지 가져오기
            if (errorMessage) {
                alert(errorMessage);
            }
        };
    </script>
</head>
<body>
    <!-- 상단메뉴바 -->
    <div class="menu">
        <nav class="clearfix">
            <ul class="clearfix">
                <li><a href="../country">메인</a></li>
                <li><a href="../post/list">게시판</a></li>
                <li><a href="../member/login">로그인</a></li>
                <li><a href="../member/join">회원가입</a></li>
            </ul>
        </nav>
    </div>
	<div class="container">
		<div class="video-container">
		        <video autoplay loop muted preload="metadata">
		            <source src="https://cdn.pixabay.com/video/2024/08/26/228263_large.mp4" type="video/mp4">
		            <source src="https://example.com/video.webm" type="video/webm">
		        </video>
		</div>
	
	    <form class="login-form" action="../member/loginCheck" method="post">
	        <div class="inputlog">
	        	<h2>로그인</h2>   
		        <label for="id">아이디</label>
		        <input type="text" name="id" id="id" required><br>
		
		        <label for="pw">비밀번호</label>
		        <input type="password" name="pw" id="pw" required><br>
    <c:if test="${not empty loginError}">
        <p class="error-message">${loginError}</p> <!-- 오류 메시지 -->
    </c:if>
			</div>
			
	        <div class="button-container">
	            <input type="submit" value="로그인">
	            <input type="reset" value="취소">
	        </div>
	    </form>
	</div>
   <span class="bobments"> "Food is our common ground, a universal experience." _  James Beard</span> 
</body>
</html>
