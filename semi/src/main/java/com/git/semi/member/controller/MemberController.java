package com.git.semi.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.git.semi.member.dao.MemberDaoImp;
import com.git.semi.member.vo.MemberVo;
import com.git.semi.util.uploadImage.ImageService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	private final HttpSession session;
	private final MemberDaoImp member_dao;
	private final ImageService imageService;
	
	
	
	@Autowired
	public MemberController(HttpSession session,
							MemberDaoImp member_dao,
							ImageService imageService) {
		this.session = session;
		this.member_dao =  member_dao;
		this.imageService = imageService;
	}
	
	// 아이디 중복체크 json
	@RequestMapping(value = "check_id.do",
					produces="application/json; charset=utf-8;" )
	@ResponseBody
	public String check_id(String mem_id) {
		
		MemberVo vo = member_dao.selectMemId(mem_id);
		
		boolean bResult = (vo==null);
		
		JSONObject json = new JSONObject();
		json.put("result", bResult);
		
		return json.toString();
	}
	
	// 닉네임 중복체크 json
	@RequestMapping(value = "check_nickname.do", produces = "application/json; charset=utf-8;")
	@ResponseBody
	public String check_nickname(String mem_nickname) {

		MemberVo vo = member_dao.selectMemNickname(mem_nickname);

		boolean bResult = (vo == null);

		JSONObject json = new JSONObject();
		json.put("result", bResult);

		return json.toString();
	
	}//end:닉네임 중복체크
	
	
	// 휴대폰 번호 중복체크
	@RequestMapping(value = "check_phone.do", 
					produces = "application/json; charset=utf-8;")
	@ResponseBody
	public String check_phone(String mem_phone) {

		MemberVo vo = member_dao.selectMemPhone(mem_phone);

		boolean bResult = (vo == null);

		JSONObject json = new JSONObject();
		json.put("result", bResult);

		return json.toString();
	}
	
	// 현재 사용중인 비밀번호 체크
	@RequestMapping(value = "check_pw.do", 
					produces = "application/json; charset=utf-8;")
	@ResponseBody
	public String check_pw(String mem_pwd,Integer mem_idx) {

//		MemberVo vo = member_dao.selectMemPwd(mem_idx);
		MemberVo vo = member_dao.selectProfile(mem_idx);
		
		boolean bResult = (vo.getMem_pwd().equals(mem_pwd));
		JSONObject json = new JSONObject();
		json.put("result", bResult);

		return json.toString();
}
	
	//로그인 폼 띄우기
	@RequestMapping("login_form.do")
	public String login_form() {
		
		return "member/member_login_form";
	}
	
	//로그인
	// /member/login.do?mem_id=?&mem_pwd=?
	@RequestMapping("login.do")
	public String login(String mem_id,
						String mem_pwd,
						RedirectAttributes ra) {

		/*
		 * MemberVo user = member_dao.selectMemId(mem_id);
		 * 
		 * if (user == null) {
		 * 
		 * // RedirectAttributes=> redirect시 parameter로 이용된다 ra.addAttribute("reason",
		 * "fail_id");
		 * 
		 * return "redirect:login_form.do"; }
		 * 
		 * // 비밀번호가 틀린경우 if (user.getMem_pwd().equals(mem_pwd) == false) {
		 * 
		 * ra.addAttribute("reason", "fail_pwd"); ra.addAttribute("mem_id", mem_id);
		 * 
		 * return "redirect:login_form.do"; }
		 */

		
		//계정 잠금 로직
		
		 MemberVo member = member_dao.account_lockCheck(mem_id);

	        if (member == null) {
	        	// RedirectAttributes=> redirect시 parameter로 이용된다
				ra.addAttribute("reason", "fail_id");

				return "redirect:login_form.do";
	        }

	        // member의 use 상태가 n 일경우
	        if (member.getMem_use().equals("n")) {
	        	
	        	ra.addAttribute("reason", "lock_account");
	        	
	            return "redirect:login_form.do";
	        }

	        // member의 pw가 일치하지 않을경우
	        if (!member.getMem_pwd().equals(mem_pwd)) {
	        	member_dao.fail_lockCount(mem_id);	// lock 카운트를 1씩 증가
	          
	        	// member에 해당하는 id를 조회해서 member에 저장
	        	member = member_dao.account_lockCheck(mem_id);
	        	// 확인된 lockcount가 5이상일 경우에는 계정상태를 y -> n 처리
	            if (member.getMem_lockcount() >= 5) {
	            	member_dao.account_lock(mem_id);
	            	
	            	ra.addAttribute("reason", "account_lock");
	            	
	                return "redirect:login_form.do";
	            }

	            ra.addAttribute("reason", "fail_pwd");

				return "redirect:login_form.do";
	        }

	        // 로그인에 성공 했을경우 해당 id의 카운트는 초기화
	        member_dao.resetLockCount(mem_id);
	    
		// 로그인처리: 현재 로그인된 객체(user)정보를 session저장
		session.setAttribute("user", member);

		return "redirect:../main.do";

	}//end:로그인
	
	// 비밀번호 찾기 폼 띄우기
	@RequestMapping("pw_search_form.do")
	public String pw_search_form() {
		
		return "member/member_pw_search_form";
	}
	
	//비밀번호 찾기 json
	@RequestMapping(value = "search_pw.do",
			 		produces = "application/json; charset=utf-8;")
	@ResponseBody
	public String search_pw(String mem_id,
							String mem_phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("mem_phone", mem_phone);
		
		
		List<String> search_pw = member_dao.selectSearchPw(map);

		//boolean bResult = (search_pw != null && !search_pw.isEmpty());
		
		JSONObject json = new JSONObject();
		json.put("result", search_pw);
		
		return json.toString();
	}//end:비밀번호 찾기 json
	
	
	// 회원가입 폼 띄우기
	@RequestMapping("insert_form.do")
	public String insert_form() {
		
		return "member/member_insert_form";
	}
	
	
	// 회원가입
	@RequestMapping("insert.do")
	public String insert(MemberVo vo) {
		
		String mem_grade = vo.getMem_grade().trim();
		vo.setMem_grade(mem_grade);
				
		
		// 이미지 추가 안 했을 경우 
		if(vo.getMem_img_url() == null) {
			vo.setMem_img_url("https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/default_member_image.jpg");
		}
		
		int res = member_dao.insert(vo);
		
		return "redirect:../main.do";
	}//end:회원가입
	
	
	
	// 회원 프로필 페이지
	@RequestMapping("profile.do")
	public String profile(Model model,int mem_idx,RedirectAttributes ra) {
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if (user == null) {
			
			ra.addAttribute("reason","session_timeout");
			return "redirect:login_form.do";
			
		}
		
		MemberVo vo = member_dao.selectProfile(mem_idx);
		
		model.addAttribute("vo",vo);
		
		return "member/member_profile";
	
	}//end:회원 프로필
	
	
	// 회원 프로필 수정폼 이동
	@RequestMapping("profile_update_form.do")
	public String profile_update_form(int mem_idx,RedirectAttributes ra,Model model) {
		
		if (session.getAttribute("user") == null) {
			
			ra.addAttribute("reason","session_timeout");
			return "redirect:login_form.do";
		}
		
		MemberVo vo = member_dao.selectProfile(mem_idx);
		
		model.addAttribute("vo",vo);
		
		return "member/member_profile_form";
	}
	
	// 회원 프로필 수정
	@RequestMapping("profile_update.do")
	public String profile_update(MemberVo vo,
								 int mem_idx,
								 RedirectAttributes ra,
								 Model model) {
		
	
		// 세션만료 시 수정하지 않고 로그인 폼 이동
		if (session.getAttribute("user") == null) {
				
			ra.addAttribute("reason","session_timeout");
			
			return "redirect:login_form.do";
			
		}
		
		int res = member_dao.selectProfileUpdate(vo);
		
		
		  if (res > 0 ) {
			  session.removeAttribute("user"); 
			  session.setAttribute("user",vo);
		  
		  }
		 
		ra.addAttribute("mem_idx", mem_idx);
		
		return "redirect:profile.do";
	}
	
	// 회원 이미지 수정
	@RequestMapping(value = "member_img_update.do", 
			produces = "application/json; charset=utf-8;")
	@ResponseBody
	public String member_img_update(MultipartFile image,RedirectAttributes ra) {
		
			MemberVo userMember = (MemberVo)session.getAttribute("user");
			
			if (session.getAttribute("user") == null) {
				
				ra.addAttribute("reason","session_timeout");
				
				return "redirect:login_form.do";
				
			}
			
			int mem_idx = userMember.getMem_idx();
			
		// 1. db에서 이미지 url을 가져와서 default image인지 비교한다.
		String mem_image_url = member_dao.selectImageUrlByMemIdx(mem_idx);
		
		if(!mem_image_url.equals("https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/default_member_image.jpg")) {
			// s3 삭제
			imageService.deleteImageFromS3(mem_image_url);
		}
		
		// s3에 이미지 추가.
			String s3Url = imageService.uploadS3(image);
		// member에 imageurl을 update한다.
		int result = member_dao.updateImageUrl(s3Url, mem_idx);
		
	
		return String.valueOf(result);
	}
	
		
	
	// 회원 삭제
	@RequestMapping("member_delete.do")
	public String member_delete(int mem_idx,RedirectAttributes ra, MultipartFile image) {
		
		
		if (session.getAttribute("user") == null) {
				
			ra.addAttribute("reason","session_timeout");
				
			return "redirect:login_form.do";

		}
		
		// 1. db에서 이미지 url을 가져와서 default image인지 비교한다.
		String mem_image_url = member_dao.selectImageUrlByMemIdx(mem_idx);
		
		if(!mem_image_url.equals("https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/default_member_image.jpg")) {
			// s3 삭제
			imageService.deleteImageFromS3(mem_image_url);
		}
		
		int res = member_dao.deleteOneMember(mem_idx);
		
		if (res > 0) {
			session.removeAttribute("user");
		}
		
		
		
		return "redirect:../main.do";
	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logout() {
		
		session.removeAttribute("user");
		
		return "redirect:../main.do";
	}
	
}
