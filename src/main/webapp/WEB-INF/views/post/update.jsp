<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 글 수정하기</title>
    <title>나의 글 수정하기</title>
    <style>
        @font-face {
            font-family: 'Cafe24Ssurround';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
            font-weight: normal;
            font-style: normal;
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
		.nowpage{
			background-color: white; 	  
		}
		
		.nowpage a {
		    color: black; 
		    font-weight: bold; 
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

        body {
           background-color: white;
        }

		h2 {
		display: flex;
		align-items: center;
		justify-content: center;
		margin-top: 150px;
		font-family: 'Pretendard-Regular';
		}
		
		/*수정되는 내용의 표 전체를 묶음*/
		.update-box {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		font-family: 'Pretendard-Regular';
		width: 700px;
		
		margin: 40px auto;
		border: 1px solid gray;
		}
		
		label { /*제목들*/
		    display: block; 
		    font-family: 'Pretendard-Regular';
		
		    color: black;
		    margin-top: 15px; 
		    margin-bottom: 5px;
		    font-size: 14px;
		}
		label-input-container {
		    display: flex;
		    flex-direction: column;
		    width: 100%; 
		    margin-bottom: 20px; 
		}
		input[type="text"], textarea {
		    width: 100%;
		height: 80px; 
		    padding: 10px;
		    border: 1px solid #ccc; 
		    border-radius: 5px; 
		    font-family: 'Pretendard-Regular'; 
		    color: black;
		    box-sizing: border-box;
		outline: none;
		}
		input[type="text"]:focus, textarea:focus {
		    border: 1px solid #ccc; 
		    box-shadow: none; 
		}
		
		/*확인, 뒤로가기 버튼*/
		.button-container {
		    position: fixed; 
		    bottom: 300px; 
		    left: 50%;
		    transform: translateX(-50%); 
		    display: flex; 
		    gap: 10px; 
		}
		
		input[type="submit"], .back-button {
		    padding: 10px 20px;
		    border: none; 
		    border-radius: 5px;
		    background-color: #363636; 
		    color: white; 
		    cursor: pointer;
		    transition: background-color 0.3s; 
		    text-decoration: none; 
		}
		
		input[type="submit"]:hover, .back-button:hover {
		    background-color: #75A6C0; 
		}
        /*하단 밥 명언*/
        .bobments {
        display: flex;
        bottom: 30px; 
        position: center;
        transform: translateX(-50%);
        color: #5c5c5c;
        z-index: 100; 
        font-family: 'JSongMyung-Regular-KO';
        text-align: center;
        font-size: 12px;
    	}
    </style>
</head>
<body>
    <h2>게시글 수정하기</h2>

	<div class="menu">
        <nav class="clearfix">
            <ul class="clearfix">
                <li><a href="<c:url value='/country' />">메인</a></li>
                <li class="nowpage"><a href="<c:url value='/post/list' />">게시판</a></li>
                <li><a href="<c:url value='/member/profile' />">${loginUser.id}님의 페이지</a></li>
                <li><a href="<c:url value='/member/logout' />">로그아웃</a></li>
            </ul>
        </nav>
    </div>
    
    
	
	<div class="update-box">
		<form action="updateForm" method="POST">
			<input type="hidden" name="post_id" value="${postData.post_id } ">
	
			<label for="city">지역</label> 
			<input id="city" name="city" value="${postData.city }" maxlength="20" required> 
			
			<label for="f_name">메뉴</label>
			<input id="f_name" name="f_name" value="${postData.f_name }" maxlength="20" required>
	
			<div>
				<label for="title">제목</label> 
				<input id="title" name="title" value="${postData.title }" maxlength="20" required> 
			</div>
			
			<div>
				<label for="content">내용</label>
			
				<div>
					<textarea id="content" cols="70" rows="10" name="content">${postData.content }</textarea>
				</div>
			</div>
			
			<div>
				<label for="flight_number">항공편명</label> 
				<input id="flight_number" name="flight_number" value="${postData.flight_number }" placeholder="비행기 티켓에 적힌 항공사 편명을 적어주세요" maxlength="10" required> 
			</div>
	
			<div class="button-container">
			    <input type="submit" value="수정" onclick="return confirm('글을 수정하시겠습니까?');">
			    <a href="#" class="back-button" onclick="history.back()">뒤로가기</a>
			</div>	
		</form>
	</div>
	
	 <span class="bobments"> "Food is our common ground, a universal experience." _  James Beard</span>
</body>
</html>