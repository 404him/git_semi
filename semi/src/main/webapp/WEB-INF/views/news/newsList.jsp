<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>뉴스 리스트 조회</title>
</head>
<body>
    <c:forEach var="vo" items="${newsList}">
        <div>${vo.news_title}</div>
        <div>${vo.news_content}</div>
        <div>${vo.news_count}</div>
        <div>${vo.news_createAt}</div>
        <div>${vo.category_name}</div>
        <div>${vo.news_like_count}</div>


    </c:forEach>



</body>
</html>
