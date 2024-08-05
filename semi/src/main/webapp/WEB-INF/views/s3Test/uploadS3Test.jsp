<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>S3 업로드 테스트</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
   #box{
      width: 600px;
      margin: auto;
      margin-top: 150px;
   }
 
   textarea {
	  resize: none;
   }
   
   h4{
      font-weight: bold;
   }
   
   form{
   	display: inline-block;
   }
 
</style>


<script type="text/javascript">

	function send(f){
		
		
		let b_subject = f.b_subject.value.trim();
		let b_content = f.b_content.value.trim();
		
		if(b_subject==''){
			alert("제목을 입력하세요!!");
			f.b_subject.value="";
			f.b_subject.focus();
			return;
		}
		
		if(b_content==''){
			alert("내용을 입력하세요!!");
			f.b_content.value="";
			f.b_content.focus();
			return;
		}
		
		f.action = "insert.do";
		f.submit(); //
		
		
	}


</script>

<script type="text/javascript">

 function preview1(){
	 
	 let b_subject = $("#b_subject").val();

	 $("#b_subject_retrun").val(b_subject);

}
 
 function preview2(){
 
	 let b_content = $("#b_content").val();
 	 let text = b_content.replaceAll("\n","<br>");
 
	 

	 $("#b_content_return").html(text);

}

</script>
<style>
	div#editor {
    	padding: 16px 24px;
        border: 1px solid #D6D6D6;
        border-radius: 4px;
    }
    #img-selector {
        display: none;
    }
     #editor img {
    	max-width: 100%;
    }
    button.active {
        background-color: purple;
        color: #FFF;
    }
</style>

</head>
<body>
<form method="POST"  enctype="multipart/form-data">
    <div>
        S3 업로드할 이미지 : <input type="file" name="image" id="image">
    </div>

<div>
    <input type="button" value="s3에 이미지 올리기" onclick="uploadS3(this.form);">
</div>
</form>


<form>
	<div id="box">
		<!-- Bootstrap Panel -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4>새글쓰기</h4>
			</div>
			<div class="panel-body">
			   
			   <div>
			      <h4>제목 :</h4>
			      <div class="form-control" name="b_subject" id="b_subject" onkeyup="preview1();"></div>
			   </div>
			   
			   <div>
			      <h4>내용 :</h4>
			      <textarea  class="form-control" rows="10" name="b_content" id="b_content" onkeyup="preview2();"></textarea>
			      	
			   </div>
			   
			   <div style="margin-top: 10px;">
			      <input class="btn btn-info"     type="button"  value="목록보기"  
			             onclick="location.href='list.do'">
			      <input class="btn btn-primary"  type="button"  value="글올리기"
			             onclick="send(this.form);">
			   </div>
			   
				<div>
				
				
				</div>			   
			</div>
		</div>
	</div>
</form>
	<form>
		<div id="box">
			<!-- Bootstrap Panel -->
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>미리보기</h4>
				</div>
				<div class="panel-body">

					<div>
						<h4>제목 :</h4>
						<input class="form-control" id="b_subject_retrun" >
					</div>

					<div>
						<h4>내용 :</h4>
						<div  class="form-control" id="b_content_return"></div>
					</div>


					<div></div>
				</div>
			</div>
		</div>
	</form>
	<div class="editor-menu">
    <button id="btn-bold">
        <b>B</b>
    </button>
    <button id="btn-italic">
        <i>I</i>
    </button>
    <button id="btn-underline">
        <u>U</u>
    </button>
    <button id="btn-strike">
        <s>S</s>
    </button>
    <button id="btn-ordered-list">
        OL
    </button>
    <button id="btn-unordered-list">
        UL
    </button>
    <button id="btn-image">
        IMG
    </button>
        <input id="img-selector" type="file" accept="image/*"/>
</div>
<div id="editor" contenteditable="true"></div>





<script>
    function uploadS3(f) {
        let image = f.image.value;
        console.log(image);
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
				//$("#b_content").append("<img src='"+ data.imageUrl +"'/>");
				
			},
			error	:	function(err){
				alert(err.responseText);
				
			}
			
		});
				
        
    }

</script>

<script>
    const editor = document.getElementById('editor');
    const btnBold = document.getElementById('btn-bold');
    const btnItalic = document.getElementById('btn-italic');
    const btnUnderline = document.getElementById('btn-underline');
    const btnStrike = document.getElementById('btn-strike');
    const btnOrderedList = document.getElementById('btn-ordered-list');
    const btnUnorderedList = document.getElementById('btn-unordered-list');
    const btnImage = document.getElementById('btn-image');
    const imageSelector = document.getElementById('img-selector');

    btnBold.addEventListener('click', function () {
        setStyle('bold');
    });

    btnItalic.addEventListener('click', function () {
        setStyle('italic');
    });

    btnUnderline.addEventListener('click', function () {
        setStyle('underline');
    });

    btnStrike.addEventListener('click', function () {
        setStyle('strikeThrough')
    });

    btnOrderedList.addEventListener('click', function () {
        setStyle('insertOrderedList');
    });

    btnUnorderedList.addEventListener('click', function () {
        setStyle('insertUnorderedList');
    });

    
    btnImage.addEventListener('click', function () {
        imageSelector.click();
    });
    
    editor.addEventListener('keydown', function () {
        checkStyle();
    });

    editor.addEventListener('mousedown', function () {
        checkStyle();
    });

    imageSelector.addEventListener('change', function (e) {
        const files = e.target.files;
        if (!!files) {
            insertImageDate(files[0]);
        }
    });
    function insertImageDate(file) {
        const reader = new FileReader();
        reader.addEventListener('load', function (e) {
            focusEditor();
            document.execCommand('insertImage', false, `${reader.result}`);
        });
        reader.readAsDataURL(file);
    }
    function setStyle(style) {
        document.execCommand(style);
        focusEditor();
        checkStyle();
    }


    function setStyle(style) {
        document.execCommand(style);
        focusEditor();
    }

    // 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
    function focusEditor() {
        editor.focus({preventScroll: true});
    }
    
    function checkStyle() {
        if (isStyle('bold')) {
            btnBold.classList.add('active');
        } else {
            btnBold.classList.remove('active');
        }
        if (isStyle('italic')) {
            btnItalic.classList.add('active');
        } else {
            btnItalic.classList.remove('active');
        }
        if (isStyle('underline')) {
            btnUnderline.classList.add('active');
        } else {
            btnUnderline.classList.remove('active');
        }
        if (isStyle('strikeThrough')) {
            btnStrike.classList.add('active');
        } else {
            btnStrike.classList.remove('active');
        }
        if (isStyle('insertOrderedList')) {
            btnOrderedList.classList.add('active');
        } else {
            btnOrderedList.classList.remove('active');
        }
        if (isStyle('insertUnorderedList')) {
            btnUnorderedList.classList.add('active');
        } else {
            btnUnorderedList.classList.remove('active');
        }
    }

    function isStyle(style) {
        return document.queryCommandState(style);
    }
</script>
</body>
</html>
