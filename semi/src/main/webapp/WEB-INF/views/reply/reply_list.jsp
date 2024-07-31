<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.reply_container {
    width: 100%;
  	margin:0;
  	padding:0;
}
.reply-list{
    margin: auto;
    border-top: 5px solid #000000;
    height: 50px;
    text-align: center;
    margin-top: 100px;
}
.replys {
    border-top: 1px solid #ddd;
    padding : 10px;
    font-size: 0px;
}
.replys .submitbtn{
    padding: 10px;
    width: 750px;
    text-align: right;
    font-size: 13px;
 }
 .replys .submitbtn .btn{
    display: inline-block;
    margin: 0px;
    border: none;
    padding: 5px 15px;
    background-color: #3198FF;
    color: white;
    text-decoration: none;
    cursor: pointer;
    }
.replys .submitbtn .btn:hover {
    border: none;
    background-color: #78E1FC;
    color: white;
    }
.submitbtn .btn.btn-del{
    border: none;
    background-color: #FF3737;
}
.submitbtn .btn.btn-del:hover {
 border: none;
  background-color: #FF8080;
  color: white;
}
.form{
    display: inline-block;	
}
.reply_comment{
    font-size: 14px;
}
.reply_date{
    font-size: 14px;
    color: #ABABAB;
}
.reply_content{
    font-size: 18px;
}
.replys .reply_content{
    padding: 7px;
}
.reply_input {
    border-top: 1px solid #ddd;
}
.reply_input .reply_textarea {
    height: 100px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: none;
    width: 700px;
}
.reply_input textarea {
    width: 760px;
    height: 100px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: none;
    font-size: 18px;
}
.reply_btn{
   text-align: right;
}
.reply_btn .button {
    padding: 10px 20px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
.comment-btn .button:hover {
    background-color: #0056B3;
}
</style>
<script type="text/javascript">
	 /* 댓글쓰기 기능  */
	   function reply_insert(f){
		   console.log("1");
		 
		  console.log(news_idx);
		   //로그인이 안되었으면
		   if("${user}" == ""){
			   if(confirm("로그인후 댓글쓰기가 가능합니다\n로그인 하시겠습니까?")) {
					return;
			   }else {
				   // 로그인폼으로 이동
				   location.href="${pageContext.request.contextPath}/member/login_form.do";
				}
		   }
		   
		   
		   // 댓글쓰기 작성
		   let rpy_content = $("#rpy_content").value.trim();
		  
		   if(rpy_content==''){
			   alert("댓글내용을 입력하세요!!");
			   $("#rpy_content").val("");
			   $("#rpy_content").focus();
			   return;
		   }
		   console.log("2");
		   //Ajax통해서 댓글 등록
		   $.ajax({
			   url		:	"../news/insert.do",
			   data		:	{
				              "rpy_content": rpy_content,
				              "news_idx":news_idx,
				              "mem_idx":"${user.mem_idx}"
				            },
			   dataType	:	"json",
			   success	:	function(res_data){
				   // res_data = {"result": true }
				  
				   //작성했던 댓글 입력창에서 지우기
				   $("#rpy_content").val("");
				  
				  
				   if(res_data.result==false){
					   alert("댓글등록 실패!!");
					   return;
				   }
				  
				   //reply_list();
				  
			   },
			   error	:	function(err){
				   alert(err.responseText);
			   }
		   });
		   console.log("3"); 
	   }//end:comment_insert()
	  
	  
	   
	   	function reply_delete(rpy_idx){
		if(confirm("정말 삭제하시겠습니까?")==false)return;
		
		$.ajax({
			url			:		"../reply/delete.do",
			data		:		{"rpy_idx" : rpy_idx},
			dataType	:		"json",
			success		:		function(res_data){
						},
				error : function(err) {
					alert("잠시후 다시 시도해주세요")
				}
			});
		}
	   
	 
</script>
</head>
<body>
<%-- <!-- Page Menu -->
<c:if test="${ not empty list }">
<div style="font-size: 10px;">
   ${ pageMenu }
</div>
</c:if>
 --%>
<!-- for(replyVo vo : list) -->
<c:forEach var="vo"  items="${ list }">
  <div>${ vo.mem_name }</div>
  <div>${ vo.rpy_regdate }</div>
  <div>${ vo.rpy_content }</div>
  <hr>
</c:forEach>
<!-- 댓글 작성폼 -->
<!-- Content 부분 (상세, 서브 페이지 내용 넣기) -->
    <div class="reply_container">
	
        <c:forEach var="reply" items="${ replyList }">
        <div class="replys">
          <div class="reply_update">
            <span class="reply_comment">${ reply.mem_nickname}</span>
            <span class="reply_comment">&nbsp; │ &nbsp;</span>
            <span class="reply_date">${ fn:substring(reply.rpy_regdate,0,16) }</span>
          </div>
          <form class="form">
            <p class="reply_content" id="rpy_comment${ reply.rpy_idx }">${ reply.rpy_content }</p>
             <div class="submitbtn">
             <c:if test="${ user.mem_idx eq reply.mem_idx }">
                <input type="hidden" name="rpy_idx" value="${ reply.rpy_idx }">
                   <input type="button" class="btn btn-insert" value="수정" onclick="comment_showupdate(this.form)">
             </form>
                     <form class="form">
                             <input type="hidden" name="rpy_idx" value="${ reply.rpy_idx }">
                        <input type="button" class="btn btn-del" value="삭제" onclick="reply_del(this.form)">
             </c:if>
                  </form>
              </div>
        </div>
        </c:forEach>
    	
    	
      <!----------------------------------------------------------------------------------->
        <form class="form">
        		<input type="hidden" name="news_idx" value="${ vo.news_idx }">
                <input type="hidden" name="mem_idx" value="${ user.mem_idx }">
        <div class="reply_input">
            <textarea placeholder="댓글을 입력하세요" name="rpy_content" class="reply_textarea"></textarea>
        </div>
        <div class="reply_btn">
            <button class="button" onclick="reply_insert(this.form);">댓글등록</button>
         </div>
         </form>
          </div>
    </div>
</body>
</html>