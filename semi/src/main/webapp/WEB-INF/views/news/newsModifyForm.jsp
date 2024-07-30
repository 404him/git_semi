<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>뉴스 등록하기</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

	$(document).ready(function(){
		
		let news_content = $("#news_content").val();
		
		
			
	
	
	});

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
		
		let category_idx = f.category_idx.value;
		
		//textarea 안에 img 태그 가져오기 정규식
		const regexr = /(https?):\/\/([^:\/\s]+)(:([^\/]*))?((\/[^\s/\/]+)*)?\/?([^#\s\?]*)(\?([^#\s]*))?(#(\w*))?/ig;
		console.log("콘텐츠내용 : " +  news_content );
		console.log(news_content.match(regexr));
		
		
		var imagechangeArray = news_content.match(regexr)
			console.log("어레이 이미지 : " + imagechangeArray[0]);
		for (let i = 0; i <= imagechangeArray.length-1; i++) {
			$("#url_sum").append("<input type='hidden' name='url' value='" + imagechangeArray[i]);
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
		
		if(category_idx=="none"){
			alert("카테고리를 선택해주세요");
			return;
		}
		
		
		f.action = "modify.do";
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
			<input type="hidden"  name="news_idx"  value="${ vo.news_idx }">
				<div id="url_sum" style="display: none;" >
						
					</div>
			<div id="box">
				<!-- Bootstrap Panel -->
				<div class="panel panel-primary">
					<h4>기사 수정하기</h4>
					<div class="panel-body">
						
						<div>
							<a>카테고리 : </a>
							<select id="category" name="category_idx">
								<option value="none">==카테고리==</option>
								<c:forEach var="category" items="${ categoryVo }">
									<c:if test="${category.category_idx == vo.category_idx }">
										<option value="${category.category_idx }" selected >${category.category_name }</option>
									</c:if>
									<c:if test="${category.category_idx != vo.category_idx }">
										<option value="${category.category_idx }">${category.category_name }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>

						<div>
							<h4 class="title">제목 :</h4>
							<input class="title_name" name="news_title" id="news_title" value="${vo.news_title}"
								onkeyup="preview1();">
						</div>

						<div>
							<h4>내용 :</h4>
							<textarea class="form-control" rows="10" name="news_content"
								id="news_content" onkeyup="preview2();">${vo.news_content}</textarea>

						</div>

						<div style="margin-top: 10px;">
							<input class="btn btn-info" type="button" value="목록보기"
								onclick="location.href='list.do'"> <input
								class="btn btn-primary" type="button" value="수정하기"
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
							<div class="title_name" id="news_title_retrun">${vo.news_title}</div>
						</div>

						<div>
							<h4>내용 :</h4>
							<div class="form-control" id="news_content_return">${vo.news_content}</div>
						</div>


						<div></div>
					</div>
				</div>
			</div>
		</form>
	</div>


	<script>

	function ClipboardClear(){
		window.navigator.clipboard.writeText("");
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
			url		:	"../s3/uploadS3.do",
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
			      // $("#url_sum").append("<input type='hidden' name='url' value='" + data.imageUrl + "'>");
				});
			},
			error	:	function(err){alert(err.responseText);
			}
		});
    }
  
</script>


</body>
</html>
