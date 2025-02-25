<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <style>
        

       body {
             background-image: url('https://images.unsplash.com/photo-1586075010923-2dd4570fb338?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
    background-size: cover; /* 화면 전체를 덮도록 설정 */
    background-position: center; /* 중앙 정렬 */
 font-family: 'Cafe24Ssurround', Arial, sans-serif; /* 정의한 폰트와 대체 폰트 설정 */
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
		

        .form-container {
            margin-top: 100px; /* 상단 여백 조정 */
            padding: 60px;
              background-color: #dcdcdc; /* 배경  */
            border-radius: 20px;
            width: 300px; /* 너비 설정 */
            margin-left: auto;
            margin-right: auto;
        }

        label {
            display: block; /* 라벨을 블록 요소로 설정 */
            margin-top: 15px; /* 라벨과 입력 필드 간의 여백 설정 */
        }

        input {
            width: 100%; /* 입력 필드가 부모 요소의 너비를 가득 채움 */
            padding: 8px; /* 패딩 추가 */
            border: 1px solid #ccc; /* 테두리 설정 */
            border-radius: 5px; /* 모서리 둥글게 */
            margin-bottom: 15px; /* 아래 여백 */
            box-sizing: border-box; /* 패딩과 테두리를 포함하여 계산 */
            font-family: 'Cafe24Ssurround', Arial, sans-serif; /* 정의한 폰트와 대체 폰트 설정 */
        }

        input[type="submit"] {
            background-color: #a0a0a0; /* 버튼 색상 */
            color: white; /* 버튼 텍스트 색상 */
            cursor: pointer; /* 커서 모양 변경 */
            transition: background-color 0.3s; /* 배경 색상 변화 애니메이션 */
        }
input[type="password"] {
    font-family: 'password-font', sans-serif;
    font-size: 18px;
    letter-spacing: 3px; /* 문자 간격을 넓혀서 보기 좋게 설정 */
}

/* `password-font`을 추가하여 모든 문자를 ●로 표시 */
@font-face {
    font-family: 'password-font';
    src: local('Arial'); /* 기본 폰트로 지정하되, 아래 glyph 설정 적용 */
    unicode-range: U+2022; /* 모든 문자를 `●` 유니코드로 표시 */
}

        input[type="submit"]:hover {
            background-color: #FFE6EB; /* 마우스를 올렸을 때 버튼 색상 변화 */
        }
    </style>
</head>
<body>
    <h2></h2>

    <!-- 상단메뉴바 -->
    <div class="menu">
        <nav class="clearfix">
            <ul class="clearfix">
                <li><a href="<c:url value='/country' />">메인</a></li>
              <a href="<c:url value='/post/list' />">게시판</a></li>
                
                <c:if test="${empty loginUser }"> <!-- 로그인 안 됐을 때 -->
		            <li><a href="<c:url value='/member/login' />">로그인</a></li>
		            <li><a href="<c:url value='/member/join' />">회원가입</a></li>
		        </c:if>
            
		        <c:if test="${ not empty loginUser }"> <!-- 로그인 됐을 때 -->
		             <li class="nowpage"><a href="<c:url value='/member/profile' />">${loginUser.id}님의 페이지</a></li>
		            <li><a href="<c:url value='/member/logout' />">로그아웃</a></li>
		        </c:if>
                
            </ul>
        </nav>
    </div>


    <div class="form-container">
        <h2>회원정보 수정</h2>
        <form action="updateForm" method="post">
            <label for="id">아이디</label>
            <input id="id" name="id" value="${loginUser.id }" readonly > <br>

            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="pw" value="${loginUser.pw }" maxlength="20" required> <br>

            <label for="name">이름</label>
            <input id="name" name="name" value="${loginUser.name }" readonly > <br>

            <label for="birth">생년월일</label>
            <input type="date" id="birth" name="birth" value="<fmt:formatDate value="${loginUser.birth }" pattern="yyyy-MM-dd"/>" readonly > <br>

            <label for="gender">성별</label>
            <input id="gender" name="gender" value="${loginUser.gender }" readonly > <br>

            <label for="email">이메일</label>
            <input type="email" id="email" name="email" value="${loginUser.email }" maxlength="50" required> <br>
            
            <label for="passport_number">여권번호</label>
            <input type="text" id="passport_number" name="passport_number" value="${loginUser.passport_number }" maxlength="10" required> <br>

           <input type="submit" value="회원정보 수정" onclick="return confirm('회원정보를 수정하시겠습니까?');">

        </form>
    </div>
</body>
</html>
