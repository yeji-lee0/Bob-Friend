<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>main</h2>
	
	<a href="main">메인</a>

	
	<c:choose>
	    <c:when test="${not empty loginUser}">	<!-- 로그인 됐을 때 -->
			<a href="post/list" >게시판 가기</a>
	        <a href="member/profil">${loginUser.id}님의 페이지</a>
	        <a href="member/logout">로그아웃</a>
	        <p>안녕하세요, ${loginUser.id}님!</p>
	    </c:when>
	    <c:otherwise>	<!-- 로그인 안 됐을 때 -->
	        <a href="member/login">로그인</a>
	        <a href="member/join">회원가입</a>
	    </c:otherwise>
	</c:choose>
	<!-- 지구본이 나올 페이지 -->
</body>
</html>