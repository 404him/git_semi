<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>뉴스 상세 조회</title>
    <style>
        #heart {
        }

        #heart.active {
            fill: red;

        }
    </style>
</head>
<body>

<jsp:include page=""/>






    <a>asdasdasdasdasd</a>
    <br>
    <br>

    <div>뉴스 idx : ${vo.news_idx}</div>
    <div>뉴스 제목 : ${vo.news_title}</div>
    <div>기자 : ${vo.mem_name}</div>
    <div><img src="${vo.news_thumbnail_image}"></div>
    <div>뉴스 내용 : ${vo.news_content}</div>
    <div>조회 수 : ${vo.news_count}</div>
    <div>뉴스 작성일 : <c:out value="${vo.news_updateAt}" default="${vo.news_createAt}"/></div>
    <div>카테고리 : ${vo.category_name}</div>
    <div>

        <svg xmlns="http://www.w3.org/2000/svg" id="heart" width="1.5em" height="1em" fill="white" stroke="red"
             stroke-width="50" viewBox="0 0 512 512">
            <path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/>
        </svg>

        : ${vo.news_like_count}
    </div>
    <br>
</div>
<script>

    // 화면 로딩 시 실행 될 함수
    $(function () {
        //checkMemberLike();
    });

    // 좋아요 클릭 시 실행 될 함수
    $("#heart").click(function () {

        // 클릭시
        this.classList.toggle('active');
    });

    // 회원이 좋아요한 뉴스인지 체크하기.
    function checkMemberLike() {

        $.ajax({
            url: "check_member_isLike_news.do",
            data: {
                "mem_idx": 1, // TODO : 로그인한 사용자 교유값으로 변경할 것.
                "news_idx": ${vo.news_idx}
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                // 상세 조회한 사용자가 해당 뉴스를 좋아요 눌렀을 경우
                if (data == true) {
                    console.log(data);
                    $("#heart").attr('fill', 'red');
                }
            },
            error: function (err) {
                alert("좋아요 ajax 요청 실패");
            }
        });

    }

</script>


</body>
</html>
