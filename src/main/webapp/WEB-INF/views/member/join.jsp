<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
     <style>
        

        body {
        background-image: url('https://images.unsplash.com/photo-1586075010923-2dd4570fb338?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
    background-size: cover; /* 화면 전체를 덮도록 설정 */
    background-position: center; /* 중앙 정렬 */
        
     
            font-family: 'Cafe24Ssurround', Arial, sans-serif; /* 정의한 폰트와 대체 폰트 설정 */
            color: black; /* 텍스트 색상 설정 */
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
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start; /* 왼쪽 정렬 */
            margin: 100px auto; /* 상단 여백을 주고 중앙 정렬 */
            padding: 40px;
            background-color: #dcdcdc; /* 배경  */
            border-radius: 10px; /* 모서리를 둥글게 */
            width: 300px; /* 너비 설정 */
        }

        label, h2 {
            margin-top: 15px; /* 라벨과 입력 필드 간의 여백 설정 */
            font-family: 'Cafe24Ssurround', Arial, sans-serif; /* 사용자 정의 폰트 적용 */
        }


        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="email"],
        select {
            width: 95%; /* 입력 필드가 부모 요소의 너비를 가득 채움 */
            margin: 10px 0; /* 상하 여백 */
            padding: 10px; /* 패딩 추가 */
            border-radius: 5px; /* 모서리 둥글게 */
            background-color: rgba(255, 255, 255, 0.8); /* 투명도 있는 배경 (30% 투명) */
       font-family: 'Cafe24Ssurround', Arial, sans-serif; /* 사용자 정의 폰트 적용 */
        }
         input[type="submit"]:hover {
            background-color: #C8D7FF; /* 마우스를 올렸을 때 버튼 색상 변화 */
        }
        #gender {
    width: 102%; /* 원하는 너비로 조정 (예: 50%) */
}
        

button, input[type="submit"], input[type="reset"] {
    width: 48%; /* 버튼 너비 설정 */
    padding: 10px; /* 패딩 설정 */
    margin: 5px 1%; /* 버튼 사이의 간격 */
    border-radius: 5px; /* 모서리 둥글게 */
    border: none; /* 테두리 제거 */
    cursor: pointer; /* 커서 모양 변경 */
    background-color: #a0a0a0; /* 버튼 색상 */
    color: white; /* 버튼 텍스트 색상 */
    font-family: 'Cafe24Ssurround', Arial, sans-serif; /* 사용자 정의 폰트 적용 */
    transition: background-color 0.3s; /* 배경 색상 변화 애니메이션 */
}

button:hover, input[type="submit"]:hover, input[type="reset"]:hover {
    background-color: #FFE6EB; /* 마우스를 올렸을 때 버튼 색상 변화 */
}



        input[type="submit"],
        input[type="reset"] {
            width: 30%; /* 버튼 너비 설정 */
            padding: 10px;
            margin: 5px 1%; /* 버튼 사이의 간격 */
            border-radius: 5px; /* 모서리 둥글게 */
            border: none; /* 테두리 제거 */
            cursor: pointer; /* 커서 모양 변경 */
            font-family: 'Cafe24Ssurround', Arial, sans-serif; /* 사용자 정의 폰트 적용 */
        }

        input[type="submit"],  input[type="reset"] {
            background-color: #a0a0a0; /* 버튼 색상 */
            color: white; /* 버튼 텍스트 색상 */
            width: 48%; /* 버튼 너비 설정 */
            padding: 10px;
            margin: 5px 1%; /* 버튼 사이의 간격 */
            border-radius: 5px; /* 모서리 둥글게 */
            border: none; /* 테두리 제거 */
            cursor: pointer; /* 커서 모양 변경 */
        }
    </style>
</head>
<body>
    <!-- 상단메뉴바 -->
    <div class="menu">
        <nav class="clearfix">
            <ul class="clearfix">
                <li><a href="../country">메인</a></li>
                <li><a href="../post/list">게시판</a></li>
                <li><a href="../member/login">로그인</a></li>
                <li class="nowpage"><a href="../member/join">회원가입</a></li>
            </ul>
        </nav>
    </div>
    
    
    <div class="form-container">
    
    
    
        <h2>회원가입</h2>
        
        <!-- 아이디 중복 확인 폼 -->
        <form id="idCheckForm" action="idCheck" method="get">
            <label for="id">아이디</label>
            <input type="text" name="id" maxlength="20" size="20" id="id" value="${param.id != null ? param.id : ''}" required style="width: 90%;"> <!-- 아이디 입력창 너비 수정 -->
            <button type="submit">중복 확인</button>
            <div>
            	<span id="idCheckResult">${idCheckResult != null ? idCheckResult : ''}</span>
            </div>
        </form>
        <br>

        <!-- 회원가입 폼 -->
        <form action="joinForm" method="post">
            <input type="hidden" name="id" value="${param.id}"> <!-- 중복 확인 후 아이디 전달 -->
            
            <label for="pw">비밀번호</label>
            <input type="password" name="pw" maxlength="20" size="20" id="pw" required>
            
            <label for="name">이름</label>
            <input type="text" name="name" maxlength="30" size="20" id="name" required> <br>
            
            <label for="birth">생년월일</label>
            <input type="date" name="birth" size="20" id="birth" max="9999-12-31" required> <br>
            
            <label for="gender">성별</label>
            <select id="gender" name="gender">
                <option value="여자">여자</option>
                <option value="남자">남자</option>
            </select> <br>
            
            <label for="email">이메일</label>
            <input type="email" name="email" maxlength="50" size="20" id="email" required> <br>
            
            <label for="passport_number ">여권번호</label>
            <input type="text" name="passport_number" maxlength="10" size="10" id="passport_number" required> <br>
            
            <input type="checkbox" id="term" onclick="toggleSubmitButton()" required>
            <label for="term"><a href="javascript:void(0);" onclick="openModal()">개인정보 이용 약관</a>을 읽고 이해했으며, 이에 동의합니다.</label>
           
            
            <div style="display: flex; justify-content: space-between; width: 100%;">
		        <input type="submit" value="확인" id="submitButton" ${empty idCheckResult or idCheckResult.contains('중복된 아이디입니다.') ? 'disabled' : ''}> 
		       <button type="reset" class="custom-button">취소</button>
		    </div>
        </form>
    </div>
    
   <!-- 약관 모달 -->
<div id="termsModal" style="display:none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.7); justify-content: center; align-items: center;">
    <div style="background-color: white; padding: 20px; border-radius: 10px; max-width: 500px; margin: auto;">
        <h2>개인정보 이용 약관</h2>
        <div style="max-height: 300px; overflow-y: auto;">
			<c:import url="terms.jsp" />
			</div>
        <button onclick="closeModal()">닫기</button>
    </div>
</div>

<script>
    function openModal() {
        document.getElementById('termsModal').style.display = 'flex'; // 모달 표시
    }

    function closeModal() {
        document.getElementById('termsModal').style.display = 'none'; // 모달 숨기기
    }
</script>

</body>
</html>
