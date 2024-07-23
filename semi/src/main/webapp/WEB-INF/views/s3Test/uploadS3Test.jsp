<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>S3 업로드 테스트</title>
</head>
<body>
<form method="POST"  enctype="multipart/form-data">
    <div>
        S3 업로드할 이미지 : <input type="file" name="image">
    </div>

<div>
    <input type="button" value="s3에 이미지 올리기" onclick="uploadS3(this.form);">
</div>
</form>


<script>
    function uploadS3(f) {
        let image = f.image.value;

        if (image == "") {
            alert("사진을 선택하세요!!");
            return;
        }

        f.action = "uploadS3.do";
        f.submit();
    }

</script>
</body>
</html>
