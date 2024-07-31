<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="../resources/member/css/member_insert_form.css">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">

  
    let count = 0;  


    $(document).ready(function(){

        // 로그인 버튼 잠금
	  /* $("#btn_signup").prop("disabled", true) */

       $("#all_check").change(function(){
        if($("#all_check").is(":checked")){
            alert("개인정보 수집에 동의 하셨습니다.");
        }
    });
});


    
    // 이름 정규식 (한글2~4 영문혼합X)
    function check_name(){

    	const name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    	
		let name_check = $("#mem_name1").val().trim();
		
		if (name.test(name_check) == false) {
			alert("이름을 확인해 주세요")
			$("#mem_name1").focus();
			return;
		}
    	
    	
    }
    

	// 아이디 중복확인
	function check_id(){
			
		
		let mem_id = $("#mem_id1").val().trim();
		
		if(mem_id == "") {
			alert("공백은 입력 하실 수 없습니다.");
            $("#mem_id1").val("");
            $("#mem_id1").focus();
			return;
		}
		
		if(mem_id.length < 4) {
			alert("최소 4글자 이상 입력해 주세요")
            $("#mem_id1").val("");
            $("#mem_id1").focus();
			return;
		}
		
		
		$.ajax({
			url		:	"check_id.do",		
			data	:	{"mem_id":mem_id},	// parameter -> check_id.do?mem_id=?
			dataType:	"json",             // json 형태로 반환
			success	:	function(res_data){
				if(res_data.result) {
					
                    if(confirm("사용가능한 아이디 입니다 사용 하시겠습니까") == false){
                        $("#mem_id1").val("");
                        $("#mem_id1").focus();
                        return;
                    }
                        $("#mem_id1").prop("disabled", true)
                        $("#id_check").prop("disabled", true)
                        count = count + 1;

				} else {
					
                    if(confirm("현재 사용중인 아이디 입니다")){
                        $("#mem_id1").val("");
                        $("#mem_id1").focus();
                        return;
                    }
				}
			},
			error	:	function(err){
				alert("다시 한번 시도해 주세요");
			}
		});
		
		/* if ($("#id_check").prop("disabled", true)) {
			alert("이미 중복확인 하셨습니다")
			return;
		} */
		
		
	}// end:check_id()

	
    // 비밀번호 일치 확인
    function check_pwd(){

        let mem_pw = $("#mem_pw1").val().trim();
        let mem_pw2 = $("#mem_pw2").val().trim();
        
        
        if(mem_pw == mem_pw2){
            if(confirm("입력하신 비밀번호가 일치합니다. \n현재 입력하신 비밀번호를 사용하시겠습니까?.") == false){
				return;
            }
            $("#pwd_check").prop("disabled",true);
            $("#mem_pw1").prop("disabled",true);
            $("#mem_pw2").prop("disabled",true);
            count = count + 1;
            return;
        }else{
            alert("비밀번호가 일치하지 않습니다.");
            $("#mem_pw2").val();
            
        }

      

    }//end:check_pw()


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
                    count = count + 1;

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
						$("#phone_check").prop("disabled", true)
						$("#mem_phone1").prop("disabled", true)
						count = count + 1;
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
				alert("다시한번 시도해 주세요.");
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
	
    function send_signup(f) {
		
		let mem_name	 = f.mem_name.value.trim();
        let mem_id  	 = f.mem_id.value.trim();
		let mem_pwd 	 = f.mem_pwd.value.trim();
		let mem_phone    = f.mem_phone.value;
        let mem_nickname = f.mem_nickname.value.trim();
		let mem_zipcode  = f.mem_zipcode.value.trim();
		let mem_addr 	 = f.mem_addr.value.trim();
		let mem_birth	 = f.mem_birth.value;
		let mem_grade	 = f.mem_grade.value;
		
		if(mem_name == ""){
			alert("이름을 입력하세요");
			f.mem_name.value="";
			f.mem_name.focus();
			return;
		}
		
		if(mem_pwd == ""){
			alert("비밀번호를 입력하세요");
			f.mem_pwd.value="";
			f.mem_pwd.focus();
			return;
		}
		
		
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

		if(mem_birth == ""){
			alert("생년월일을 선택하세요")
			return;
		}
		 
		
		if (!$("#all_check").is(":checked")) {
			alert("개인정보 수집에 동의하세요")
			return;
	}
		if(count == 4){
			// 다 성공했을 경우 회원가입 직전 해당 prop false로 바꾸기.
			$("#mem_id1").prop("disabled", false);
			$("#mem_pw1").prop("disabled", false);
			$("#mem_nickname1").prop("disabled", false);
			$("#mem_phone1").prop("disabled", false);
			
			f.method="POST";
			f.action="insert.do";
			f.submit();
		} else {
				alert("모든 인증을 제대로 완료해 주세요");
		}
		
		
	}//end:send
 

</script>


</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<hr>
<div id="content-wrap-area">

    <form>
        <div class="login_insert_main">
            <div class="login_insert_title">
                
            <div><img src="../resources/member/세미로고.png"></div>
            
            <span class="s_name">이름</span>
            <div class="login_insert_name_box">
                <input class="login_insert_name" type="text" name="mem_name" placeholder="성함을 입력해 주세요">
            </div>

            <span class="s_id">아이디</span>
            <div class="login_insert_id_box">
                <input class="login_insert_id" type="text" id="mem_id1" name="mem_id" placeholder="사용하실 아이디를 입력해 주세요">
                <input class="btn_id" type="button" value="중복확인" id="id_check" onclick="check_id()"> 
            </div>

            <span class="s_pw">비밀번호</span>
            <span class="s_pw2">비밀번호 확인</span>
            <div class="login_insert_pw_box">
                <input class="login_insert_pw" type="password" id="mem_pw1" name="mem_pwd" placeholder="비밀번호"> 
                <input class="login_insert_pw2" type="password" id="mem_pw2" placeholder="비밀번호 확인"> 
                <input class="btn_nickname" type="button" value="확인" id="pwd_check" onclick="check_pwd()">
            </div>

            <span class="s_nickname">닉네임</span>
            <div class="login_insert_nickname_box">
                <input class="login_insert_nickname" type="text" id="mem_nickname1" name="mem_nickname" placeholder="사용하실 닉네임을 입력해 주세요">
                <input class="btn_nickname" type="button" value="중복확인" id="nickname_check" onclick="check_nickname()">
            </div>

            <span class="s_phone">휴대폰 번호</span>
            <div class="login_insert_phone_box">
                <input class="login_insert_phone" type="text" name="mem_phone" id="mem_phone1" placeholder="전화번호를 - 포함 입력해 주세요">
                
                <input class="btn_phone" type="button" value="인증" id="phone_check" onclick="check_phone();">
            </div>

            <span class="s_zipcode">우편번호</span>
            <div class="login_insert_zipcode_box">
                <input class="login_insert_zipcode" type="text" id="mem_zipcode1" name="mem_zipcode" placeholder="우편번호를 입력해 주세요">
                <input class="btn_zipcode" type="button" value="찾기" onclick="send_zipcode()">
            </div>

            <span class="s_addr">상세주소</span>
            <div class="login_insert_addr_box">
                <input class="login_insert_addr" type="text" id="mem_addr1" name="mem_addr" placeholder="상세주소를 입력해주세요">
            </div>

		
			<span class="s_addr">회원등급</span>
			<div>
			<select class="s_grade" name="mem_grade">
				<option value="일반">일반회원</option>
				<option value="기자">기자</option>
			</select>
			</div>
			
            <span class="s_birth">생년월일</span>
            <div class="login_insert_birth_box">
                <input class="login_insert_birth" type="date" name="mem_birth">
            </div>
            

            <div class="check_box">
                <span><b>개인정보 수집에 동의합니다</b> <input style='zoom:1.5;' type="checkbox" id="all_check"></span>
            </div>

            <div class="sign_up_box">
                <input id="btn_signup" class="sign_up" type="button" value="Sign Up" onclick="send_signup(this.form)">
            </div>

			

            </div>
        </div>


    </form>
</div>

<br><br><br><br>
<!-- TODO : 푸터바 -->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>