<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Global Times</title>
    <style>
        #content-wrap-area {
            width: 100%;
            min-height: calc(100vh - 260px);
            margin-top: 40px;
        }

        footer {
            height: 260px;
        }

    </style>

    <!-- ajax & jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- bootstrap 5.xx -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- menubar css. -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/main/css/menubar.css">

    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>

<body>
<!-- 해더 메인로고 -->
<header class="header_container">
    <h1 class="header_h1">
        <img class="main_logo"
             src="${pageContext.request.contextPath}/resources/member/세미로고.png"
             alt="main_logo" onclick="location.href='${pageContext.request.contextPath}/main.do'">
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
            <c:forEach var="c" items="${categoryList}">
                <li class="dropdown"><a href="${pageContext.request.contextPath}/news/category/list.do?category_idx=${c.category_idx}" class="nav_title">${c.category_name}</a></li>
            </c:forEach>
        </ul>
        <div style="text-align: right;">
            <span style=" width: 100px;height: 50px; margin: 0">검색 :
                <input id="newsSearchText" style="height: 30px" type="text" placeholder="${news_search_text != null ? news_search_text : '검색어를 입력해주세요'}">
                <svg id="newsSearch" style="cursor:pointer" width="25" height="25" xmlns="http://www.w3.org/2000/svg"
                     viewBox="0 0 512 550">
                <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
            </span>
        </div>
    </nav>

</div>
<script>
    // 검색 버튼 클릭 시 검색
    $("#newsSearch").click(function () {
        let newsSearchText = $("#newsSearchText").val();

        if(newsSearchText == '') {
            alert("검색어를 입력해주세요!");
            return;
        }
        console.log("검색어 : " + newsSearchText);

        // 제목 + 내용 + 기자이름 + 카테고리 이름
        location.href="${pageContext.request.contextPath}/news/news_search.do?news_search_text="+newsSearchText;

    });
</script>
</body>
</html>
