<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function reply_delete(cmt_idx){
		if(confirm("정말 삭제하시겠습니까?")==false)return;
		
		$.ajax({
			url			:		"../reply/delete.do",
			data		:		{"rpy_idx: rpy_idx"},
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

</body>
</html>