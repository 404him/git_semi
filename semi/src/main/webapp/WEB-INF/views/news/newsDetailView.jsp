<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>뉴스 상세 조회</title>
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

.customCheckBoxHolder {
	margin: 5px;
	display: inline-block;
}

.customCheckBox {
	width: fit-content;
	position: relative;
	overflow: hidden;
	cursor: pointer;
	user-select: none;
	padding: 2px 8px;
	background-color: rgba(0, 0, 0, 0.16);
	border-radius: 0px;
	color: rgba(255, 255, 255, 0.7);
	transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
	transition-duration: 300ms;
	transition-property: color, background-color, box-shadow;
	display: flex;
	height: 32px;
	align-items: center;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 1px 0px inset,
		rgba(255, 255, 255, 0.17) 0px 1px 1px 0px;
	outline: none;
	justify-content: center;
	min-width: 55px;
}

.customCheckBox:hover {
	background-color: #2c2c2c;
	color: white;
	box-shadow: rgba(0, 0, 0, 0.23) 0px -4px 1px 0px inset,
		rgba(255, 255, 255, 0.17) 0px -1px 1px 0px, rgba(0, 0, 0, 0.17) 0px
		2px 4px 1px;
}

.customCheckBox .inner {
	font-size: 18px;
	font-weight: 900;
	pointer-events: none;
	transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
	transition-duration: 300ms;
	transition-property: transform;
	transform: translateY(0px);
}

.customCheckBox:hover .inner {
	transform: translateY(-2px);
}

/* Multiple Checkboxes can be chained together for a radio input */
.customCheckBoxWrapper:first-of-type .customCheckBox {
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
	border-right: 0px;
}

.customCheckBoxWrapper:last-of-type .customCheckBox {
	border-bottom-right-radius: 5px;
	border-top-right-radius: 5px;
	border-left: 0px;
}

.customCheckBoxInput {
	display: none;
}

.customCheckBoxInput:checked+.customCheckBoxWrapper .customCheckBox {
	background-color: #2d6737;
	color: white;
	box-shadow: rgba(0, 0, 0, 0.23) 0px -4px 1px 0px inset,
		rgba(255, 255, 255, 0.17) 0px -1px 1px 0px, rgba(0, 0, 0, 0.17) 0px
		2px 4px 1px;
}

.customCheckBoxInput:checked+.customCheckBoxWrapper .customCheckBox .inner
	{
	transform: translateY(-2px);
}

.customCheckBoxInput:checked+.customCheckBoxWrapper .customCheckBox:hover
	{
	background-color: #34723f;
	box-shadow: rgba(0, 0, 0, 0.26) 0px -4px 1px 0px inset,
		rgba(255, 255, 255, 0.17) 0px -1px 1px 0px, rgba(0, 0, 0, 0.15) 0px
		3px 6px 2px;
}

.customCheckBoxWrapper .customCheckBox:hover .inner {
	transform: translateY(-2px);
}

#news-content-area > div {
    margin-bottom: 5px;
}

.reply{
    margin: 0;
    padding: 0;
}

#reply_area{
    width: 600px;
    height: 100px;
    resize: none;
    border: 3px solid;
}

.rpy_submit{
    background-color: #66a5f7;
    border: 2px solid #66a5f7;
    color: #f6f6f6;
    width: 50px;
    height: 30px;
    font-size: 12px;
    position: relative;
    top: -10px;
}

</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>
<div id="content-wrap-area">
    <div class="main-blank-area"></div>

    <div id="news-content-area">
        <div style="display: inline-block; font-size: 28px; font-weight: bold;">[${vo.category_name}] ${vo.news_title}</div>
        <div style="display: inline-block; float: right; margin-right: 10px;">
            <span>${fn:substring(vo.news_createAt,0,10)} 작성됨</span><br>
            <c:if test="${user.mem_idx eq vo.mem_idx }">
            <input type="button" value="수정하기" onclick="location.href='${pageContext.request.contextPath}/news/modify_form.do?news_idx=${ vo.news_idx }'">
            </c:if>
        </div>

        <hr>
        <div style="margin : auto; overflow: hidden; display:inline-block; border-radius: 70%;">
            <img src="${vo.mem_img_url}" width="30px;" height="30px;">
        </div>
        <div style=" display:inline-block;">
            <span>${vo.mem_name}</span>
            <span style="font-size: 13px;">기자</span>
        </div>
        <div class="customCheckBoxHolder">
            <input type="checkbox" id="cCB1" class="customCheckBoxInput" >
            <label for="cCB1" class="customCheckBoxWrapper">
                <div class="customCheckBox">
                    <div class="inner">SUBSCRIBE</div>
                </div>
            </label>
        </div>
        <hr>
        <br>
        <div style="text-align: center"><img src="${vo.news_thumbnail_image}" width="600px;" height="300px;"></div>
        <br><hr><br>
        <div>${vo.news_content}</div>
        <br><hr><br>
        <input type="button" value="목록으로" onclick="history.back();"/>
        <div style="font-size: 18px; text-align: right; margin-right: 20px;">
            <span>조회 수 : ${vo.news_count} ㅣ </span>
            <span>
                <svg style="cursor:pointer" xmlns="http://www.w3.org/2000/svg" id="heart" width="1.3em" height="1.1em" fill="white" stroke="red"
                     stroke-width="50" viewBox="0 0 512 512">
                    <path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/>
                </svg>
                : <span id="newsLikeCount"></span>
            </span>
        </div>
        <br><hr><br>

        <!-- TODO : 댓글 쓰는 곳!!!! -->
      	<jsp:include page="../reply/reply_view.jsp" />


    </div>
    <!-- TODO : 사이드바 작업할 것. -->
    <div class="main-side-area"></div>

</div>
<jsp:include page="../common/footer.jsp"/>

<script>

    // 화면 로딩 시 실행 될 함수
    $(function () {
        // 로그인한 회원일 경우에만 호출하기.
        if('${user}' != '') {
            checkMemberLike();
            checkSubscribe();
        }
        
        newsLikeCount();
    });

    // 10초 동안 화면에 머물시 조회수 증가
    setTimeout(function() {
        console.log("조회수 증가 timeout 실행!");
        $.ajax({
            url : "count_up.do",
            data : {"news_idx" : ${vo.news_idx}},
            success : function (result) {
                if(result) {
                    console.log("조회수 증가 성공!");

                }
            },
            error : function () {
                console.log("뉴스 조회 수 증가 ajax 실패!");
            }
        })
    }, 10000);

    // 뉴스 좋아요 개수 조회하는 함수
    function newsLikeCount() {
        $.ajax({
            url : "news_like_count.do",
            data : {"news_idx" : ${vo.news_idx} },
            success : function (data) {
                $("#newsLikeCount").html(data);
            },
            error : function () {
                console.log("뉴스 좋아요 수 조회 ajax 실패!");
            }
        })
    }
   
    

    // 좋아요 클릭 시 실행 될 함수
    $("#heart").click(function () {

        if('${user}' == '') {
            alert("로그인 후 이용 가능합니다.");
            return;
        }


        // 좋아요 통합 구현. 좋아요 <--> 좋아요 취소
        // 하트 색깔 변수로 할당.
        let heartColor = $(this).attr('fill');

        // 좋아요/취소 요청하는 ajax.
        $.ajax({
            url : "news_like_on_off.do",
            data : {
                "heartColor" : heartColor,
                "mem_idx" : '${user.mem_idx}' ,
                "news_idx" : ${vo.news_idx}
            },
            success : function (data) {
                if(data > 0) {
                    newsLikeCount();
                    checkMemberLike();
                }
            },
            error : function () {
                alert("좋아요/취소 ajax 요청 실패");
            }
        });

    });

    // 회원이 좋아요한 뉴스인지 체크하는 함수.
    function checkMemberLike() {

        $.ajax({
            url: "check_member_isLike_news.do",
            data: {
                "mem_idx": '${user.mem_idx}' ,
                "news_idx": ${vo.news_idx}
            },
            dataType: "json",
            success: function (data) {
                // 상세 조회한 사용자가 해당 뉴스를 좋아요 눌렀을 경우
                if (data == true) {
                    $("#heart").attr('fill', 'red');
                } else {
                    $("#heart").attr('fill', 'white');
                }
            },
            error: function () {
                alert("좋아요 ajax 요청 실패");
            }
        });

    }




</script>



<script>
		/* 구독 SUBSCRIBE 스크립트 */
  // 구독 클릭 시 실행 될 함수
    	
    	$("#cCB1").click(function () {

            if('${user}' == '') {
            	$("#cCB1").prop("checked", false); // 해제
                alert("로그인 후 이용 가능합니다.");
                return;
            }

        	let subscribe_checked = $("#cCB1").prop("checked");
			
        // 구독 / 구독취소 요청하는 ajax.
        $.ajax({
            url : "news_subscribe_on_off.do",
            data : {
                "subscribe_checked" : subscribe_checked,
                "mem_idx" : '${user.mem_idx}',
                "reporter_idx" : '${vo.mem_idx}' // 뉴스 등록한 기자의 mem_idx
            },
            success : function (data) {
                if(data > 0) {
                	checkSubscribe();
                }
            },
            error : function () {
                alert("구독 ajax 요청 실패");
            }
        });

    });

    // 회원이 구독한 뉴스인지 체크하는 함수.

           function checkSubscribe() {
        $.ajax({
            url: "check_Subscribe.do",
            data: {
                "mem_idx": '${user.mem_idx}' ,
                "reporter_idx": '${vo.mem_idx}'
            },
            dataType: "json",
            success: function (data) {
                // 상세 조회한 사용자가 해당 뉴스등록한 기자를 구독 눌렀을 경우
                if (data == true) {
                	$("#cCB1").prop("checked", true); // 선택
                } else {
                	$("#cCB1").prop("checked", false); // 해제
                }
            },
            error: function () {
                alert("구독 ajax 요청 실패");
            }
        });
    

</script>
</body>
</html>
