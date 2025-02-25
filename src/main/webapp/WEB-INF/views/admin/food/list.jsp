<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>국가/음식 관리</title>
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
	/* 메인 높이를 화면의 80%로 설정 */
	background-color: #e9ecef;
	padding-top: 60px;
	padding-bottom: 60px;
}

.main-content {
	margin: 0 auto;
	padding: 30px;
	width: 90%;
	min-width: 500px;
	border-radius: 8px;
	background-color: white;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.main-content hr {
	margin-bottom: 30px;
}

.leftsidebar {
	
	min-width: 200px;
	margin-right: 30px;
	border-right: #e9ecef solid 1px;
	padding-right: 5px
}


.gallery {  display: flex;  flex-wrap: wrap; gap: 20px; flex-grow: 1; } 
        .gallery-item { text-align: center; width: 120px; }
        .gallery-item img { width: 100px; height: 100px; object-fit: cover; } /* 이미지 */
        .empty-box {
		    width: 100px; /* 이미지와 동일한 너비 */
		    height: 100px; /* 이미지와 동일한 높이 */
		    border: 2px dashed #007bff; /* 파란색 점선 테두리 */
		    border-radius: 40px; /* 둥근 모서리 */
		    background-color: #f8f9fa; /* 밝은 배경색 */
		    font-size: 3rem; /* 폰트 크기 */
		    color: #007bff; /* 텍스트 색상 */
		    cursor: pointer; /* 커서 포인터로 변경 */
		    
		    transition: background-color 0.3s; /* 배경색 변경 애니메이션 */
		}
		
		.empty-box:hover {
		    background-color: #e2e6ea; /* 마우스 오버 시 배경색 변경 */
		}
        .rounded {
		    border-radius: 40px !important;  /* 부트스트랩과 충돌 */
		}
		.rounded:hover {
		    border: 3px solid dodgerblue; 
		    cursor: pointer; 
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
<!-- 메인----------------------------------------------------------------------------------- -->
	<main class="main">
		<div class="main-content">
			<h3>국가/음식 관리</h3>
			<hr>
			<div class="d-flex justify-content-center">
				<aside class="leftsidebar">
					<h5>국가 목록</h5>
					<ul class="list-unstyled">
						<li>
							<a href="javascript:void(0);" id="allLink">All</a>
						</li>
						<c:forEach var="country" items="${uniqueCountries}">
							<li><strong>${country}</strong>
								<ul class="city-list list-unstyled">
									<c:forEach var="city" items="${countryCitiesMap[country]}">
										<li><a href="javascript:void(0);" class="city-link"
											data-country="${country}" data-city="${city}">${city}</a>
											<button type="button" id="deletelist" class="collapse close"
												data-toggle="modal" data-target="#confirmDeleteCityModal"
												onclick="setDeleteCity('${city}')">
												<span aria-hidden="true">&times;</span>
											</button>
										</li>
									</c:forEach>
								</ul>
							</li>
						</c:forEach>
						
						
						<li>
							<button type="button" class="btn btn-primary w-100"
								data-toggle="modal" data-target="#addRegionModal">
								나라/도시 추가</button>
						</li>
						<li>
							<button type="button" class="btn btn-danger w-100"
								data-toggle="collapse" data-target="#deletelist"
								onclick="toggleDeleteButton(this)">나라/도시 삭제</button>
						</li>
					</ul>
				</aside>

				<div class="gallery  d-flex  justify-content-around" id="foodGallery">
					
					<div class="gallery-item ">
						<div
							class="empty-box d-flex justify-content-center align-items-center rounded "
							data-toggle="modal" data-target="#addFoodModal">
							<span class="h1">+</span>
						</div>
					</div>
					
					<c:forEach var="food" items="${list}">
						<div class="gallery-item" data-country="${food.country}"
							data-city="${food.city}" >
							<form method="post" id="deleteForm_${food.f_name}">
								<input type="hidden" name="f_name" value="${food.f_name}" />
								<button type="button" class="close" data-toggle="modal"
									data-target="#confirmDeleteModal"
									onclick="setDeleteFood('${food.f_name}')">
									<span aria-hidden="true">&times;</span>
								</button>
							</form>
							<div class="d-flex flex-column"  data-toggle="modal" data-target="#editFoodModal"
								onclick="setFoodData('${food.country}', '${food.city}', '${food.f_name}','${food.f_des}','${food.f_img}')">
								<img src="${food.f_img}" class="rounded" alt="${food.f_name}" />
								<p>${food.f_name}</p>
							</div>
						</div><!-- .gallery-item -->
					</c:forEach>
				</div> <!-- gallery -->
			</div><!-- 사이드바+갤러리 -->
		</div><!-- .main-content -->

    </main>
			<!-- 국가 및 도시 추가 모달 -->
			<div class="modal fade" id="addRegionModal" tabindex="-1"
				role="dialog" aria-labelledby="addRegionModalLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="addRegionModalLabel">나라와 도시 추가</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="addregion" method="POST">
								<div class="form-group">
									<label for="country">나라</label> <input type="text"
										class="form-control" id="country" name="country" required>
								</div>
								<div class="form-group">
									<label for="city">도시</label> <input type="text"
										class="form-control" id="city" name="city" required>
								</div>
								<button type="submit" class="btn btn-primary">추가</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 음식 추가 모달 -->
			<div class="modal fade" id="addFoodModal" tabindex="-1" role="dialog"
				aria-labelledby="addFoodModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="addFoodModalLabel">음식 추가</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="addfood" method="POST">
								<div class="form-group">
									<label for="f_name">음식 이름</label> <input type="text"
										class="form-control" id="f_name" name="f_name" required>
								</div>
								<div class="form-group">
									<label for="country">나라</label> <input type="text"
										class="form-control" id="country" name="country" required>
								</div>
								<div class="form-group">
									<label for="city">도시</label> <input type="text"
										class="form-control" id="city" name="city" required>
								</div>
								<button type="submit" class="btn btn-primary">추가</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 음식 수정 모달 -->
			<div class="modal fade" id="editFoodModal" tabindex="-1"
				role="dialog" aria-labelledby="editFoodModalLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="editFoodModalLabel">
								<span id="display_food_name">음식 수정</span>
							</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="editFoodForm" action="updatefood" method="POST">
								<input type="hidden" name="f_name" id="edit_food_name">
								<div class="form-group">
									<label for="edit_country">나라</label> <input type="text"
										class="form-control" id="edit_country" name="country" required>
								</div>
								<div class="form-group">
									<label for="edit_city">도시</label> <input type="text"
										class="form-control" id="edit_city" name="city" required>
								</div>
								<div class="form-group">
									<label for="edit_f_des">상세설명</label> <input type="text"
										class="form-control" id="edit_f_des" name="f_des" required>
								</div>
								<div class="form-group">
									<label for="edit_f_img">이미지url</label> <input type="text"
										class="form-control" id="edit_f_img" name="f_img" required>
								</div>
								<button type="submit" class="btn btn-primary">수정</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!--음식삭제 확인 모달 -->
			<div class="modal fade" id="confirmDeleteModal" tabindex="-1"
				role="dialog" aria-labelledby="confirmDeleteModalLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="confirmDeleteModalLabel">삭제 확인</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">정말 삭제하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<form method="post" action="deletefood">
								<input type="hidden" name="f_name" id="delete_food_name" />
								<button type="submit" class="btn btn-danger">삭제</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--도시 삭제 확인 모달 -->
			<div class="modal fade" id="confirmDeleteCityModal" tabindex="-1"
				role="dialog" aria-labelledby="confirmDeleteCityModalLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="confirmDeleteCityModalLabel">삭제
								확인</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">정말 삭제하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<form method="post" action="deletecity">
								<input type="hidden" name="city" id="delete_city" />
								<button type="submit" class="btn btn-danger">삭제</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<script>

	const foodFilterInit = () => {
	    const cities = document.querySelectorAll('.city-link');

	    document.getElementById('allLink').addEventListener('click', () => {
	        location.reload(); // 페이지 새로고침
	    });
	    
	    cities.forEach(city => {
	        city.addEventListener('click', () => {
	            const selectedCity = city.getAttribute('data-city');

	            // 모든 음식 항목을 가져옵니다.
	            const foodItems = document.querySelectorAll('.gallery-item');

	            foodItems.forEach(item => {
	                const itemCity = item.getAttribute('data-city');

	                // 도시가 선택한 도시와 일치하면 표시, 그렇지 않으면 숨깁니다.
	                if (itemCity === selectedCity) {
	                    item.style.display = 'block'; // 표시
	                } else {
	                    item.style.display = 'none'; // 숨김
	                }
	            });
	        });
	    });
	};

    // 페이지가 로드되면 필터 초기화
    foodFilterInit();
    
    const setFoodData = (country, city, f_name,f_des,f_img) => {
        document.getElementById('edit_country').value = country;
        document.getElementById('edit_city').value = city;
        document.getElementById('edit_food_name').value = f_name;
        document.getElementById('display_food_name').innerText = f_name; // 음식 이름 필드
        document.getElementById('edit_f_des').value = f_des;
        document.getElementById('edit_f_img').value = f_img;
        
    };
    
   const setDeleteFood = (f_name) => {
	   document.getElementById('delete_food_name').value = f_name;
   };
   
   const setDeleteCity = (city) => {
	   document.getElementById('delete_city').value = city;
   };
   
   function toggleDeleteButton(button) {
	    if (button.innerText === "나라/도시 삭제") {
	        button.innerText = "취소";
	        button.classList.remove('btn-danger');
	        button.classList.add('btn-secondary'); // 취소 버튼 색상 변경
	    } else {
	        button.innerText = "나라/도시 삭제";
	        button.classList.remove('btn-secondary');
	        button.classList.add('btn-danger'); // 원래 색상으로 복원
	    }
	}
    </script>
</body>
</html>
