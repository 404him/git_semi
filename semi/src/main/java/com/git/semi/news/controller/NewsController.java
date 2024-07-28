package com.git.semi.news.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.git.semi.member.vo.MemberVo;
import com.git.semi.news.service.NewsService;
import com.git.semi.news.vo.NewsVo;

@Controller
public class NewsController {

    private final NewsService newsService;

    @Autowired
	HttpSession session;
    
    @Autowired
    public NewsController(NewsService newsService) {
        this.newsService = newsService;
    }
    
    @RequestMapping("/news/insert_form.do")
    public String newsInsertForm() {
    	
    	return "news/newsInsert_form";
    }
    
    @RequestMapping("insert.do")
    public String insert(NewsVo vo,RedirectAttributes ra) {
    	
		/*
		 MemberVo user = (MemberVo) session.getAttribute("user");
		 
		 if(user==null) {
		 
		 ra.addAttribute("reason", "session_timeout");
		 
		 return "redirect:../member/member_login_form.do"; } //사용자정보 vo에 등록
		 vo.setMem_idx(user.getMem_idx()); vo.setMem_name(user.getMem_name());
		 */
		String news_content = vo.getNews_content().replaceAll("\n", "<br>");
		vo.setNews_content(news_content);
    	
		//DB insert
		int res = newsService.insert(vo);
    	
    	return "redirect:list.do";
    }
    
}
