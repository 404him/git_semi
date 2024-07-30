<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="../resources/member/css/member_pw_search_form.css">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
   
   function search_pw(){
	   
	   let mem_id    = $("#mem_id1").val().trim();
	   let mem_phone = $("#mem_phone1").val().trim();
	   
	   
	   if(mem_id == ''){
		   alert("아이디를 입력하세요");
		   $("#mem_id1").val("");
		   $("#mem_id1").focus();
		   return;
	   }
	   
	   if(mem_phone == ''){
		   alert("전화번호를 입력하세요");
		   $("#mem_phone1").val("");
		   $("mem_phone1").focus();
		   return;
	   }
	   
	 $.ajax({
		url		:	"search_pw.do",
		data	:	{"mem_id":mem_id,"mem_phone":mem_phone},
		dataType: 	"json",
		success	:	function(res_data){
			let mem_pwd = res_data.result;
			
			if(res_data.result !=false){

			if(confirm("찾으신 비밀번호는 [ " + mem_pwd + " ] 입니다.\n확인을 누르시면 로그인 페이지로 돌아갑니다." ) == false){
				return;
				} 

			location.href = "login_form.do";
			
			} else{
				alert("아이디 또는 전화번호가 틀립니다.")
				return;
			}
				
		},
		error	:	function(err){
			alert("잠시후 다시 시도해주세요.")
		}
	 
	 });
	   
	   
   } //end:send()

</script>


</head>
<body>
	<form>
		<div class="main_box">
			<div class="search_box">
			<div class="login_logo"><img src="../resources/member/세미로고.png"></div>
				
                <div class="pw_search">비밀번호 찾기</div>

				<div class="search_id_box">
					<input class="search_id" type="text" id="mem_id1" name="mem_id" placeholder="아이디를 입력하세요">
				</div>
				<div class="search_phone_box">
					<input class="search_phone" type="text" id="mem_phone1" name="mem_phone" placeholder="전화번호를 입력하세요"> 
				</div>
				
				<div class="search_btn_box">
					 <input class="search_btn" type="button" value="Search" onclick="search_pw()"> 
				<!-- 	<button class="login_btn">Login</button> -->
				</div>
			
			</div>
		</div>
	</form>

</body>
</html>