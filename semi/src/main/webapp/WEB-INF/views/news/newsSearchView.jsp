<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>검색 조회</title>
    <style>
        .highlight {
            display: inline;
            background-color: #aefdb4;
            /*-10px은 highlight의 두께*/
        }

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
            cursor: pointer;
            background-color: #e8e7e7;
        }

        .news-box-area {
        }
    </style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>

<div id="content-wrap-area">
    <div class="main-blank-area"></div>

    <div id="news-content-area">
        <div class="news-box-area">
            <div style="margin-left: 20px; font-weight: bold; font-size: 32px;">
                <span># ${news_search_text}</span>
            </div>
            <c:choose>
                <c:when test="${ empty searchNewsList }">
                    <div style="text-align: center"><h3>검색한 뉴스가 없습니다.</h3></div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="news" items="${searchNewsList}">
                        <hr>
                        <div class="news" onclick="location.href='${pageContext.request.contextPath}/news/detail.do?news_idx=${news.news_idx}'">
                            <div style="width : 20%; display: inline-block;">
                                <img src="${news.news_thumbnail_image}" width="160px;" height="120px;" />
                            </div>
                            <div style="width : 75%; display: inline-block; margin-left: 20px;">
                                <span class="searchTarget" style="font-weight: bold;font-size: 24px;">[${news.category_name}] ${news.news_title}</span>


                                <span style="float: right">${fn:substring(news.news_createAt,0,10)}</span>
                                <br>
                                <span style="float: right;">&nbsp;기자</span>
                                <span class="searchTarget" style="float: right; font-weight: bold;">${news.mem_name}</span>
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
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<script>
    // 화면 로딩 시 실행 될 함수
    $(function () {

        // 검색 타겟으로 설정된 태그들의 text값이 검색어와 일치할 경우 highlight 효과 주기.
        $(".searchTarget").each(function (index, item) {
            console.log($(item).text());
            let replace = $(item).text().replaceAll('${news_search_text}', "<span class='highlight'>${news_search_text}</span>");
            $(item).html(replace);

        });
    });

</script>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>
