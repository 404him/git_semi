<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글로벌타임즈</title>
<!-- TODO : 제목 과 스타일 영역 -->
<style>

	.main-blank-area {
		width: 20%;
		height: 1px;
		float: left;
	}

	#news-content-area {
		width: 50%;
		float: left;
		margin-bottom: 50px;
	}
	.main-side-area {
		width: 20%;
		float: left;
	}

	.news {
		margin-bottom: 5px;
		margin-top: 5px;
	}

	.hot-news:hover {
		font-weight: bold;
		cursor : pointer;
		background-color: #e8e7e7;
	}

	.news:hover {
		cursor : pointer;
		background-color: #e8e7e7;
	}

	.news-box-area {
	}

	#moreNews {
		cursor : pointer;
		text-align: center;
		font-size: 24px;
		border: solid 3px;
	}
	#moreNews:hover{
		background-color: #e4e4e4;
	}


</style>
</head>

<body>
<!-- TODO : 메뉴바 -->
<jsp:include page="../common/menubar.jsp"/>
<hr>
<div id="content-wrap-area">
	<div class="main-blank-area"></div>

	<div id="news-content-area">

		<div class="news-box-area">
			<h4>♬ 어제의 핫 이슈!</h4>
			<hr>
			<c:if test="${ topList != null }">
				<c:forEach var="top" items="${topList}">
					<c:if test="${ top.title != 'null' and top.url != 'null' }">
						<div class="hot-news" onclick="location.href='${top.url}'">
								<div  style="display: inline-block;">
									<c:set var="noImage" value="${pageContext.request.contextPath}/resources/main/noImage1.png" />
									<img src="${ top.urlToImage != 'null' ? top.urlToImage : noImage }" width="140px;" height="100px;" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/main/noImage1.png';" />
								</div>
							<div style="display: inline-block; width: 60%;">${top.title}</div>
						</div>
						<hr>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
		<br>
		<br>
		<div class="news-box-area">
			<h4>☞ 우리의 최신 뉴스</h4>
			<c:forEach var="news" items="${newsList}">
					<hr>
					<div class="news" onclick="location.href='news/detail.do?news_idx=${news.news_idx}'">
						<div style="width : 20%; display: inline-block;">
							<img src="${news.news_thumbnail_image}" width="160px;" height="120px;" />
						</div>
						<div style="width : 75%; display: inline-block; margin-left: 20px;">
							<span style="font-weight: bold; font-size: 24px;">[${news.category_name}] ${news.news_title}</span>
							<span style="float: right">${fn:substring(news.news_createAt,0,10)}</span>
							<br>
							<span style="float: right;">&nbsp;기자</span>
							<span style="float: right; font-weight: bold;">${news.mem_name}</span>
						</div>
						<div style="text-align: right; padding-right: 20px;">
							<span style="font-size: 14px;">
								조회수 : ${news.news_count} ㅣ 좋아요수 : ${news.news_like_count}
							</span>
						</div>
					</div>
			</c:forEach>
			<hr>
		<br>
		</div>
	</div>
	<!-- TODO : 사이드바 작업할 것. -->
	<div class="main-side-area"></div>



</div>

<!-- TODO : 푸터바 -->
<jsp:include page="../common/footer.jsp"/>


<!-- 회원 프로필 페이지에서 .do?mem_idx=1 이런식으로 비정상 접근 시도시 차단 -->
<script type="text/javascript">

	$(document).ready(function() {

		
		setTimeout(showMessage, 100);

	});

	function showMessage() {

		
		if ("${ param.reason == 'session_timeout'}" == "true") {
			alert("로그아웃되었습니다\n로그인을 다시 해주세요");
		}

		if ("${ param.reason == 'no_idx' }" == "true") {
			alert("비정상적인 접근입니다.")
		}

	}
</script>

</body>
</html>
