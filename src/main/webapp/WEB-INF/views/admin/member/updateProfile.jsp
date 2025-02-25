<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 정보 수정</title>
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

        .header-nav>li:hover .sub-nav {
            display: block;
        }

        .sub-nav {
            padding: 0;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .sub-nav li a {
            padding: 10px 16px;
            /* 여백을 넓혀서 메뉴의 폭을 넓게 보이도록 조정 */
            color: #333;
        }

        .sub-nav li a:hover {
            background-color: #4d4d4d;
            /* 배경색 변경 */
            color: #ffffff;
            /* 글자색 변경 */
        }



        /* 메인-------------------------------------------------------------------------- */
        .main {
            height: 1000px;
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


        .form {
            margin-top: 20px;
        }

        #submitButton {
            margin-top: 30px;
        }
    </style>
</head>
<body>
	<header class="header">

		<h1>관리자 페이지</h1>

		<nav>
			<ul class="nav header-nav">
				<!-- 홈 메뉴 -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">홈</a>
					<ul class=" sub-nav dropdown-menu">
						<li><a class="dropdown-item" href='<c:url value='/admin' />'>관리자
								홈</a></li>
						<li><a class="dropdown-item"
							href="<c:url value='/country' />">사용자 홈</a></li>
					</ul></li>
				<!-- 관리 메뉴 -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">관리</a>
					<ul class="sub-nav dropdown-menu">
						<c:if test="${loginAdmin.id eq 'superAdmin' }">
							<li><a class="dropdown-item"
								href="<c:url value='/admin/manage/adminList' />">관리자 목록</a></li>
						</c:if>
						<li><a class="dropdown-item"
							href="<c:url value='/admin/manage/memberList' />">회원 목록</a></li>
						<li><a class="dropdown-item"
							href="<c:url value='/admin/food' />">국가/음식 관리</a></li>
						<li><a class="dropdown-item"
							href="<c:url value='/admin/post/list' />">게시판 관리</a></li>
					</ul></li>

				<!-- 프로필 메뉴 -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">프로필</a>
					<ul class="sub-nav dropdown-menu">
						<li><a class="dropdown-item"
							href="<c:url value='/admin/member/updateProfile' />">정보 수정</a></li>
						<li><a class="dropdown-item"
							href="<c:url value='/admin/member/logout' />">로그아웃</a></li>
					</ul></li>
			</ul>
		</nav>
	</header>
	
	<main class="main">
        <div class="main-content">
            <h3>관리자 정보 수정</h3>
            <hr>
            <div class="form">
				<form action="updateProfileConfirm" method="post">
					<div class="mb-3">
						<label class="form-label" for="id">아이디</label>
						<input class="form-control-plaintext " id="id" name="id" value="${loginAdmin.id }" maxlength="20" readonly required>
					</div>
					
					<div class="mb-3">
						<label class="form-label" for="pwd">비밀번호</label>
						<input class="form-control shadow-sm" type="password" id="pwd" name="pwd" value="${loginAdmin.pwd }" maxlength="20" required>
					</div>
					
					<div class="mb-3">
						<label class="form-label" for="name">이름</label>
						<input class="form-control shadow-sm" id="name" name="name" value="${loginAdmin.name }" maxlength="20" required>
					</div>
					
					<div class="mb-3">
						<label class="form-label" for="gender">성별</label>
						<input class="form-control-plaintext " id="gender" name="gender" value="${loginAdmin.gender }" readonly required>
					</div>
					
					<div class="mb-3">
						<label class="form-label" for=part>부서</label>
						<input class="form-control shadow-sm" type="text" id="part" name="part" value="${loginAdmin.part }" maxlength="20" required >
					</div>
					
					<div class="mb-3">
						<label class="form-label" for="email">이메일</label>
						<input class="form-control shadow-sm" type="email" id="email" name="email" value="${loginAdmin.email }" maxlength="50" required> 
					</div>
					
					<div class="mb-3">
						<label class="form-label" for="phone">전화번호</label>
						<input class="form-control shadow-sm" type="tel" id="phone" name="phone" value="${loginAdmin.phone }" maxlength="15" required>
					</div>
					
					<input class="btn btn-dark shadow-sm w-100" id="submitButton" type="submit" value="관리자 정보 수정" onclick="return confirm('관리자 정보를 수정하시겠습니까?');">
				</form>
			</div>
		</div>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>