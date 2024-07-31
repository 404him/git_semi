package com.git.semi.reply.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.git.semi.reply.dao.ReplyDao;
import com.git.semi.reply.vo.ReplyVo;

@Controller
@RequestMapping("/reply/")
public class ReplyController {

		@Autowired
		ReplyDao reply_dao;
		
		@Autowired
		HttpServletRequest request;
		
				
		//  /reply/list.do?
		@RequestMapping("list.do")
		public String list(int news_idx,
				              Model model) {
			
			
			List<ReplyVo> list = reply_dao.selectList(news_idx);
			
			
			model.addAttribute("list", list);
					
			return "reply/reply_list";
		}
		
		// /comment/insert.do?cmt_content=내용&b_idx=5&mem_idx=2&mem_name=일길동
		@RequestMapping(value="insert.do" , produces="application/json; charset=utf-8;")
		@ResponseBody
		public String insert(ReplyVo vo) {
		
			String rpy_content = vo.getRpy_content().replaceAll("\n", "<br>");
			vo.setRpy_content(rpy_content);
			
			int res = reply_dao.insert(vo);
			
			JSONObject json = new JSONObject();
			json.put("result", res==1); // {"result": true } or {"result": false }
			
			
			return json.toString();
		}
		
		@RequestMapping(value="delete.do" , produces="application/json; charset=utf-8;")
		@ResponseBody
		public String delete(int rpy_idx) {
			
			System.out.println(rpy_idx);
			int res = reply_dao.delete(rpy_idx);
			
			JSONObject json = new JSONObject();
			json.put("result", res==1); // {"result": true } or {"result": false }
			
			
			return json.toString();
		}
		
	}
	
