<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
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

		nav ul {
			margin: 0 ;
			padding: 0;
			display: flex;
		}

		nav li {
			display: inline-block;
			text-align: center;
			color: white; 
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

        body {
	        background-color: white;
			margin: 0;
			z-index: -1;
			        }
		
		h2 {
			display: flex;
			align-items: center;
			justify-content: center;
			margin-top: 100px;
			margin-bottom: 20px;
			font-family: 'Pretendard-Regular';
			}
			
		/*작성란*/
		.box-container {
			    display: flex;
position: relative;
			    justify-content: center; 
			    align-items: center; 
			    height: auto; 
			width: 100%;
			}
			
		.box-container table {
			display: flex;
			        width: 600px;
			height: 250px;
			        border-collapse: collapse;
			margin-top:0;
			        margin-bottom: 20px;
			border: 1px solid black;
			    }
			
		.box-container th, .box-container td {
			        padding: 20px;
			        border: none;
			        text-align: left;
				color: #75A6C0;
			    }
			
		.box-container th { 
			        background-color: white;
			        text-align: center;
			color: #83a867;
			height: 30px;
			    }
			
		.box-container textarea, .box-container input {
			        width:100%;
			        margin: 0;
			height: 30px;
			    }
		.box-container textarea {
			        height: 100%; 
			    }
			
		/* 등록, 이전 버튼*/
		.button-container {
			display: flex;
			justify-content: center; 
			flex-direction: row; 
			align-items: center; 
			text-align: center;
			gap: 20px; 
			width: 100%;
			font-size: 12px; 
			}
			
		input[type="submit"] {
			    padding: 4px 0px;
			width: 80px;
			height: 30px;
			    border: none; 
			    border-radius: 5px;
			    background-color: #363636; 
			    color: white; 
			    cursor: pointer;
			    transition: background-color 0.3s; 
			    text-decoration: none;
				font-size: 12px; 
				text-align: center;
			}
		.back-button {
			    padding-bottom: 5px;
				width: 80px;
				height: 30px;
			    border: none; 
			    border-radius: 5px;
			    background-color: #363636; 
			    color: white; 
			    cursor: pointer;
			    transition: background-color 0.3s; 
			    text-decoration: none;
				font-size: 12px; 
				text-align: center;
			}
			
		input[type="submit"]:hover, .back-button:hover {
			    background-color: #75A6C0; 
			}

</style>
</head>
<body>
    <div class="box-container">
        <!-- 상단메뉴바 -->
    <div class="menu">
        <nav class="clearfix">
            <ul class="clearfix">
                <li><a href="<c:url value='/country' />">메인</a></li>
                <li><a href="<c:url value='/post/list' />">게시판</a></li>
                <li><a href="<c:url value='/member/profile' />">${loginUser.id}님의 페이지</a></li>
                <li><a href="<c:url value='/member/logout' />">로그아웃</a></li>
            </ul>
            <a id="pull" href="#"></a>
        </nav>
    </div>

		<h2>${city} 게시글 작성하기</h2>
		 <!-- 게시글 정보 테이블 -->
	<div class="box-container">
        <form action="insertForm" method="POST">
        	<input type="hidden" name="writer_id" value="${loginUser.id}"> <br>
            <table>
                <tr>
                    <th>지역</th>
                    <td><input name="city" maxlength="20" required></td>
                    <th>메뉴</th>
                    <td><input name="f_name" maxlength="20" required></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="3" style="text-align: left;"><input name="title" maxlength="20" required style="width: 95%;"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"><textarea name="content" required></textarea></td>
                </tr>
                <tr>
                    <th>항공편명</th>
                    <td colspan="3"><input name="flight_number" placeholder="비행기 티켓에 적힌 항공사 편명을 적어주세요" maxlength="10" required>
                </tr>
            </table>
            <!-- 등록, 이전 버튼 -->
				<div class="button-container">
				    <input type="submit" value="등록" >
				    <a href="#" class="back-button" onclick="history.back()">이전</a>
				</div>
        </form>
        <a href="#" onclick="history.back()">뒤로가기</a>
    </div>
    </div>
</body>
</html>
