<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function reply_delete(rpy_idx){
		
		
		
		if(confirm("정말 삭제하시겠습니까")==false) return;
		
		$.ajax({
			url		:	"../reply/delete.do",
			data	:	{"rpy_idx":rpy_idx},
			dataType:	"json",
			success	:	function(res_data){
				//res_data = {"result" : true} or {"result" : false}
				if(res_data.result == false){
					alert("삭제 실패");
					return;
				}
					reply_list();
			},
			error	:	function(err){
				alert(err.responseText);
			}
			
		});
		
	};


</script>
</head>
<body>

<!-- for(replyVo vo : list) -->
<c:forEach var="vo"  items="${ list }">
		<!-- 자신의 글만 삭제메뉴 활성화 -->
		<c:if test="${user.mem_idx eq vo.mem_idx }">
			<div style="text-align: right;">
				<img
					src="${pageContext.request.contextPath}/resources/reply/free-icon-x-button-458594.png"
					onclick="reply_delete('${vo.rpy_idx}');" width="20px"	height="20px" style="cursor:pointer;"><br>
			</div>
		</c:if>
		<div>${ vo.mem_idx }</div>
		<div>${ vo.rpy_content }</div>
		<div>${ fn:substring(vo.rpy_regdate,0,16) }</div>
		<svg id="thumbs-up" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1.5em" height="1.3em" fill="white" stroke="#1f2f4d" stroke-width="20"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path  d="M313.4 32.9c26 5.2 42.9 30.5 37.7 56.5l-2.3 11.4c-5.3 26.7-15.1 52.1-28.8 75.2l144 0c26.5 0 48 21.5 48 48c0 18.5-10.5 34.6-25.9 42.6C497 275.4 504 288.9 504 304c0 23.4-16.8 42.9-38.9 47.1c4.4 7.3 6.9 15.8 6.9 24.9c0 21.3-13.9 39.4-33.1 45.6c.7 3.3 1.1 6.8 1.1 10.4c0 26.5-21.5 48-48 48l-97.5 0c-19 0-37.5-5.6-53.3-16.1l-38.5-25.7C176 420.4 160 390.4 160 358.3l0-38.3 0-48 0-24.9c0-29.2 13.3-56.7 36-75l7.4-5.9c26.5-21.2 44.6-51 51.2-84.2l2.3-11.4c5.2-26 30.5-42.9 56.5-37.7zM32 192l64 0c17.7 0 32 14.3 32 32l0 224c0 17.7-14.3 32-32 32l-64 0c-17.7 0-32-14.3-32-32L0 224c0-17.7 14.3-32 32-32z"/></svg>
		: <span id="replyLikeCount"></span>
		<svg id="thumbs-down" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1.5em" height="1.3em" fill="white" stroke="#1f2f4d" stroke-width="20"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M313.4 479.1c26-5.2 42.9-30.5 37.7-56.5l-2.3-11.4c-5.3-26.7-15.1-52.1-28.8-75.2l144 0c26.5 0 48-21.5 48-48c0-18.5-10.5-34.6-25.9-42.6C497 236.6 504 223.1 504 208c0-23.4-16.8-42.9-38.9-47.1c4.4-7.3 6.9-15.8 6.9-24.9c0-21.3-13.9-39.4-33.1-45.6c.7-3.3 1.1-6.8 1.1-10.4c0-26.5-21.5-48-48-48l-97.5 0c-19 0-37.5 5.6-53.3 16.1L202.7 73.8C176 91.6 160 121.6 160 153.7l0 38.3 0 48 0 24.9c0 29.2 13.3 56.7 36 75l7.4 5.9c26.5 21.2 44.6 51 51.2 84.2l2.3 11.4c5.2 26 30.5 42.9 56.5 37.7zM32 384l64 0c17.7 0 32-14.3 32-32l0-224c0-17.7-14.3-32-32-32L32 96C14.3 96 0 110.3 0 128L0 352c0 17.7 14.3 32 32 32z"/></svg>
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1.5em" height="1.3em" fill="#1f2f4d" stroke="#1f2f4d" stroke-width="20"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M313.4 479.1c26-5.2 42.9-30.5 37.7-56.5l-2.3-11.4c-5.3-26.7-15.1-52.1-28.8-75.2l144 0c26.5 0 48-21.5 48-48c0-18.5-10.5-34.6-25.9-42.6C497 236.6 504 223.1 504 208c0-23.4-16.8-42.9-38.9-47.1c4.4-7.3 6.9-15.8 6.9-24.9c0-21.3-13.9-39.4-33.1-45.6c.7-3.3 1.1-6.8 1.1-10.4c0-26.5-21.5-48-48-48l-97.5 0c-19 0-37.5 5.6-53.3 16.1L202.7 73.8C176 91.6 160 121.6 160 153.7l0 38.3 0 48 0 24.9c0 29.2 13.3 56.7 36 75l7.4 5.9c26.5 21.2 44.6 51 51.2 84.2l2.3 11.4c5.2 26 30.5 42.9 56.5 37.7zM32 384l64 0c17.7 0 32-14.3 32-32l0-224c0-17.7-14.3-32-32-32L32 96C14.3 96 0 110.3 0 128L0 352c0 17.7 14.3 32 32 32z"/></svg>
		: <span id="replyDisLikeCount"></span>
		<hr>
</c:forEach>

</body>

<script>

    // 화면 로딩 시 실행 될 함수
    $(function () {
        // 로그인한 회원일 경우에만 호출하기.
        if('${user}' != '') {
        	checkReplyLike();
        }
        
        replyLikeCount();
    });


    // 뉴스 좋아요 개수 조회하는 함수
    function replyLikeCount() {
        $.ajax({
            url : "rpy_like_count.do",
            data : {"rpy_idx" : ${vo.rpy_idx} },
            success : function (data) {
                $("#replyLikeCount").html(data);
            },
            error : function () {
                console.log("댓글 좋아요 수 조회 ajax 실패!");
            }
        })
    }
   
    

    // 좋아요 클릭 시 실행 될 함수
    $("#thumbs-up").click(function () {

        if('${user}' == '') {
            alert("로그인 후 이용 가능합니다.");
            return;
        }


        // 좋아요 통합 구현. 좋아요 <--> 좋아요 취소
        // 하트 색깔 변수로 할당.
        let thumbsColor = $(this).attr('fill');

        // 좋아요/취소 요청하는 ajax.
        $.ajax({
            url : "rpy_like_on_off.do",
            data : {
                "thumbsColor" : thumbsColor,
                "rpy_idx" : ${vo.rpy_idx},
                "mem_idx" : '${user.mem_idx}'
            },
            success : function (data) {
                if(data > 0) {
                	replyLikeCount();
                	checkReplyLike();
                }
            },
            error : function () {
                alert("댓글 좋아요/취소 ajax 요청 실패");
            }
        });

    });

    // 회원이 좋아요한 뉴스인지 체크하는 함수.
    function checkReplyLike() {

        $.ajax({
            url: "check_member_isLike_reply.do",
            data: {
                "mem_idx": '${user.mem_idx}' ,
                "news_idx": ${vo.news_idx}
            },
            dataType: "json",
            success: function (data) {
                // 상세 조회한 사용자가 해당 뉴스를 좋아요 눌렀을 경우
                if (data == true) {
                    $("#thumbs-up").attr('fill', '#1f2f4d');
                } else {
                    $("#thumbs-up").attr('fill', '');
                }
            },
            error: function () {
                alert("댓글 좋아요 ajax 요청 실패");
            }
        });

    }




</script>
</html>