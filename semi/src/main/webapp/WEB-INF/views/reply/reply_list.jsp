<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.reply{
	    margin: 0;
	    padding: 0;
	}
	
	#reply_area{
	    width: 90%;
	    height: 100px;
	    resize: none;
	    border: 3px solid;
	}
	
	.rpy_submit{
	    background-color: #66a5f7;
	    border: 2px solid #66a5f7;
	    color: #f6f6f6;
	    width: 8%;
	    height: 30px;
	    font-size: 12px;
	    position: relative;
	    top: -10px;
	}
</style>

<script type="text/javascript">

	function reply_delete(cmt_idx){
		if(confirm("정말 삭제하시겠습니까?")==false)return;
		
		$.ajax({
			url			:		"../reply/delete.do",
			data		:		{"rpy_idx" : rpy_idx},
			dataType	:		"json",
			success		:		function(res_data){
				if(res_data.result==false){
					alert("삭제 실패!!");
					return;
				}
				
			}
		}); 
		
	}
</script>

</head>
<body>

<!-- Page Menu -->

<c:if test="${ not empty list }">
<div style="font-size: 10px;">
   ${ pageMenu }
</div>   
</c:if>



<!-- for(replyVo vo : list) -->
<c:forEach var="vo"  items="${ list }">
  <div>${ vo.mem_name }</div>
  <div>${ vo.rpy_regdate }</div>
  <div>${ vo.rpy_content }</div>
  <hr>
</c:forEach>



<div class="reply">
    <textarea name="reply_area" id="reply_area"></textarea>
    <button class="rpy_submit" type="button" onclick="alert('댓글이 작성되었습니다.')">작성</button>
</div>





</body>
</html>