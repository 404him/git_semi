<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>S3 업로드 테스트</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
.basic{
width: 40%;
margin: auto;
display: inline-block;
}
#box {
	width: 600px;
	margin: auto;
	margin-top: 150px;
}

textarea {
	resize: none;
	width: 50%;
	height: 50%;
}

h4 {
	font-weight: bold;
}

form {
	display: inline-block;
}

.post {
	display: inline-block;
}

.title {
	display: inline-block;
	width: 10%;
}

.title_name {
	display: inline-block;
}

img {
	width: 100%;
}
</style>


<script type="text/javascript">

 function preview1(){
	 
	 let news_title = $("#news_title").val();

	 $("#news_title_retrun").html(news_title);

}
 
 function preview2(){
 
	 let news_content = $("#news_content").val();
 	 let text = news_content.replaceAll("\n","<br>");
 
	 

	 $("#news_content_return").html(text);

}
 
 function send(f){
	 
		let news_title = f.news_title.value.trim();
		let news_content = f.news_content.value.trim();
		
		let thumbnail = document.getElementById('url_sum');
		let children = thumbnail.children;
		
		let news_thumbnail_image = children[0];
		console.log("썸네일 : " + news_thumbnail_image);
		
		var imageArray = new Array();
		for ( let i = 1 ; children.length; i++){
		imageArray.push(children[i]);
		console.log("추가이미지 : " + children[i]);
		}
		
		
		if(news_title==''){
			alert("제목을 입력하세요!!");
			f.news_title.value="";
			f.news_title.focus();
			return;
		}
		
		if(news_content==''){
			alert("내용을 입력하세요!!");
			f.news_content.value="";
			f.news_content.focus();
			return;
		}
		
		f.action = "insert.do";
		f.submit(); //
		
		
 }

</script>


</head>
<body>

	<div class="basic">
		<form method="POST" enctype="multipart/form-data">
			<div>
				이미지 등록 : <input type="file" name="image" id="image"
					onclick="ClipboardClear();">
					
			</div>

			<div>
				<input type="button" value="이미지 올리기"
					onclick="uploadS3(this.form);">
			</div>
		</form>
		<br>
		<form class="post">
				<div id="url_sum" style="display: none;"></div>
			<div id="box">
				<!-- Bootstrap Panel -->
				<div class="panel panel-primary">
					<div class="panel-body">

						<div>
							<h4 class="title">제목 :</h4>
							<input class="title_name" name="news_title" id="news_title"
								onkeyup="preview1();">
						</div>

						<div>
							<h4>내용 :</h4>
							<textarea class="form-control" rows="10" name="news_content"
								id="news_content" onkeyup="preview2();"></textarea>

						</div>

						<div style="margin-top: 10px;">
							<input class="btn btn-info" type="button" value="목록보기"
								onclick="location.href='list.do'"> <input
								class="btn btn-primary" type="button" value="글올리기"
								onclick="send(this.form);">
						</div>

						<div></div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="basic">
		<form class="post">
			<div id="box">
				<!-- Bootstrap Panel -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>미리보기</h4>
					</div>
					<div class="panel-body">

						<div>
							<h4 class="title">제목 :</h4>
							<div class="title_name" id="news_title_retrun"></div>
						</div>

						<div>
							<h4>내용 :</h4>
							<div class="form-control" id="news_content_return"></div>
						</div>


						<div></div>
					</div>
				</div>
			</div>
		</form>
	</div>


	<script>

	function ClipboardClear(){
		window.navigator.clipboard.clearPrimaryClip();
	}
    function uploadS3(f) {
        let image = f.image.value;
        let imageUrl_return = '';
        if (image == "") {
            alert("사진을 선택하세요!!");
            return;
        }
        
        var form = $('#image')[0].files[0];
		var formData = new FormData();
		
		
		formData.append('image', form);
        
        $.ajax({
        	type : 'post',
			url		:	"uploadS3.do",
			enctype:'multipart/form-data',
			data	:	formData,
			processData: false,
	        contentType: false,
			success	:	function(data){
				console.log(data.imageUrl);
				// imageUrl_return = imageUrl;
				//$("#b_content").append("<br>"+"<img src='"+ data.imageUrl +"'/>");
				window.navigator.clipboard.writeText("<img src='"+ data.imageUrl +"'/>").then(() => {
			        // 복사가 완료되면 호출된다.
			       alert("이미지 url 복사완료");
			       //$("#b_content").append(navigator.clipboard.readText());
			       $("#url_sum").append("<a>" + data.imageUrl + "</a>");
				});
			},
			error	:	function(err){alert(err.responseText);
			}
		});
    }
  
</script>


</body>
</html>
