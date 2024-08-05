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

<script type="text/javascript">

	//정말 삭제할건지 ajax
	function deleteReport(idx, rep_type) {
		if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				url:'${pageContext.request.contextPath}/deleteReport.do',
				type: 'POST',
				data: {
					idx: idx,
					rep_type: rep_type},
					
				success: function(result) {
						alert("삭제 성공!");		
						location.href='${ pageContext.request.contextPath }/report.do';				
				},
				error: function() {
					alert("삭제 실패! 오류 발생");
				}
					
			});
		}
	}

</script>




</head>
<body>
	<div class="container">
		<h1 class="mt-5 mb-4"
			style="text-align: center; text-shadow: 1px 1px 1px black;">신고
			관리 페이지(관리자용)</h1>
		<br> <br>
		<h3>통합 신고 목록</h3>
		<br>
		<span style="font-weight: bold;">&nbsp; ※ 삭제 시 하위 데이터도 같이 삭제됩니다.( 주의. 회원 삭제 시 회원이 쓴 댓글도 삭제됩니다.)&nbsp; ※ 신고받은 건들은 직접 확인하고 삭제 합시다. </span>
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
							onclick="deleteReport('${report.idx}', '${report.rep_type}')">삭제하기</button>
							</td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
	<br><br><br>

		<h3>잠긴 회원 목록</h3>
		<br>
		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
			<tr>
				<th>계정 아이디</th>
				<th>사용자 이름</th>
				<th>전화번호</th>
				<th>회원 분류</th>
				<th>가입 일자</th>
				<th width="120px"></th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${empty lockMemList}">
					<td colspan="6" style="text-align: center; font-size: 24px;">잠긴 회원이 없습니다~!</td>
			</c:if>
			<c:forEach var="m" items="${lockMemList}">
				<tr>
					<td><c:out value="${m.mem_id}" /></td>
					<td><c:out value="${m.mem_name}" /></td>
					<td><c:out value="${m.mem_phone}" /></td>
					<td><c:out value="${m.mem_grade}" /></td>
					<td><c:out value="${m.mem_regdate}" /></td>
					<td style="text-align: center">
						<button type="button" class="btn btn-danger"
								onclick="unlockMember('${m.mem_idx}');">잠금 해제</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

<script>
	function unlockMember(mem_idx) {
		// 잠금 해제 함수.
		$.ajax({
			url:'${pageContext.request.contextPath}/unlockMember.do',
			type: 'POST',
			data: {
				"mem_idx" : mem_idx
				},
			success: function(result) {
				if(result > 0){
					alert("잠금이 해제되었습니다.");
					location.href='${ pageContext.request.contextPath }/report.do';
				} else {
					alert("잠금 해제가 안되었어요ㅠㅠ");
				}
			},
			error: function() {
				alert("잠금 해제 실패! 오류 발생");
			}

		});


	}

</script>



</body>
</html>
