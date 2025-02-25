<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	
<title>게시판 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
	height: auto;
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
	
	<!-- 글 상세 조회 -------------------------------------------------------------->
	<main class="main">
		<div class="main-content">
			<div class="post">
				<h4>${postData.city } / ${postData.f_name }</h4>
				<h4><!-- 제목 -->
					<c:if test="${postData.notice eq 1 }">
						<span class="badge rounded-pill text-bg-danger">공지</span> 
					</c:if> ${postData.title }
				</h4>
				
				<div class="d-flex justify-content-between">
					<div class="d-flex">
			          <div><i class="bi bi-person"></i> ${postData.writer_id }</div>
			          &nbsp;&nbsp;
			          <div><small><i class="bi bi-clock"></i> <fmt:formatDate value="${postData.upload_time }" pattern="yyyy.MM.dd.HH:mm" /></small></div>
			          &nbsp;&nbsp;
			          <div><small><i class="bi bi-airplane"></i> ${postData.flight_number }</small></div>
			        </div>
					<div class="d-flex justify-content-end gap-1">
							<!-- 관리자는 모든 글 삭제 가능 -->
							<a class="btn btn-outline-dark btn-sm" href="update?post_id=${postData.post_id}" ${(loginAdmin.id == postData.writer_id)? '':'hidden' } >
								<i class="bi bi-pencil-square"></i> 수정
							</a>
							<a class="btn btn-outline-dark btn-sm" href="delete?post_id=${postData.post_id}" ${(loginAdmin.id == postData.writer_id or not empty loginAdmin)? '':'hidden' } onclick="return confirm('글을 삭제하시겠습니까?');">
								<i class="bi bi-trash3"></i> 삭제
							</a>
						</div>
				</div>
				
					<hr>
		      <p>${postData.content }<br></p>
		      <hr>
			</div>
	
	

	
	
		
	
		
	<!--댓글 부분  ------------------------------------------------------------------------->
	<div class="comm ">
	
	<table class="table table-sm table-borderless caption-top">
		<caption><i class="bi bi-chat"></i> 댓글</caption>
			
		<c:forEach var="comment" items="${comments }">
		<tr >
				<td><i class="bi bi-person"></i> ${comment.writter }</td>
				<td>${comment.content }</td>
				<td><small><fmt:formatDate value="${comment.upload_time }"
						pattern="yyyy.MM.dd. mm:ss" />
						</small>
				<td>
						<div class="d-flex justify-content-end gap-2">
							 <!-- 수정 버튼 -->
				       <button class="btn btn-outline-dark btn-sm" type="button" onclick="toggleEditForm(${comment.comm_id})" ${(loginAdmin.id == comment.writter) ? '' : 'hidden'}>수정</button>
		
							<!-- 댓글 삭제 폼 -->
							<form action="deleteComm"
								method="post" ${(loginAdmin.id == comment.writter or not empty loginAdmin)? '':'hidden' }>
								<input type="hidden" name="post_id" value="${postData.post_id}" />
								<input type="hidden" name="writter" value="${comment.writter}" />
								<input type="hidden" name="comm_id" value="${comment.comm_id}" />
								<input class="btn btn-outline-dark btn-sm" type="submit" value="삭제"
									onclick="return confirm('댓글을 삭제하시겠습니까?');" />
							</form>
						</div>
				</td>
		</tr>
				
		<tr>
				<td colspan="4">
			    <div id="edit-form-${comment.comm_id}" style="display:none;">
			         <!-- 댓글 수정 폼 (숨김) -->
							<!-- 댓글 수정 폼 -->
							<form action="commedit" method="post"  ${(loginAdmin.id == comment.writter)? '':'hidden' }>
								<input type="hidden" name="post_id" value="${postData.post_id}" />
								<input type="hidden" name="comm_id" value="${comment.comm_id}" />
								<input type="hidden" name="writter" value="${comment.writter}" />
								<div class="input-group input-group-sm">
									<textarea class="flex-fill form-control" name="content" required>${comment.content}</textarea>
									<input  class="btn btn-dark"  type="submit" value="수정"
										onclick="return confirm('수정하시겠습니까?');" />
								</div>
							</form>
						</div>
					</td>
				</tr>
				
			
		</c:forEach>
	

				<tr >
					<td colspan="4">
						<!-- <h3>댓글 작성</h3> -->
						<form action="commadd" method="POST">
							<input type="hidden" name="writter" value="${loginAdmin.id }"  />
							<input type="hidden" name="post_id" value="${postData.post_id}" /> 
							
							<div class="input-group input-group-sm">			
							<textarea class="flex-fill form-control" name="content" required></textarea>
							<input  class="btn btn-dark " type="submit" value="댓글 쓰기" />
							</div>
						</form>
					</td>
				</tr>
			
		</table>
		</div>
	</div>
	
	</main>
	<script>
    function toggleEditForm(commentId) {
        var form = document.getElementById("edit-form-" + commentId);
        if (form.style.display === "none" || form.style.display === "") {
            form.style.display = "block"; // 폼을 보이게 함
        } else {
            form.style.display = "none"; // 폼을 숨김
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>