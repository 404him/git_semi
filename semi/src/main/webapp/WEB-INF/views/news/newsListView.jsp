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

        .news:hover {
            cursor : pointer;
            background-color: #e8e7e7;
        }

        .news-box-area {
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
            <h4>☞ ${categoryList[(param.category_idx-1)].category_name} 뉴스</h4>
            <c:forEach var="news" items="${newsList}">
                <hr>
                <div class="news" onclick="location.href='${pageContext.request.contextPath}/news/detail.do?news_idx=${news.news_idx}'">
                    <div style="width : 20%; display: inline-block;">
                        <img src="${news.news_thumbnail_image}" width="160px;" height="120px;" />
                    </div>
                    <div style="width : 75%; display: inline-block; margin-left: 20px;">
                        <span style="font-weight: bold;">[${news.category_name}] ${news.news_title}</span>


                        <span style="float: right">${fn:substring(news.news_createAt,0,10)}</span>
                        <br>
                        <c:if test="${fn:length(news.news_content) > 20 }" >
                            <span>${fn:substring(news.news_content,0,20)}...</span>
                        </c:if>
                        <c:if test="${fn:length(news.news_content) <= 20 }" >
                            <span>${news.news_content}</span>
                        </c:if>
                        <br>
                        <span style="float: right;">&nbsp;기자</span>
                        <span style="float: right; font-weight: bold;">${news.mem_name}</span>
                    </div>
                    <div style="text-align: right; padding-right: 10px;">
							<span style="font-size: 14px;">
								조회수 : ${news.news_count}ㅣ좋아요 수 : ${news.news_like_count}
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

</body>
</html>
