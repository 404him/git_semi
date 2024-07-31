<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="../resources/member/css/member_login_form.css">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
   
   function send(f){
	   
	   let mem_id   = f.mem_id.value.trim();
	   let mem_pwd  = f.mem_pwd.value.trim();
	   
	   if(mem_id==''){
		   alert("아이디를 입력하세요");
		   f.mem_id.value="";
		   f.mem_id.focus();
		   return;
	   }
	   
	   if(mem_pwd==''){
		   alert("비밀번호를 입력하세요");
		   f.mem_pwd.value="";
		   f.mem_pwd.focus();
		   return;
	   }
	   	   
	   
	   f.action="login.do";  
	   f.submit();
	   
   }//end:send()

</script>


<script type="text/javascript">
  //javascript 초기화
  //window.onload = function(){};
  
  //jQuery 초기화
  $(document).ready(function(){
	  
	  //showMessage();
	  setTimeout(showMessage,100);//0.1초후에 메시지 띄워라
	  
  });
  
  function showMessage(){
	  // /member/login_form.do?reason=fail_id => "true"
	  if("${ param.reason == 'fail_id'}" == "true"){
		  alert("아이디가 없습니다");
	  }		
	  
	  // /member/login_form.do?reason=fail_pwd => "true"
	  if("${ param.reason == 'fail_pwd'}" == "true"){
		  alert("비밀번호가 틀립니다");
	  }	
	  
	  // /member/login_form.do?reason=session_timeout
	  if("${ param.reason == 'session_timeout'}" == "true"){
		  alert("로그아웃되었습니다\n로그인을 다시 해주세요");
	  }	
	  
  }

</script>




</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<hr>
<div id="content-wrap-area">
	<form>
		<div class="main_box">
			<div class="login_box">
			<div class="login_logo"><img src="../resources/member/세미로고.png"></div>
				
                <div class="login_login">Login</div>

				<div class="login_id_box">
					<input class="login_id" type="text" name="mem_id" placeholder="아이디">
				</div>
				<div class="login_pw_box">
					<input class="login_pw" type="password" name="mem_pwd" placeholder="비밀번호"> 
				</div>
				
				<div class="login_btn_box">
					 <input class="login_btn" type="button" value="Login" onclick="send(this.form);"> 
				<!-- 	<button class="login_btn">Login</button> -->
				</div>
				
                <div class="or_box">
				<hr>&nbsp;&nbsp;&nbsp;<span class="or">OR</span>&nbsp;&nbsp;&nbsp;<hr>
                </div>
				<div class="sign_up_box">
					<span>계정이 없으신가요?</span><a href="insert_form.do" class="sign_up"> 가입하기 </a>
				</div>
				
				<div class="f_pw_box">
					<a href="pw_search_form.do" class="f_pw"> 비밀번호를 잊어 버리셨나요?  </a>
				</div>
			</div>
		</div>
	</form>
<br><br><br><br>
</div>

<!-- TODO : 푸터바 -->
<jsp:include page="../common/footer.jsp"/>

</body>
</html>