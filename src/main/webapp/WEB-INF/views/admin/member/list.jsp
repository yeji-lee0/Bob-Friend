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
	<h2>admin/member/list</h2>
	<p>관리자 목록 페이지</p><%-- superAdmin만 들어올 수 있음 --%>
	<nav>
		<a href="<c:url value='/admin'/>">관리자 홈</a>
		<a href="<c:url value='/country' />">사용자 홈</a>
		<a href="<c:url value='/admin/member/list' />">관리자 목록</a>
		<a href="<c:url value='/admin/member/updateProfile' />">정보수정</a>
		<a href="<c:url value='/admin/member/logout' />">로그아웃</a>
	</nav>
	
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>부서</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>승인여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="admin" items="${admins }">
			<tr >
			<td>${admin.id }</td>
			<td>${admin.name }</td>
			<td>${admin.gender }</td>
			<td>${admin.part }</td>
			<td>${admin.email }</td>
			<td>${admin.phone }</td>
			<td>
				<c:if test="${admin.approval eq 0 }">
					<form action="setApproval" method="post">
						<input type="hidden" name="id" value="${admin.id }">
						<input type="submit" value="승인처리">
					</form>
				</c:if>
				<c:if test="${admin.approval eq 1 }">
					<span>승인완료</span>
				</c:if>
			</td>
			</tr>
		</c:forEach>
		
		</tbody>
		
	<!-- 페이징------------------------------------------------------------------------- -->
	</table>
	
	<c:set var="page" value="${currentPages}" />
    <c:set var="startNum" value="${page-(page-1)%5}"/><!-- 1,6,11,...  -->
    <c:set var="lastNum" value="${totalPages }" />
		
		
		<c:if test="${currentPage > 1}">
	        <a href="?page=${currentPage - 1}&city=${URLEncoder.encode(param.city, 'UTF-8')}&f_name=${URLEncoder.encode(param.f_name, 'UTF-8')}">이전</a>
	   </c:if>
	   
	   <c:forEach var="i" begin="0" end="4" >
						<c:if test="${startNum+i<= lastNum}">
						
						<a style="font: ${(page == startNum+i)?'bold':'' } " 
						href="?page=${startNum+i}">${startNum+i}</a>
						</c:if>
		</c:forEach>
	   
		<c:if test="${currentPage < totalPages}">
	        <a href="?page=${currentPage + 1}">다음</a>
	    </c:if>
</body>
</html>