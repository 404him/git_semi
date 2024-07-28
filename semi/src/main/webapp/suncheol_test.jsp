<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script type="text/javascript">

function upload(){
	
	let fileName = $("#image").val();
	$("#url_sum").append("<a>" + fileName + "</a>");
	}


	
	function send(){
	let thumbnail = document.getElementById('url_sum');
	let children = thumbnail.children;

	var imageArray = new Array();
	for (let i = 0; i <= children.length-1; i++) {
//		imageArray.push(children[i].textContent);
		console.log("이미지 : " + children[i].textContent);
	}
	
	}
</script>

</head>
<body>
	이미지 등록 : <input type="file" name="image" id="image">
	<br>
	<br>
					<input type="button" value="업로드" onclick="upload();">
				
			<input type="button" value="전송" onclick="send();">
	<div id="url_sum" style="display: none;"></div>



</body>
</html>