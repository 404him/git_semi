package com.git.semi.member.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.git.semi.member.dao.MemberDaoImp;
import com.git.semi.member.vo.MemberVo;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	private final HttpSession session;
	private final MemberDaoImp member_dao;
	
	
	
	@Autowired
	public MemberController(HttpSession session,
							MemberDaoImp member_dao) {
		this.session = session;
		this.member_dao =  member_dao;
	}
	
	// 임시 메인페이지
	@RequestMapping("test_list.do")
	public String test_list() {
		
		return "member/member_test_list";
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

		MemberVo user = member_dao.selectMemId(mem_id);

		if (user == null) {

			// RedirectAttributes=> redirect시 parameter로 이용된다
			ra.addAttribute("reason", "fail_id");

			return "redirect:login_form.do";
		}

		// 비밀번호가 틀린경우
		if (user.getMem_pwd().equals(mem_pwd) == false) {

			ra.addAttribute("reason", "fail_pwd");
			ra.addAttribute("mem_id", mem_id);

			return "redirect:login_form.do";
		}

		// 로그인처리: 현재 로그인된 객체(user)정보를 session저장
		session.setAttribute("user", user);

		return "redirect:test_list.do";

	}
	
	
	
	// 회원가입 폼 띄우기
	@RequestMapping("insert_form.do")
	public String insert_form() {
		
		return "member/member_insert_form";
	}
	
	
	// insert.do?mem_img_url=&mem_name=test&mem_zipcode=test&mem_addr=setes&mem_birth=2024-08-01
	// 회원가입
	@RequestMapping("insert.do")
	public String insert(MemberVo vo) {
		
		// 이미지 추가 안 했을 경우 
		if(vo.getMem_img_url() == null) {
			vo.setMem_img_url("https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/default_member_image.jpg");
		}
		
		System.out.println(vo.toString());
		
		int res = member_dao.insert(vo);
		
		return "redirect:test_list.do";
	}
	
	
	
}
