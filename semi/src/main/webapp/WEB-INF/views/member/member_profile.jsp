<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>

    <link rel="stylesheet" href="../resources/member/css/member_profile.css">

<script type="text/javascript">
	
	function update_profile(f){
		
		let mem_idx = f.mem_idx.value;
		
		
		location.href='profile_update_form.do?mem_idx=' + mem_idx
	
	}
	
	
	
	function del(){

		
		if(confirm("정말 탈퇴 하시겟습니까?\n확인을 누르면 탈퇴가 진행됩니다") == false){
			return;
		}
		
		alert("탈퇴 되었습니다.")
		
		location.href="member_delete.do?mem_idx=" + ${ vo.mem_idx }
		
	}


</script>


</head>
<body>
    
    <div class="memp_box">
        <div class="memp_main">
            <span class="memp_page">기본정보</span>
            <div class="memp_member">
                <div class="memp_img_box">
                <img class="memp_img" src="${ vo.mem_img_url }">
                </div>  
                <div class="memp_nickname_box">
                    <span class="memp_nickname">
                        ${ vo.mem_nickname }
                    </span>
                </div>        
                <div class="memp_img_update_box">
                <input class="memp_img_update" type="button" value="사진수정" onclick="update_photo()">      
            </div>
            </div>
            
        <div class="memp_profile_box">
            <div class="memp_profile">
                <span class="s_profile">Name.</span><span class="memp_profile_name">${ vo.mem_name }</span>
            </div> 
            <hr>
            <div class="memp_profile">
                <span class="s_profile">Nickname.</span><span class="memp_profile_nickname">${ vo.mem_nickname }</span>
            </div>
            <hr>
            <div class="memp_profile">
                <span class="s_profile">Member.</span><span class="memp_profile_member">${ vo.mem_grade }</span>
            </div>
            <hr>
            <div class="memp_profile">
                <span class="s_profile">Cell.</span><span class="memp_profile_phone">${ vo.mem_phone }</span>
            </div>
            <hr>
            <div class="memp_profile">
                <span class="s_profile">zipcode.</span><span class="memp_profile_zipcode">${ vo.mem_zipcode }</span>
            </div>
            <hr>
            <div class="memp_profile">
                <span class="s_profile">addr.</span><span class="memp_profile_addr">${ vo.mem_addr }</span>
            </div>
            <hr>
            <div class="memp_profile">
                <span class="s_profile">Birth.</span><span class="memp_profile_birth">${ vo.mem_birth }</span>
            </div>
            <hr>
            <div class="memp_profile">
                <span class="s_profile">가입일.</span><span class="memp_profile_regdate">${ vo.mem_regdate }</span>
            </div>
            <hr>
            
            <c:if test="${ vo.mem_grade eq '기자' }">
            <div class="memp_profile">
                <span class="s_profile">작성한 기사 수.</span><span class="memp_profile_news"></span>
            </div>
            </c:if>
            
            <form>
            <input type="hidden" name="mem_idx" value="${ vo.mem_idx }">
            <div class="memp_button_box">
                <input class="memp_update" type="button" value="회원정보 수정" onclick="update_profile(this.form)">
                <input class="memp_delete" type="button" value="회원 탈퇴" onclick="del();">
            </div>
            </form>
            
        </div>

    
        </div>

    </div>
</body>
</html>