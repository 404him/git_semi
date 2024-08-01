package com.git.semi.reply.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.git.semi.news.service.News1Service;
import com.git.semi.news.vo.NewsLikeVo;
import com.git.semi.reply.dao.ReplyDao;
import com.git.semi.reply.service.ReplyService;
import com.git.semi.reply.vo.ReplyLikeVo;
import com.git.semi.reply.vo.ReplyVo;

@Controller
@RequestMapping("/reply/")
public class ReplyController {
	
	
	private final ReplyService replyService;

    @Autowired
    public ReplyController(ReplyService replyService) {
        this.replyService = replyService;
    }

		@Autowired
		ReplyDao reply_dao;
		
		@Autowired
		HttpServletRequest request;
		
				
		//  /reply/list.do?
		@RequestMapping("list.do")
		public String list(int news_idx,
				              Model model) {
			
			
			List<ReplyVo> list = replyService.selectList(news_idx);
			
			
			model.addAttribute("list", list);
					
			return "reply/reply_list";
		}
		
		// /comment/insert.do?cmt_content=내용&b_idx=5&mem_idx=2&mem_name=일길동
		@RequestMapping(value="insert.do" , produces="application/json; charset=utf-8;")
		@ResponseBody
		public String insert(ReplyVo vo) {
		
			String rpy_content = vo.getRpy_content().replaceAll("\n", "<br>");
			vo.setRpy_content(rpy_content);
			
			int res = replyService.insert(vo);
			
			JSONObject json = new JSONObject();
			json.put("result", res==1); // {"result": true } or {"result": false }
			
			
			return json.toString();
		}
		
		@RequestMapping(value="delete.do" , produces="application/json; charset=utf-8;")
		@ResponseBody
		public String delete(int rpy_idx) {
			
			System.out.println(rpy_idx);
			int res = replyService.delete(rpy_idx);
			
			JSONObject json = new JSONObject();
			json.put("result", res==1); // {"result": true } or {"result": false }
			
			
			return json.toString();
		}
		
		
		
//		댓글  좋아요  기능
		
		// 댓글 좋아요 여부 확인
		@RequestMapping(value = "/reply/check_member_isLike_reply.do",
	            produces = "application/json; charset=utf-8;")
	    @ResponseBody
	    public String check_member_isLike_news(ReplyLikeVo vo) {

	        int result = replyService.checkMemberIsLikeReply(vo);
	        return (result > 0 ? "true" : "false");
	    }
		
		// 댓글 좋아요 하기 취소
		@RequestMapping(value = "/reply/rpy_like_on_off.do",
				produces = "application/json; charset=utf-8;")
		@ResponseBody
		public String news_like_on_off(String thumbsColor, int rpy_idx, int news_idx) {
			
			int result = replyService.rpy_like_on_off(thumbsColor, rpy_idx, news_idx);
			
			return String.valueOf(result);
		}
		
		// 좋아요 갯수 카운트
		@RequestMapping(value = "/reply/rpy_like_count.do",
	            produces = "application/json; charset=utf-8;")
	    @ResponseBody
	    public int rpy_like_count(int rpy_idx) {
	        int count = replyService.news_like_count(rpy_idx);

	        return count;
	    }
		
		
	}
	
