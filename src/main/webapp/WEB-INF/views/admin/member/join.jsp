<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원가입</title>
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
            height: 1000px;
            /* 메인 높이를 화면의 80%로 설정 */
            background-color: #e9ecef;
            padding-top: 60px;
        }

        .main-content{
            
            margin: 0 auto;
            padding: 30px;
            
            width: 400px;
           
            border-radius: 8px;
          	background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        

        .form{
            margin-top: 20px;
        }
        
        #submitButton {
            margin-top: 30px;
        }
       
    </style>
</head>
<body>
	<header class="header">
        <!-- <h2>admin/member/join</h2> -->
        <h1>관리자 페이지</h1>
	
		<nav>
			<ul class="nav header-nav">
				<li class="nav-item"><a class="nav-link"  href='<c:url value='/admin' />'>관리자 홈</a></li>
				<li class="nav-item"><a class="nav-link"  href="<c:url value='/country' />">사용자 홈</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/member/join' />">회원가입</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/member/login' />">로그인</a></li>
			</ul>
		</nav>
	</header>
	
	
	<main class="main">
        <div class="main-content">
            <h3>관리자 회원가입</h3>
            <hr>

            <div class="form">
				<!-- 아이디 중복 확인 폼 -->
			    <form  action="<c:url value='/admin/member/idCheck' />" method="get">
			        <label class="form-label" for="id">아이디</label>
			        <div class="input-group">
				        <input class="form-control shadow-sm" type="text" name="id" size="20" id="id" value="${param.id != null ? param.id : ''}" maxlength="20" required>
				        <button class="btn btn-outline-dark shadow-sm" type="submit">중복 확인</button>
			        </div>
			        <span class="form-text" id="idCheckResult">${idCheckResult != null ? idCheckResult : ''}</span>
			    </form>
			    <br>

			    <!-- 회원가입 폼 -->
			    <form action="<c:url value='/admin/member/joinConfirm' />" method="post">
			        <input type="hidden" name="id" value="${param.id}"> <!-- 중복 확인 후 아이디 전달 -->
			        
			        
			        <div class="mb-3">
				        <label class="form-label" for="pwd">비밀번호</label>
				        <input class="form-control shadow-sm" type="password" name="pwd" size="20" id="pwd" maxlength="20" required>
			        </div>
			        
			        <div class="mb-3">
				        <label class="form-label"  for="name">이름</label>
				        <input class="form-control shadow-sm" type="text" name="name" size="20" id="name" maxlength="20" required>
			        </div>
			        
			        <div class="mb-3">
				        <label class="form-label"  for="gender">성별</label>
				        <select class="form-select shadow-sm" id="gender" name="gender">
				            <option value="여자">여자</option>
				            <option value="남자">남자</option>
				        </select>
			        </div>
			        
			        <div class="mb-3">
				        <label class="form-label"  for="part">부서</label>
				        <input class="form-select shadow-sm" type="text" name="part" size="20" id="part" maxlength="20" required>
			        </div>
			        
			        <div class="mb-3">
				        <label class="form-label"  for="email">이메일</label>
				        <input class="form-select shadow-sm" type="email" name="email" size="20" id="email" maxlength="50" placeholder="admin@bob-friend.com" required> 
			        </div>
			        
			        <div class="mb-3">
				        <label class="form-label" for="phone">전화번호</label>
				        <input class="form-select shadow-sm" type="tel" name="phone" size="20" id="phone" maxlength="15" placeholder="010-1234-5678" required> 
			        </div>
			       
			        <div class="gap-2 d-grid ">
				        <input class="btn btn-dark shadow-sm" type="submit" value="회원가입" id="submitButton" ${empty idCheckResult or idCheckResult.contains('중복된 아이디입니다.') ? 'disabled' : ''}> 
				        <input class="btn btn-light shadow-sm" type="reset" value="취소">
			    	</div>
			    </form>
    		</div>
        </div>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>