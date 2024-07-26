<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>뉴스 리스트 조회</title>
</head>
<body>
    <c:forEach var="vo" items="${newsList}">
        <div>뉴스 제목 : ${vo.news_title}</div>
        <div>기자 : ${vo.mem_name}</div>
        <div><img src="${vo.news_thumbnail_image}"></div>
        <div>뉴스 내용 : ${vo.news_content}</div>
        <div>조회 수 : ${vo.news_count}</div>
        <div>뉴스 작성일 : ${vo.news_createAt}</div>
        <div>카테고리 : ${vo.category_name}</div>
        <div>뉴스 좋아요 수 : ${vo.news_like_count}</div>
        <br>
    </c:forEach>



</body>
</html>
