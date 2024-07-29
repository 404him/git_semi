package com.git.semi.news.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.git.semi.news.service.NewsService;
import com.git.semi.news.vo.CategoryVo;
import com.git.semi.news.vo.NewsVo;
import com.git.semi.util.uploadImage.ImageService;

@Controller
public class NewsController {

    private final NewsService newsService;
    private final ImageService imageService;
    

    @Autowired
	HttpSession session;
    
    @Autowired
    public NewsController(NewsService newsService, ImageService imageService) {
        this.newsService = newsService;
		this.imageService = imageService;
    }
    
    @RequestMapping("/news/insert_form.do")
    public String newsInsertForm(Model model) {
    	
    	List<CategoryVo> vo = newsService.category_list();
    	
    	model.addAttribute("vo", vo);
    	
    	return "news/newsInsertForm";
    }
    
    @RequestMapping("/news/insert.do")
    public String insert(NewsVo vo, @RequestParam(name="url") List<String> list ,RedirectAttributes ra) {
    	
		/*
		 MemberVo user = (MemberVo) session.getAttribute("user");
		 
		 if(user==null) {
		 
		 ra.addAttribute("reason", "session_timeout");
		 
		 return "redirect:../member/member_login_form.do"; } //사용자정보 vo에 등록
		 vo.setMem_idx(user.getMem_idx()); vo.setMem_name(user.getMem_name());
		 */
    	
    	
    	
		String news_content = vo.getNews_content().replaceAll("\n", "<br>");
		vo.setNews_content(news_content);
		String news_thumbnail_image = (String) list.get(0);
		vo.setNews_thumbnail_image(news_thumbnail_image);
		System.out.println(news_thumbnail_image);
    	
    	System.out.println("vo : " + vo.getNews_title());
    	System.out.println("vo : " + vo.getNews_thumbnail_image());
    	System.out.println("vo : " + vo.getNews_content());
    	System.out.println("vo : " + vo.getNews_createAt());
    	System.out.println("vo : " + vo.getCategory_idx());
    	System.out.println("vo : " + vo.getCategory_name());
    	
    	int result = newsService.insert(vo);
    	
    	System.out.println("insert 후 가져온 news_idx : "+vo.getNews_idx());
		
    	//DB insert
    	if(result > 0 && !list.isEmpty()) {
				for( String imageUrl : list ) {
    			
    			imageService.save(imageUrl,vo.getNews_idx());
    		}
    	}

    	 	

    	return "redirect:/news/list.do";
    }
    
    
    @RequestMapping("/news/delete.do")
    public String delete(int news_idx) {
    	
    	// news_idx에 해당하는 이미지url select해오기.
    	List<String> urls = imageService.getFileUrlByNewsIdx(news_idx);
    	
    	// 반복문으로 S3에 해당 url을 가진 이미지 제거.
    	for(String url : urls) {
    		imageService.deleteImageFromS3(url);
    	}
    	
    	
    	// s3Attechment 테이블에서 이미지 삭제.
    	imageService.deleteByNewsIdx(news_idx);
    	 	
    	
    	
    	// news 테이블 삭제.
    	newsService.delete(news_idx);
    	
    	return "redirect:/news/list.do";
    }
    
    
    
}
