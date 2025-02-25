<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 로그인</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html,
        body {
            height: 100%;
            /* 전체 높이 설정 */
        }

        li {
            list-style-type: none;
            padding: 0;
            /* 좌측 여백 제거 */
            margin: 0;
        }

        a {
            text-decoration: none;
            /* 밑줄 제거 */
            color: inherit;
            /* 부모 요소의 텍스트 색상 상속 */
        }

        /* 헤더, 네비-------------------------------------------------------------------------- */
        .header {
            height: 20vh;
            /* 헤더 높이를 화면의 20%로 설정 */
            background-color: #f8f9fa;

            display: flex;
            flex-direction: column;
            justify-content: end;
            align-items: center;

            padding: 0px;
        }

        .header h1 {
            margin-bottom: 20px;
            /* 제목과 네비게이션 사이 간격 */

        }

        .header-nav {
            display: flex;

            gap: 40px;

            padding: 0;
            margin: 0;
        }

        .header-nav>li>a {
            color: #333;
        }

        .header-nav>li:hover {
            color: #333;
        }




        /* 메인-------------------------------------------------------------------------- */
        .main {
            height: 80vh;
            /* 메인 높이를 화면의 80%로 설정 */
            background-color: #e9ecef;
            padding-top: 60px;
            padding-bottom: 60px;
        }

        .main-content {

            margin: 0 auto;
            padding: 30px;

            width: 400px;

            border-radius: 8px;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        form{
            margin-top: 20px;
        }
        #submitButton {
            margin-top: 30px;
        }
    </style>
	<script>
	    // 페이지가 로드될 때 메시지가 있으면 팝업을 띄움
        window.onload = function() {
            var message = '${message}'; // 회원가입 환영 메시지
	        if (message) {
	            alert(message); 
	        }
            const errorMessage = '${errorMessage}';// 세션에서 에러 메시지 가져오기
            if (errorMessage) {
                alert(errorMessage);
            }
        };
    </script>
</head>
<body>
	<header class="header">
        <!-- <h2>admin/member/login</h2> -->
        <h1>관리자 페이지</h1>

		<nav>
			<ul class="nav header-nav">
				<li class="nav-item"><a class="nav-link" href='<c:url value='/admin' />'>관리자 홈</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='/country' />">사용자 홈</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/member/join' />">회원가입</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/member/login' />">로그인</a></li>
			</ul>
		</nav>
	</header>
	
	<main class="main">
        <div class="main-content">
            <h3>관리자 로그인</h3>
            <hr>
			<form action="<c:url value='/admin/member/loginConfirm' />" method="post">
		        <div class="mb-3">
			        <label class="form-label" for="id">아이디</label>
			        <input class="form-control shadow-sm" type="text" name="id" id="id" maxlength="20" required>
		        </div>
				<div class="mb-3">
			        <label class="form-label" for="pwd">비밀번호</label>
			        <input class="form-control shadow-sm" type="password" name="pwd" id="pwd" maxlength="20" required>
				</div>
				
				<c:if test="${not empty loginError}">
		        <p class="form-text" style="color:red;">${loginError}</p>
		    	</c:if>
		    	
		    	<div class=" gap-2 d-grid">
			        <input class="btn btn-dark shadow-sm" type="submit" value="로그인" id="submitButton">
			        <input class="btn btn-light shadow-sm" type="reset" value="취소">
		        </div>
		    </form>
		
		    
    	</div>
    </main>
</body>
</html>