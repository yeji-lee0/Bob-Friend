<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>${empty param.id? loginUser.id: param.id}님의 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
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
        body {
            background-color: white;
            z-index: -1;
        }
		/* 상단 메뉴바 */
		nav {
			font-size: 10pt;
			color:white;
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
		}
		
		.nowpage{
			background-color: white;
			height: 60px; 	  
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
			top: 0;
			z-index: 2;
			box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
		}
		/*제목들*/
		.title {
			display: flex;
		    left: 30px;
		    margin-top: 70px;
		    height: 100px;
		    
		}
		/* 프로필 컨테이너 스타일 */
		.profil {
		    background-color: white;
		    padding: 20px;
		    border-radius: 30px;
		    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); 
		    width: 650px;
		    height: 100px;
		    margin: 100px 40px 50px -30px;
		    font-family: 'Pretendard-Regular';
		    display: flex;
			text-align: left;
		}
		h2 {
			font-family: 'Pretendard-Regular';
			font-size: 30px;
		    margin-top: 20px;
		    margin-left: 50px;
			margin-right: 50px;
			position: relative;
			display: inline-block;
		
		}
		.profil h2 {
		    font-size: 24px;
		    font-weight: bold;
		    color: #3b75b3;
		    margin-bottom: 10px;
		    margin-top: 15px;
		    margin-bottom: 5px;
		}
		
		/* 프로필 항목 스타일 */
		.profil p {
		    font-size: 16px;
		    color: black;
		    line-height: 1.8;
		    margin-top: 35px;
		    margin-bottom: 3px;
		}
		
		/* 성별, 생년월일, 가입일 항목을 구분짓는 스타일 */
		.profil .label {
		    color: #333;
		}
		
		/* 날짜 포맷 스타일 */
		.profil .date {
		    font-style: italic;
		    color: #888;
		    
		}
		/* 링크 스타일 (optional) */
		.profil a {
		    text-decoration: none;
		    color: #4CAF50;
		}
		
		h5 {
			font-family: 'Pretendard-Regular';
			font-size: 9px;
			margin-left: 20px;
			
		}
		h3 {
			font-family: 'Pretendard-Regular', sans-serif; 
		    font-size: 24px;  
		    color: black;  
		    display: flex;
		    text-align: center;  
		    margin-top: 20px; 
		    margin-bottom: 40px;
		    justify-content: center;
		    position: flex;
		    
			
		}
	
		.container { /*좋아요 이미지 슬라이더*/
		    display: flex;
		    justify-content: center;  
		    align-items: center;      
		    height: 300px;
		                
		}
		.d-flex { /*이전, 다음 버튼*/
			background: white;
			display: flex;
		    align-items: center;
		    justify-content: space-between;
			
		}
		#prev, #next {
		    font-size: 24px;
		    background-color: white;
		    color: gray;
		    border: none;
		    padding: 10px;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		    
		}
		#prev:hover, #next:hover {
		    background-color: white;
		    color: #3b75b3;
		    
		}
		#prev:disabled, #next:disabled {
		    background-color: white;
		    cursor: not-allowed;
		    
		}
		
		/*음식 카드*/
		.card { 
		    width: 200px;
		    height: 280px;
		    margin: 10px;
		    border: none;
		    border-radius: 10px;
		    overflow: hidden;
		    transition: transform 0.3s ease;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    margin-bottom: 40px;
		}
		.card-body {
			align-items: center;
			padding: 10px;
			display: flex;
			flex-direction: column;
			justify-content: center;
		
		}
		.card-img-top {
			width: 100%;
			height: 150px;
			object-fit: cover;
			
		}
		.card-body .d-flex {
		    display: flex;
		    flex-direction: column; /* 수직 방향으로 정렬 */
		    align-items: flex-start; /* 왼쪽 정렬 */
		    width: 100%;
		    margin-bottom: 10px;
		}
		
		.heart-form {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    margin-bottom: 7px;
		}
		
		.heart-form button {
		    background-color: transparent;
		    border: none;
		    color: #ff6347;
		    font-size: 20px;
		    cursor: pointer;
		    transition: color 0.3s ease;
		}
		
		.heart-form button:hover {
		    background-color: none;
		}
		
		.card-title {
		    font-size: 16px;
		    margin-left: 10px;
		    color: black;
		    align-items: center;
		    margin-bottom: 10px; /* 카드 제목과 버튼 간 간격 */
		}
		
		.card-body .btn-primary {
		    background-color: #6196cf;
		    border: none;
		    color: white;
		    padding: 6px 12px;
		    font-size: 14px;
		    border-radius: 20px;
		    text-decoration: none;
		    transition: background-color 0.3s ease;
		}
		
		.btn-primary:hover {
		    background-color: #3b75b3;
		}

		
		/*게시글 목록, 댓글목록*/
		.table-container {
		    display: flex;
		    justify-content: center;
		    flex-direction: column;
		    margin-top: 40px;
		    
		}
		table {
		    width: 1300px;
		    border-collapse: collapse;
		    font-family: 'Pretendard-Regular';
		    margin: 40px auto; 
		    
		    
		}
		th { /*테이블 헤더*/
			padding: 12px;
		    text-align: center;
		    border: 1px solid #ddd;
		    background-color: #f2f2f2;
		}
		
		td {/*테이블 데이터*/
			padding: 12px;
		    text-align: center;
		    border: 1px solid #ddd;
		    padding: 12px;
		    text-align: center;
		    border: 1px solid #ddd;
		}
		td a { /*링크 스타일*/
		    text-decoration: none;
		    color: black;
		    transition: color 0.3s ease;
		}
		
		td a:hover {
		    backgound-color: #e3e3e3;
		    
		}
		
		/*게시글 버튼*/
		.pagination {
		    display: flex;
		    justify-content: center; 
		    align-items: center;
		    gap: 10px; 
		    margin: 20px 0;
		}
		
		/* 개별 페이지 링크 스타일 */
		.pagination a {
		    padding: 8px 16px;
		    font-size: 14px;
		    color: #333;
		    text-decoration: none;
		    border-radius: 5px;
		    transition: background-color 0.3s, color 0.3s;
		}
		
		/* 페이지 링크 hover 효과 */
		.pagination a:hover {
		    background-color: #6196cf;
		    color: white;
		}
		
		/* 페이지 번호가 현재 페이지일 때 강조 스타일 */
		.pagination a[style*="bold"] {
		    font-weight: bold;
		    background-color: #6196cf;
		    color: white;
		}
		
		/* "이전", "다음" 버튼 스타일 */
		.pagination a:first-child,
		.pagination a:last-child {
		    font-weight: bold;
		    background-color: #f0f0f0;
		    color: #333;
		    border: 1px solid #ccc;
		    padding: 8px 12px;
		}
		
		/* "이전", "다음" 버튼 hover 효과 */
		.pagination a:first-child:hover,
		.pagination a:last-child:hover {
		    background-color: #6196cf;
		    color: white;
		}
		
		.btns{
			display: flex;
			justify-content: center;
			margin-top: 50px;
			margin-bottom: 50px;
		}
		.btns .btn-primary {
		    background-color: #6196cf;
		    border: none;
		    color: white;
		    padding: 6px 12px;
		    font-size: 14px;
		    border-radius: 20px;
		    text-decoration: none;
		    transition: background-color 0.3s ease;
		}
		.btns .btn-primary:hover {
		    background-color: #3b75b3;
		}

    </style>
    
</head>
<body>
    <!-- 상단메뉴바 -->
    <div class="menu">
        <nav class="clearfix">
            <ul class="clearfix">
                <li><a href="<c:url value='/country' />">메인</a></li>
                <li><a href="<c:url value='/post/list' />">게시판</a></li>
                <li class="nowpage"><a href="<c:url value='/member/profile' />">${loginUser.id}님의 페이지</a></li>
                <li><a href="<c:url value='/member/logout' />">로그아웃</a></li>
            </ul>
        </nav>
    </div>
    
    
    <div class="box-container">
    	<div class="profil">
	     <h2>MY PAGE&nbsp;&nbsp;|</h2>
	     <c:if test="${empty user }">
     		존재하지 않는 회원입니다.
	     </c:if>
	     
	     <c:if test="${not empty user }">
		     ${user.id }님의 프로필
		     <br>
		     성별: ${user.gender }
		     생년월일: <fmt:formatDate value="${user.birth }" pattern="yyyy-**-**"/>
		     가입일: <fmt:formatDate value="${user.reg_date }" pattern="yyyy-MM-dd"/>
	     </c:if>
     	</div>
     
     <!-- 음식 좋아요 목록------------------------------------------------------------------------- -->
     <h3 class="foodlike">♡ LIKE</h3>
     
    <!-- 캐러셀 시작 -->
	<div class="container">
		           
	     <div class=" d-flex ">
	         <button id="prev" class="btn btn-primary" onclick="moveSlide(-1)">◀</button>
	         <div class="d-flex">
	             <c:forEach var="food" items="${likeFoodList }">
	                 <div class="card" >
	                     <img class="card-img-top" alt="${food.f_name }" src="${food.f_img }" >
	                     <div class="card-body">
			             	<form class="heart-form" action="likeFood" method="post" >
	                            <input type="hidden" name="member_id" value="${param.id}">
	                            <input type="hidden" name="f_name" value="${food.f_name}">
	                            <button type="submit" class="btn btn-outline-danger btn-sm me-2">
	                            	<i class="bi bi-heart-fill"></i>
	                            </button>
			                </form>
	                       	<h5 class="card-title">${food.city }의 ${food.f_name }</h5>
	                         
	                         <a href='<c:url value="/post/list">
	                                     <c:param name="f_name" value="${food.f_name }" />
	                                 </c:url>' class="btn btn-primary">Find Friend!
                             </a>
	                     </div>
	                 </div>
	             </c:forEach>
	         </div>
	         <button id="next" class="btn btn-primary" onclick="moveSlide(1)">▶</button>
	     </div>
		        
		</div>

<script>
    let currentIndex = 0;
    const totalCards = document.querySelectorAll('.card').length;
    const cardsPerPage = 4;

    function showCards() {
        // 모든 카드를 숨김
        document.querySelectorAll('.card').forEach((card, index) => {
            card.style.display = (index >= currentIndex && index < currentIndex + cardsPerPage) ? 'block' : 'none';
        });
        
        // 버튼 비활성화 로직
        document.getElementById('nextButton').disabled = (currentIndex + cardsPerPage >= totalCards);
        document.getElementById('prevButton').disabled = (currentIndex === 0);
    }

    function moveSlide(direction) {
        // 다음 버튼이 눌렸을 때 마지막 카드가 보인다면 아무 동작도 하지 않음
        if (direction === 1 && currentIndex + cardsPerPage >= totalCards) {
            return; // 다음 버튼이 눌렸을 때 더 이상 이동하지 않음
        }
        
        currentIndex += direction * cardsPerPage;
        if (currentIndex < 0) {
            currentIndex = 0;
        } else if (currentIndex >= totalCards) {
            currentIndex = totalCards - cardsPerPage;
        }
        showCards();
    }

    // 초기 카드 표시
    showCards();
</script>

<!-- 캐러셀 끝 -->
  
    

	<!-- 글 목록-----------------------------------------------------------------------------------  -->
	<div class="table-container">
		<div class="table-column">
		<h3>게시글 목록</h3>
	
		<table border="1">
			<thead>
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>작성시간</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="post" items="${posts }">
				<tr >
					<td>${post.post_id }</td>
					<td><a href="../post/detail?post_id=${post.post_id}">${post.city } ${post.f_name } ${post.title }</a></td>
					<td><fmt:formatDate value="${post.upload_time }" pattern="yyyy-MM-dd HH:mm"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	<!-- 글 페이징------------------------------------------------------------------------------------------ -->
		<c:set var="p_page" value="${p_currentPages}" />
	    <c:set var="p_startNum" value="${p_page-(p_page-1)%5}"/><!-- 1,6,11,...  -->
	    <c:set var="p_lastNum" value="${p_totalPages }" />
		<div class="pagination">
			
			
			<c:if test="${p_currentPage > 1}">
				<a href="?p_page=${p_currentPage - 1}">이전</a>
			</c:if>
		
			<c:forEach var="i" begin="0" end="4">
				<c:if test="${p_startNum+i<= p_lastNum}">
		
					<a style="font: ${(p_page == p_startNum+i)?'bold;':';' } "
						href="?p_page=${p_startNum+i}&c_page=${param.c_page}">${p_startNum+i}</a>
				</c:if>
			</c:forEach>
		
			<c:if test="${p_currentPage < p_totalPages}">
				<a href="?p_page=${p_currentPage + 1}">다음</a>
			</c:if>
		</div>	
	</div>
	<!-- 댓글 목록-----------------------------------------------------------------------------------  -->

	<div class="table-column">
		<h3>댓글목록</h3>
		
		<table border="1">
			
			<thead>
				<tr>
					<th>글번호</th>
					<th>내용</th>
					<th>작성시간</th>
				</tr>
			</thead>
			
			
			<tbody>
				<c:forEach var="comment" items="${comments }" >
					<tr>
						<td>${comment.post_id }</td>
						<td><a href='../post/detail?post_id=${comment.post_id }'>${comment.content }</a></td>
						<td><fmt:formatDate value="${comment.upload_time }"
								pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	<!-- 댓글 페이징------------------------------------------------------------------------------------------ -->
		<c:set var="c_page" value="${c_currentPages}" />
	    <c:set var="c_startNum" value="${c_page-(c_page-1)%5}"/><!-- 1,6,11,...  -->
	    <c:set var="c_lastNum" value="${c_totalPages }" />
		<div class="pagination">
		
		
			<c:if test="${c_currentPage > 1}">
		        <a href="?c_page=${c_currentPage - 1}">이전</a>
		   	</c:if>
	   
		   <c:forEach var="i" begin="0" end="4" >
				<c:if test="${c_startNum+i<= c_lastNum}">
				
				<a style="font: ${(c_page == c_startNum+i)?'bold;':';' } " 
				href="?c_page=${c_startNum+i}&p_page=${param.p_page}">${c_startNum+i}</a>
				</c:if>
			</c:forEach>
	   
			<c:if test="${c_currentPage < c_totalPages}">
		        <a href="?c_page=${c_currentPage + 1}">다음</a>
		    </c:if>
		</div>  
	</div>	
</div>	
</div>	
	
	
		<c:if test="${loginUser.id == user.id }">
		<div class="btns gap-2">
		    <button class="btn btn-primary" onclick="location.href='profile_update'">회원정보 수정</button>
		    <form action="delete" method="post" onsubmit="return confirm('정말 탈퇴하시겠습니까?');" >
		        <input type="hidden" name="id" value="${loginUser.id}">
		        <input type="submit" value="회원 탈퇴" class="btn btn-primary">
		    </form>
		</div>
		</c:if> 
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>