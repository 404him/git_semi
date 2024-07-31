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
		<h3>통합 신고 목록</h3>
		<br>
		<span style="font-weight: bold;">&nbsp; ※ 삭제 시 하위 데이터도 같이 삭제됩니다.( 예. 회원 삭제 시 회원이 쓴 댓글도 삭제됩니다.)</span>
		<br><br>

		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>신고 유형</th>
					<th>신고된 유형의 번호</th>
					<th>신고 횟수</th>
					<th width="120px"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="report" items="${reports}">
						<tr>
							<td><c:out value="${report.rep_type}" /></td>
							<td><c:out value="${report.idx}" /></td>
							<td><c:out value="${report.count}" /></td>
							<td style="text-align: center">
							<button type="button" class="btn btn-danger"
							onclick="location.href='${pageContext.request.contextPath}/deleteReport.do?idx=${report.idx}&rep_type=${report.rep_type}'">삭제하기</button>
							</td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
