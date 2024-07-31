<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>

<!-- 3.x -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>




</head>
<body>
	<div class="container">
		<h1 class="mt-5 mb-4"
			style="text-align: center; text-shadow: 1px 1px 1px black;">신고
			관리 페이지(관리자용)</h1>
		<br> <br>
		<h3>회원 신고 목록</h3>
		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>신고 유형</th>
					<th>회원 번호</th>
					<th>신고 횟수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="report" items="${reports}">
					<c:if test="${report.rep_type eq '회원' }">

						<tr>
							<td><c:out value="${report.rep_type}" /></td>
							<td><c:out value="${report.idx}" /></td>
							<td><c:out value="${report.count}" /></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<form action="/deleteMember" method="post" class="mt-4">
			<button type="submit" class="btn btn-danger">삭제하기</button>
		</form>
		<br>
		<h3>뉴스 신고 목록</h3>
		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>신고 유형</th>
					<th>뉴스 번호</th>
					<th>신고 횟수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="report" items="${reports}">
					<c:if test="${report.rep_type eq '뉴스' }">

						<tr>
							<td><c:out value="${report.rep_type}" /></td>
							<td><c:out value="${report.idx}" /></td>
							<td><c:out value="${report.count}" /></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<form action="/deleteMember" method="post" class="mt-4">
			<button type="submit" class="btn btn-danger">삭제하기</button>
		</form>
		<br>
		<h3>댓글 신고 목록</h3>
		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>신고 유형</th>
					<th>댓글 번호</th>
					<th>신고 횟수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="report" items="${reports}">
					<c:if test="${report.rep_type eq '댓글' }">
						<tr>
							<td><c:out value="${report.rep_type}" /></td>
							<td><c:out value="${report.idx}" /></td>
							<td><c:out value="${report.count}" /></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<form action="/deleteMember" method="post" class="mt-4">
			<button type="submit" class="btn btn-danger">삭제하기</button>
		</form>
	</div>
</body>
</html>
