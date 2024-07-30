<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>검색 조회</title>
    <style>
        .highlight{
            display: inline;
            background-color: #D9FCDB;
            /*-10px은 highlight의 두께*/
        }
    </style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>

<br><br><br><br><br>

<span style="width: 100px;height: 50px; margin: 0">
    검색 :
    &nbsp;<input id="newsSearchText" style="height: 30px" type="text" value="${news_search_text}">
    &nbsp;<svg id="newsSearch"  style="cursor:pointer" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 550"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
</span>

<br><br><br>

<c:forEach var="vo" items="${searchNewsList}">
    <div class="searchTarget">뉴스 제목 : ${vo.news_title}</div>
    <div class="searchTarget">기자 : ${vo.mem_name}</div>
    <div><img src="${vo.news_thumbnail_image}"></div>
    <div class="searchTarget">뉴스 내용 : ${vo.news_content}</div>
    <div>조회 수 : ${vo.news_count}</div>
    <div>뉴스 작성일 : <c:out value="${vo.news_updateAt}" default="${vo.news_createAt}" /> </div>
    <div class="searchTarget">카테고리 : ${vo.category_name}</div>
    <div>뉴스 좋아요 수 : ${vo.news_like_count}</div>
    <br>
</c:forEach>


<script>
    // 화면 로딩 시 실행 될 함수
    $(function () {
        let te = "${vo.category_name}";
        console.log(${vo.category_name});
        // 검색 타겟으로 설정된 태그들의 text값이 검색어와 일치할 경우 highlight 효과 주기.
        $(".searchTarget").each(function (index, item){
            console.log($(item).text());
           let replace = $(item).text().replaceAll('${news_search_text}',"<span class='highlight'>${news_search_text}</span>");
           $(item).html(replace);

        });
    });

    // 검색 버튼 클릭 시 검색
    $("#newsSearch").click(function () {
        let newsSearchText = $("#newsSearchText").val();
        console.log("검색어 : " + newsSearchText);

        // 제목 + 내용 + 기자이름 + 카테고리 이름
        location.href="news_search.do?news_search_text="+newsSearchText;

    });

</script>

</body>
</html>
