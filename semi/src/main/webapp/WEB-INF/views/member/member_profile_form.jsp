<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>프로필 수정</title>

<link rel="stylesheet" href="../resources/member/css/member_profile_form.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
	
	//	let nickname = 0;
		let pw = 0;
	//	let phone = 0;
		
		 $(document).ready(function(){
			  
			  //showMessage();
			  setTimeout(showMessage,100);//0.1초후에 메시지 띄워라
			  
		  });
		  
		  function showMessage(){
			  
			  // /member/login_form.do?reason=session_timeout
			  if("${ param.reason == 'session_timeout'}" == "true"){
				  alert("로그아웃되었습니다\n로그인을 다시 해주세요");
			  }	
			  
		  }
		
		// 닉네임 변경 클릭시 활성화
		function nickname_update(){

			$("#mem_nickname1").prop("disabled", false);
			

				  // 토글 할 버튼 선택 (btn1)

				  const nick_update = document.getElementById('nick_update');
				  const nick_check = document.getElementById('nick_check');

				  

				  // btn1 숨기기 (display: none)

				  if(nick_update.style.display !== 'none') {

					  nick_update.style.display = 'none';

					  nick_check.style.display = 'block';
				  }
			
		}
		
		
		// 닉네임 중복확인
		function check_nickname(){
			
			
			
			let mem_nickname = $("#mem_nickname1").val().trim();
			
			if(mem_nickname == "") {
		        alert("공백은 입력하실수 없습니다")
				$("#mem_nickname1").val("");
		        $("#mem_nickname1").focus();
				return;
			}
			
			if(mem_nickname.length < 2 ) {
		        alert("닉네임은 최소 2글자이상 입력해 주세요")
				$("#mem_nickname1").val("");
		        $("#mem_nickname1").focus();
				return;
			}
			
		    if(mem_nickname.length > 10 ) {
		        alert("닉네임은 최대 10글자 이하로 입력해 주세요")
				$("#mem_nickname1").val("");
		        $("#mem_nickname1").focus();
				return;
			}
		
			$.ajax({
				url		:	"check_nickname.do",		    
				data	:	{"mem_nickname":mem_nickname},	// parameter -> check_id.do?mem_nickname=?
				dataType:	"json",
				success	:	function(res_data){
					if(res_data.result) {
						if(confirm("사용가능한 닉네임 입니다 사용하시겠습니까?") == false){
		                    return;
		                }
						$("#nickname_check").prop("disabled", true)
						$("#mem_nickname1").prop("disabled", true)
		
					} else {
		                if(confirm("현재 사용중인 닉네임 입니다")){
		                    $("#mem_nickname1").val("");
		                    $("#mem_nickname1").focus();
		                    return;
		                }
					}
				},
				error	:	function(err){
					alert("다시한번 시도해 주세요.");
				}
			});
		}// end:mem_nickname()
	
		// 비밀번호 일치 확인
	    function check_pwd(f){
	
	        let mem_pw1 = $("#mem_pw1").val().trim();
	        let mem_pw2 = f.mem_pwd.value.trim();
	        let mem_idx	= f.mem_idx.value;
	        
	        if(mem_pw2 == ""){
				alert("공백은 입력할 수 없습니다");
				mem_pw2.value="";
				return;
	        }
	        
	        
	        $.ajax({
	            url: "check_pw.do",
	            data: {"mem_pwd": mem_pw1 ,"mem_idx" : mem_idx},
	            dataType: "json",
	            success: function(res_data) {
	                if (res_data.result) {
	                    if (confirm("변경하신 비밀번호를 사용 하시겠습니까?") == false) {
	                        $("#mem_pw2").val("");
	                        $("#mem_pw2").focus();
	                        return;
	                    }
	                    $("#mem_pw1").prop("disabled", true);
	                    $("#mem_pw2").prop("disabled", true);
	                    pw = pw + 1;
	                } else {
	                    alert("현재 사용중인 비밀번호가 일치하지 않습니다.");
	                }
	            },
	            error: function(err) {
	                alert("잠시후 다시 시도해주세요");
	            }
	        });
	        
	        
		}//end:check_pwd()
	
	
    	// 휴대폰번호 정규식 체크,ajax 중복확인
	function check_phone(){

		const phoneNumberPattern = /^\d{3}-\d{3,4}-\d{4}$/;
		
		let phone_check = $("#mem_phone1").val().trim();
		
		if (phoneNumberPattern.test(phone_check) == false) {
			alert("휴대폰 번호또는 - 를확인해 주세요")
			$("#mem_phone1").focus();
			return;
		}
		
		$.ajax({
			url		:	"check_phone.do",		    
			data	:	{"mem_phone":phone_check},
			dataType:	"json",
			success	:	function(res_data){
				if(res_data.result) {

					if (phoneNumberPattern.test(phone_check) == true) {
						alert("인증되었습니다.")
						$("#phone_check1").prop("disabled", true)
						$("#mem_phone1").prop("disabled", true)
						return;
					}
					

				} else {
                    if(confirm("현재 사용중인 전화번호 입니다")){
                        $("#mem_phone1").val("");
                        $("#mem_phone1").focus();
                        return;
                    }
				}
			},
			error	:	function(err){
				alert("현재 번호는 사용 할 수 없습니다 다른 번호를 사용해 주세요");
			}
		});
		
	}//end:check_phone()
	

     // 우편번호 API
    	function send_zipcode() {
    		
    	    new daum.Postcode({
    	        oncomplete: function(data) {
    	        	// input 태그에 넣는 것이니 value 값을 넣어야 한다.
    	        	$("#mem_zipcode1").val(data.zonecode);
    	        	$("#mem_addr1").val(data.address);
    	        }
    	    }).open();
    	}// end:send_zipcode()

    	
    	function send_update(f) {
		
        let mem_nickname = f.mem_nickname.value.trim();
		let mem_pwd 	 = f.mem_pwd.value.trim();
		let mem_phone    = f.mem_phone.value;
		let mem_zipcode  = f.mem_zipcode.value.trim();
		let mem_addr 	 = f.mem_addr.value.trim();
		let mem_grade	 = f.mem_grade.value.trim();
		let mem_idx		 = f.mem_idx.value;
		
		if(mem_nickname == ""){
			alert("닉네임을 입력하세요");
			f.mem_nickname.value="";
			f.mem_nickname.focus();
			return;
		}
		
		if(mem_phone == ""){
			alert("전화번호을 입력하세요");
			f.mem_phone.value="";
			f.mem_phone.focus();
			return;
		}	
		
		if(mem_pwd == ""){
			alert("비밀번호를 입력하세요");
			f.mem_pwd.value="";
			f.mem_pwd.focus();
			return;
		}
		
		
		if(mem_zipcode == ""){
			alert("우편번호를 입력하세요");
			f.mem_zipcode.value="";
			f.mem_zipcode.focus();
			return;
		}
		
		if(mem_addr == ""){
			alert("주소를 입력하세요");
			f.mem_addr.value="";
			f.mem_addr.focus();
			return;
		}

	
		
		
		// 닉네임을 인증하지 않고 바로 수정버튼 클릭시 경고창
		if (!$("#mem_nickname1").prop("disabled")) {
			alert("닉네임 중복확인을 해주세요");
			return;
		}
		
		// 비밀번호 인증을 하지 않고 바로 수정버튼을 누를시 경고창
		if (!$("#mem_phone1").prop("disabled")) {
			alert("전화번호를 인증을 해주세요");
			return;
		}
		
		
		
		
		
		
		if(pw == 1){
			$("#mem_pw2").prop("disabled", false);
			$("#mem_nickname1").prop("disabled", false);
		} else{
			if(alert("비밀번호를 확인하세요"));
			return;
		}
		
		
			$("#mem_nickname1").prop("disabled",false);
			$("#mem_phone1").prop("disabled", false);
	
			 
			f.method="POST";
			f.action="profile_update.do";
			f.submit();
		
		
	}//end:send
    	
    	
    	
</script>


</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<hr>
<div id="content-wrap-area">
    <div class="profile_update_box">
        <h1>프로필 수정</h1>
    
        <form>
        <input type="hidden" name="mem_idx" value="${ vo.mem_idx }">
            <hr>
            <div class="profile_update">
                <span class="s_box">ID</span>
                <input class="profile_update_id" type="text" value="${ vo.mem_id }" disabled="disabled">
            </div>
            <hr>
            <div class="profile_update">
                <span class="s_box">이름</span>
                <input class="profile_update_name" type="text" value="${ vo.mem_name }" disabled="disabled">
            </div>
            <hr>
            <div class="profile_update">
                <span class="s_box">*닉네임</span>
                <input class="profile_update_nickname" type="text" id="mem_nickname1" name="mem_nickname" value="${ user.mem_nickname }"
                 placeholder="닉네임을 입력해 주세요" disabled="disabled">
                 
               	<div class="nickname_btn_box">
                <input class="profile_update_nickname_btn" type="button" id="nick_update" value="닉네임 변경" onclick="nickname_update()">
                <input class="profile_update_check_btn" type="button" id="nick_check" value="중복확인" onclick="check_nickname()">
                </div>
            </div>
            <hr>
            <div class="profile_update">
                <span class="s_box">*전화번호</span>
                <input class="profile_update_phone" type="text" id="mem_phone1" name="mem_phone" value="${ user.mem_phone }"
                 disabled="disabled">
                 
                 <div class="phone_update_btn_box">
                 <input class="phone_btn" type="button" id="phone_update1" value="변경" onclick="phone_update()">
   	             <input class="profile_update_phone_btn" id="phone_check1" type="button" value="인증" onclick="check_phone()">
            	 </div>
            </div>
            <hr>
            <div class="profile_update">
               <span class="s_box">*비밀번호</span>
                <input class="profile_update_pw"  type="password" id="mem_pw1"  placeholder="현재 비밀번호 입력">
                <input class="profile_update_pw2" type="password" id="mem_pw2" name="mem_pwd" placeholder="새 비밀번호를 입력" >
                <input class="profile_update_pw_btn" type="button" value="확인" onclick="check_pwd(this.form)">
            </div>
            <hr>
            <div class="profile_update">
                <span class="s_box">생년월일</span>
                 <input class="profile_update_birth" type="text" value="${ vo.mem_birth }" disabled="disabled">
             </div>
             <hr>
            <div class="profile_update_zipcode_box">
                <span class="s_box">우편번호</span>
                <input class="profile_update_zipcode" type="text" id="mem_zipcode1" name="mem_zipcode" value="${ vo.mem_zipcode }" disabled="disabled">
             <!--    <input class="profile_update_zipcode_btn" type="button" value="찾기" onclick="send_zipcode()"> -->
            </div>
            <div class="profile_update_addr_box">
               <span class="s_box">상세주소</span>
                <input class="profile_update_addr" type="text" name="mem_addr" value="${ vo.mem_addr }" disabled="disabled">
            </div>
            <hr>
            <div class="profile_update">
                <span class="s_box">*등급</span>
                <select name="mem_grade" class="profile_update_member">
                    <option value="${ user.mem_grade }">${ user.mem_grade }</option>
                    <option value="일반">일반</option>
                    <option value="기자">기자</option>
                </select>
            </div>
            <hr>
            <div class="profile_update_btn_box">
                <input class="profile_update_btn" type="button" value="수정" onclick="send_update(this.form)">
                <input class="profile_update_btn" type="button" value="목록" onclick="location.href='profile.do?mem_idx=${ user.mem_idx }'">
            </div>
        </form>
    </div>
    </div>

<br><br><br><br>
<!-- TODO : 푸터바 -->
<jsp:include page="../common/footer.jsp"/>

<script type="text/javascript">


	//휴대폰 변경 버튼 클릭시 활성화
	function phone_update() {
		$("#mem_phone1").prop("disabled", false);

		// 토글 할 버튼 선택 (btn1)
		const phone_update_btn = document.getElementById('phone_update1');
		const phone_check_btn = document.getElementById('phone_check1');

		// btn1 숨기기 (display: none)
		if (phone_update_btn.style.display !== 'none') {
			phone_update_btn.style.display = 'none';
			phone_check_btn.style.display = 'block';
		}
	}
	
</script>

</body>
</html>