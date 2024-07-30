<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="insert_form.do">회원가입</a>
	<a href="login_form.do">로그인 페이지</a>
	<!-- c if 를 쓴다. ${user != null}  -->
	<a href="profile.do?mem_idx=${ user.mem_idx }">회원 프로필 페이지</a>
</body>
</html>