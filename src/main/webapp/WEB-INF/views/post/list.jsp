<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <script>
        window.onload = function() {
            const errorMessage = '${errorMessage}';
            if (errorMessage) {
                alert(errorMessage);
            }
        };
    </script>
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


        .box-container {
            color: black;
            border: none;
            background-color: white; 
            padding: 30px; 
            border-radius: 30px; 
            width: 90%; 
            margin: 20px auto; 
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
            font-family: 'Pretendard-Regular';
        }

        table {
            width: 100%;
            border-collapse: collapse; 
            border-radius: 10px; 
            overflow: hidden; 
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd; 
            text-align: center; 
            border-radius: 5px;
			font-family: 'Pretendard-Regular'; 
			 }
			
			th {
				background-color: rgba(255, 255, 255, 0.4); 
			}
			
			 tr:hover {
			    background-color: #dddddd; 
			 }

		 input[type="submit"] {
			    width: 30px;
				height: 37px;
			    background-color: #dddddd;
			    color: black; 
			    border: none;
			    border-radius: 5px;
			    cursor: pointer;
			    margin: 0;
			    font-family: 'Cafe24Ssurround', Arial, sans-serif; 
			}
			
			.btn {
				background-color: #75A6C0;
				color: white;
				height: 35px;
				align-items: center;
				justify-content: center;
				margin-bottom: 5px;
			}
			
			button: hover, input[type="submit"]:hover, .btn:hover {
			    background-color: #8bbed9; 
			}
	
			/*지역, 메뉴 텍스트*/
			form { 
			    margin: 20px 0;
			    font-family: 'Pretendard-Regular';
			    display: flex;
				color: #262626; 
			    align-items: center; /* 수직 정렬 */
			    gap: 20px; /* 각 요소 간격 설정 */
			}
	
			/*지역 메뉴 인풋*/ 
			input[type="text"], select  { 
			    padding: 5px; 
			    border-radius: 5px; 
			    border: 1px solid #ccc;
			    height: 30px; 
				color: black;
			    flex-grow: 1; 
				margin-top: 20px;
				margin-bottom: 20px;
			}
	
			input[type="search"] { 
			    padding: 5px; 
			    border-radius: 5px; 
			    border: 1px solid #ccc;
			    height: 25px; 
				color: black;
			    flex-grow: 1; 
				margin-top: 20px;
				margin-bottom: 20px;
			}
	
			input[type="submit"] {
			    width: 70px; 
			}
	        input[type="search"] {
	            margin-right: 6px; 
	            padding: 5px;
	            height: 40px; 
	        }
	
			/*이전, 다음 버튼*/
	        .pagination {
	            display: flex;
	            justify-content: center; 
	            margin-top: 20px; 
	        }
	
	        .pagination a {
	            margin: 0 5px; 
	            text-decoration: none; 
	            color: balck; 
	            padding: 5px 10px; 
	            border: none; 
	            border-radius: 5px;
				background-color: #f5f5f5;
				box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2); 
	        
	        .pagination a:hover {
	            background-color: #288CD2; 
	        }
	        

	        /*하단 밥 명언*/
	        .bobments {
	        bottom: 20px;
			left: 50%; 	
	        position: fixed;     
	        color: #5c5c5c;
	        z-index: 100; 
	        font-family: 'JSongMyung-Regular-KO';
	        text-align: center;
	        font-size: 10px;
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

<form action="list" method="get" style="margin-bottom: 20px;">
    <label for="city">지역</label>
    <input type="search" id="city" name="city" value="${param.city}" style="border-radius: 5px; width: 150px;"> <!-- 크기 설정 -->
    
    <label for="f_name">메뉴</label>
    <input type="search" id="f_name" name="f_name" value="${param.f_name}" style="border-radius: 5px; width: 150px;"> <!-- 크기 설정 -->
    
    <input type="submit" class="btn btn-dark btn-sm" value="검색" style="width: 70px;"> <!-- 크기 설정 -->
</form>


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
                <c:forEach var="post" items="${posts}">
                    <tr>
                        <td>${post.post_id}</td>
                        <td><a href="detail?post_id=${post.post_id}" style="text-decoration: none;">
		                        <c:if test="${post.notice eq 1 }">
									<span class="badge rounded-pill text-bg-danger">공지</span> 
								</c:if>
								${post.city } ${post.f_name } ${post.title }
                        	</a>
                       	</td>
                        <td>${post.writer_id}</td>
                        <td><fmt:formatDate value="${post.upload_time}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <c:set var="page" value="${currentPages}" />
        <c:set var="startNum" value="${page - (page - 1) % 5}"/>
        <c:set var="lastNum" value="${totalPages}" />

        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="?page=${currentPage - 1}&city=${URLEncoder.encode(param.city, 'UTF-8')}&f_name=${URLEncoder.encode(param.f_name, 'UTF-8')}">이전</a>
            </c:if>

            <c:forEach var="i" begin="0" end="4">
                <c:if test="${startNum + i <= totalPages}">
                    <a style="font-weight: ${currentPage == startNum + i ? 'bold' : 'normal'};" 
                       href="?page=${startNum + i}&city=${URLEncoder.encode(param.city, 'UTF-8')}&f_name=${URLEncoder.encode(param.f_name, 'UTF-8')}">${startNum + i}</a>
                </c:if>
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <a href="?page=${currentPage + 1}&city=${URLEncoder.encode(param.city, 'UTF-8')}&f_name=${URLEncoder.encode(param.f_name, 'UTF-8')}">다음</a>
            </c:if>
        </div>

        <div style="text-align: right;">
             <a href="insert" class="btn">글쓰기</a>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </div>
<!-- 하단 명언 -->
    <div class="bobments"> "Food is our common ground, a universal experience." _  James Beard</div>
</body>
</html>