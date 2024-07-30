<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글로벌타임즈</title>
<!-- TODO : 제목 과 스타일 영역 -->
<style>

	.main-blank-area {
		width: 20%;
		border: 1px solid red;
		float: left;
	}

	#news-content-area {
		width: 50%;
		border: 1px solid blue;
		float: left;
	}
	.main-side-area {
		width: 20%;
		border: 1px solid red;
		float: left;
	}

	.news {
		margin-bottom: 5px;
		margin-top: 5px;
	}
	.news:hover {
		font-weight: bold;
		cursor : pointer;
		background-color: #e8e7e7;
	}

	.news-box-area {
		box-shadow: 5px 5px 10px -5px;
	}

</style>
</head>

<body>
<!-- TODO : 메뉴바 -->
<jsp:include page="../common/menubar.jsp"/>
<div id="content-wrap-area">
	<div class="main-blank-area"></div>

	<div id="news-content-area">

		<div class="news-box-area">
			<h4>♬ 어제의 핫 이슈!</h4>
			<c:forEach var="top" items="${topList}">
				<c:if test="${ top.urlToImage != 'null' and top.title != 'null' and top.url != 'null' }">
					<hr>
					<div class="news" onclick="location.href='${top.url}'">
						<span><img src="${top.urlToImage}" width="120px;" /></span>
						<span>${top.title}</span>
					</div>

					</c:if>
			</c:forEach>
		</div>
		<br>
		<div style="border: 1px solid black;"></div>
		<br>
		<div class="news-box-area">
			<h4>☞ 우리의 최신 뉴스</h4>
			<c:forEach var="news" items="${newsList}">
					<hr>
					<div class="news" onclick="location.href='/news/detail.do'">
						<span><img src="${news.news_thumbnail_image}" width="120px;" /></span>
						<span>${news.news_title}</span>
					</div>
			</c:forEach>
		</div>

	</div>
	<!-- TODO : 사이드바 작업할 것. -->
	<div class="main-side-area"></div>



</div>

<!-- TODO : 푸터바 -->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
