<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
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
	height: 800px;
	/* 메인 높이를 화면의 80%로 설정 */
	background-color: #e9ecef;
	padding-top: 60px;
	padding-bottom: 60px;
}

.main-content {
	margin: 0 auto;
	padding: 30px;
	width: 90%;
	border-radius: 8px;
	background-color: white;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.search-form {
	margin-top: 30px;
	margin-bottom: 10px;
}

.search-form input[type="search"] {
	width: 20%;
	height: 30px;
}
/* 페이지 네이션--------------------------- */
.pagination .page-link {
	color: #333;
	/* 기본 글자 색상 */
}

.page-item.active .page-link {
	color: #333;
	/* 활성 페이지 글자 색상 */
	font-weight: bold;
	background-color: #e9ecef;
	/* 활성 페이지 배경색 */
	border-color: transparent;
}
</style>

<script>
	window.onload = function() {
		// 세션에서 에러 메시지 가져오기
		const errorMessage = '${errorMessage}';
		if (errorMessage) {
			alert(errorMessage);
		}
	};
</script>
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
			<h3>게시판 관리</h3>
			<hr>
			<div class="search-form">
				<!-- 검색 폼 -------------------------------------------------------------------->
				<form action="list" method="get"
					class="d-flex justify-content-end gap-2">

					<label class="form-label" for="city">지역</label> <input
						class="form-control" type="search" id="city" name="city" size="20"
						maxlength="20" value="${param.city }"> <label
						class="form-label" for="f_name">메뉴</label> <input
						class="form-control" type="search" id="f_name" name="f_name"
						size="20" maxlength="20" value="${param.f_name }"> <input
						type="submit" class="btn btn-dark btn-sm" value="검색">
				</form>
			</div>
			<!-- 게시글 목록 ---------------------------------------------------------------->
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성시간</th>
					</tr>
				</thead>

				<tbody class="table-group-divider">
					<c:forEach var="post" items="${posts }">
						<tr>
							<td>${post.post_id }</td>
							<td><a href="detail?post_id=${post.post_id}"> 
								<c:if test="${post.notice eq 1 }">
									<span class="badge rounded-pill text-bg-danger">공지</span>
								</c:if> 
								${post.city } ${post.f_name } ${post.title }
								</a>
							</td>
							<td>${post.writer_id }</td>
							<td><fmt:formatDate value="${post.upload_time }"
									pattern="yyyy.MM.dd. HH:mm" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!--페이지 이동  -------------------------------------------------------------------------->


			<c:set var="page" value="${currentPages}" />
			<c:set var="startNum" value="${page-(page-1)%5}" />
			<!-- 1,6,11,...  -->
			<c:set var="lastNum" value="${totalPages }" />

			<div>
				<ul class="pagination">
					<c:if test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="?page=${currentPage - 1}&city=${URLEncoder.encode(param.city, 'UTF-8')}&f_name=${URLEncoder.encode(param.f_name, 'UTF-8')}">
								이전
							</a>
						</li>
					</c:if>

					<c:forEach var="i" begin="0" end="4">
						<c:if test="${startNum+i<= lastNum}">
							<li class="page-item ${(currentPage == startNum+i)?'active' : ''}">
								<a class="page-link" href="?page=${startNum+i}&city=${URLEncoder.encode(param.city, 'UTF-8')}&f_name=${URLEncoder.encode(param.f_name, 'UTF-8')}">
									${startNum+i}
								</a>
							</li>
						</c:if>
					</c:forEach>

					<c:if test="${currentPage < totalPages}">
						<li class="page-item">
							<a class="page-link"
								href="?page=${currentPage + 1}&city=${URLEncoder.encode(param.city, 'UTF-8')}&f_name=${URLEncoder.encode(param.f_name, 'UTF-8')}">
								다음
							</a>
						</li>
					</c:if>
				</ul>

			</div>
			<!--  --------------------------------------------------------------------------------->
			<div class="d-flex justify-content-end">
				<a href="insert" class="btn btn-dark">글쓰기</a>
			</div>
		</div>

	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>