<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
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

		nav ul {W
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
/*글 수정하기, 글 삭제 링크*/
.edit-delete-links {
display: flex;
    margin-top: 0px; 
    margin-right: 40px;
margin-bottom: 20px;
    text-align: right;
justify-content: flex-end;
 
}
.edit-delete-links a {
    color: black; 
    text-decoration: none; 
    padding: 0px 15px; 
    margin: 0 5px; 
    
}
.edit-delete-links a:hover {
    color: #f2b42e;
    
}
/*게시글 상세, 댓글 목록, 댓글 작성*/
    .box-container { 
        color: black;
        border: none;
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        width: 90%;
        margin: 50px auto;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    .box-container table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    .box-container th, .box-container td { /* 메뉴 표 테두리*/
        padding: 10px;
        border: 3px solid white;
        text-align: left;
	font-color: #75A6C0;
    }

    .box-container th { /*메뉴 표 배경*/
        background-color: white;
        text-align: center;
color: #83a867;
    }

    .box-container textarea, .box-container input {
        width: 100%;
        margin: 10px 0;
    }

    .box-container textarea {
        height: 100px; 
    }

    .box-container input[type="submit"] { /*댓글 추가 버튼*/
        background-color: #666666;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px;
        cursor: pointer;
        width: 100%;
box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
    }

    .box-container input[type="submit"]:hover {
        background-color: #75A6C0;
	color: white;
    }

    /* 댓글 테이블 스타일 */
    .comment-table {
        width: 100%;
        border-collapse: collapse;
    }

    .comment-table th, .comment-table td { /*댓글목록 박스*/
        padding: 10px;
        border-top: 1px solid #ddd; 
border-bottom: 1px solid #ddd;
border-left: none; 
border-right: none;
        text-align: center;
color: black;
    }

    .comment-table th {
        background-color: white;
	border-line: #666666;
    }

    .comment-writer {
        width: 15%; 
    }

    .comment-content {
        width: 40%;
    }

    .comment-timestamp {
        width: 20%; 
    }

    .comment-edit, .comment-delete {
        width: 10%; 
    }

    /* 댓글수정 및 삭제 버튼 스타일 */
    .comment-edit button, .comment-delete input[type="submit"] {
        background-color: white;
        color: black;
        border: solid 1px;
        border-radius: 15px;
        padding: 5px 10px;
        cursor: pointer;
        width: 60px;
position: center;
box-shadow: none;

    }
.comment-delete input[type="submit"] {
        margin-top:23px;

    }

    .comment-edit button:hover, .comment-delete input[type="submit"]:hover {
        background-color: #b3b3b3;
        color: white;
    }

    /* 댓글 수정 폼 스타일 */
    .edit-form {
        display: none;
        width: 300%; 
        padding-top: 10px;
    }

    .edit-form textarea {
        width: 100%;
        height: 100px; 
    }

</style>
</head>
<body>
    <!-- 상단메뉴바 -->
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
    <div class="box-container">

    <h2>${postData.city}에서 함께 먹을 친구</h2>
    <!-- 수정 및 삭제 링크 -->
    <div class="edit-delete-links">
        <a href="update?post_id=${postData.post_id}" ${loginUser.id == postData.writer_id ? '' : 'hidden'}>글 수정하기</a>
        <a href="delete?post_id=${postData.post_id}" ${loginUser.id == postData.writer_id ? '' : 'hidden'} onclick="return confirm('글을 삭제하시겠습니까?');">글 삭제</a>
    </div>

    <!-- 게시글 정보 테이블 -->
<table>
    <tr>
        <th>글번호</th>
        <td>${postData.post_id}</td>
        <th>지역</th>
        <td>${postData.city}</td>
        <th>메뉴</th>
        <td>${postData.f_name}</td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>
      	<!-- 회원 프로필 페이지로 이동 -->
        	<a href="<c:url value='/member/profile'>
        				<c:param name='id' value='${postData.writer_id}' />
        			</c:url>">
        		${postData.writer_id}
       		</a>
        </td>
    </tr>
</table>



    <!-- 제목과 내용 -->
    <table>
        <tr>
            <th>제목</th>
            <td colspan="5" style="width: 80%;">
            <c:if test="${postData.notice eq 1 }">
				<span class="badge rounded-pill text-bg-danger">공지</span> 
			</c:if> 	
            ${postData.title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="5" style="width: 80%;">${postData.content}</td>
        </tr>
    </table>

    <!-- 댓글 목록 -->
    <h3>댓글 목록</h3>
    <table class="comment-table">
        <tr>
            <th class="comment-writer">작성자</th>
            <th class="comment-content">내용</th>
            <th class="comment-timestamp">작성시간 </th>
            <th class="comment-edit">수정</th>
            <th class="comment-delete">삭제</th>
        </tr>
        <c:forEach var="comment" items="${comments}">
            <tr>
                <td class="comment-writer">${comment.writter}</td>
                <td class="comment-content">${comment.content}</td>
                <td class="comment-timestamp"><fmt:formatDate value="${comment.upload_time}" pattern="yyyy-MM-dd" /></td>
                <td class="comment-edit">
                    <button type="button" onclick="toggleEditForm(${comment.comm_id})" ${loginUser.id == comment.writter ? '' : 'hidden'}>수정</button>
                </td>
                <td class="comment-delete">
                    <form action="${pageContext.request.contextPath}/post/deleteComm" method="post" ${loginUser.id == comment.writter ? '' : 'hidden'}>
                        <input type="hidden" name="post_id" value="${postData.post_id}" />
                        <input type="hidden" name="comm_id" value="${comment.comm_id}" />
                        <input type="hidden" name="writter" value="${comment.writter}" />
                        <input type="submit" value="삭제" onclick="return confirm('댓글을 삭제하시겠습니까?');" />
                    </form>
                </td>
            </tr>

 <!-- 댓글 수정 폼 (숨김) -->
        <tr id="edit-form-${comment.comm_id}" class="edit-form">
            <td colspan="5" style="padding: 0; border: none;">
                <form action="commedit" method="post" ${loginUser.id == comment.writter ? '' : 'hidden'} style="width: 100%;">
                    <input type="hidden" name="post_id" value="${postData.post_id}" />
                    <input type="hidden" name="comm_id" value="${comment.comm_id}" />
                    <input type="hidden" name="writter" value="${comment.writter}" />
                    <textarea name="content" required style="width: 270%; height: 150px; padding: 10px; font-size: 16px;"></textarea>
                    <input type="submit" value="수정" onclick="return confirm('수정하시겠습니까?');" style="width: 100%; padding: 10px; background-color: #3C5A91; color: white; border: none; border-radius: 5px; cursor: pointer;" />
                </form>
            </td>
        </tr>


        </c:forEach>
    </table>

    <!-- 댓글 작성 폼 -->
    <h3>댓글 작성</h3>
    <form action="commadd" method="POST">
        <input type="hidden" name="writter" value="${loginUser.id}" />
        <textarea name="content" required></textarea>
        <input type="hidden" name="post_id" value="${postData.post_id}" />
        <input type="submit" value="댓글 추가" />
    </form>
</div>

<script>
    function toggleEditForm(commentId) {
        var form = document.getElementById("edit-form-" + commentId);
        form.style.display = form.style.display === "none" ? "block" : "none";
    }
</script>

</body>
</html>
