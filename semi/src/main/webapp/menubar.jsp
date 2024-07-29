<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Global Times</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/menubar.css">


</head>

<body>
	<!-- 해더 메인로고 -->
	<header class="header_container">
		<h1 class="header_h1">
			<img class="main_logo"
				src="${pageContext.request.contextPath}/resources/member/세미로고.png"
				alt="main_logo" onclick="location.href='#'">
		</h1>
		<span class="r_posi">
			<ul class="r_info">
				<li class="r_li"><a href="#" class="r__button">회원가입</a></li>
				<li class="r_li"><a href="#" class="r__button">로그인</a></li>
				<!-- <li class="r_li"><a href="#" class="r__button">신문구독</a></li> -->
			</ul>
		</span>
	</header>


	<!-- 네비바 -->
	<div class="nav_wrapper">
		<nav class="nav_container">
			<ul class="nav_ul_form">
				<!-- TODO : 카테고리 포이치 설정필요 -->
				<li class="dropdown"><a href="#" class="nav_title">정치</a></li>
				<li class="dropdown"><a href="#" class="nav_title">연예</a></li>
				<li class="dropdown"><a href="#" class="nav_title">스포츠</a></li>
				<!-- <li class="dropdown"><a href="#" class="nav_title">공란</a>
				<li class="dropdown"><a href="#" class="nav_title">공란</a>
				<li class="dropdown"><a href="#" class="nav_title">공란</a> -->
			</ul>
		</nav>

	</div>
</body>
</html>
