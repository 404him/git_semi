package com.git.semi.news.controller;

import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.git.semi.member.vo.MemberVo;
import com.git.semi.news.service.NewsService;
import com.git.semi.news.vo.CategoryVo;
import com.git.semi.news.vo.NewsVo;
import com.git.semi.news.vo.SubscribeVo;
import com.git.semi.util.uploadImage.ImageService;

@Controller
public class NewsController {

    private final NewsService newsService;
    private final ImageService imageService;
    private final HttpSession session;
    
    
    @Autowired
    public NewsController(NewsService newsService, ImageService imageService, HttpSession session) {
        this.newsService = newsService;
		this.imageService = imageService;
		this.session = session;
    }
    
    
    
    // 구독한 기자 뉴스 리스트 조회
    @RequestMapping("/news/subscribe_list.do")
    public String subscribe_list(int mem_idx, Model model){
    	
    	
    	
    	List<SubscribeVo> newsList = newsService.selectAllBySubscribeIdx(mem_idx);

         model.addAttribute("newsList", newsList);

         return "news/newsSubscribeListView";
    }
    

    
    @RequestMapping("/news/insert_form.do")
    public String newsInsertForm(Model model) {
    	
    	List<CategoryVo> categoryVo = newsService.category_list();
    	
    	model.addAttribute("categoryVo", categoryVo);
    	
    	return "news/newsInsertForm";
    }
    
    @RequestMapping("/news/insert.do")
    public String insert(NewsVo vo, @RequestParam(name="url") List<String> list ,RedirectAttributes ra) {
    	
		
		 MemberVo user = (MemberVo) session.getAttribute("user");
		 
		 if(user==null) {
		 
		 ra.addAttribute("reason", "session_timeout");
		 
		 return "redirect:../member/login_form.do"; } //사용자정보 vo에 등록
		 vo.setMem_idx(user.getMem_idx());
		
    	
    	
    	
		String news_content = vo.getNews_content().replaceAll("\n", "<br>");
		vo.setNews_content(news_content);
		
		String news_thumbnail_image = (String) list.get(0);
		vo.setNews_thumbnail_image(news_thumbnail_image);
    	int result = newsService.insert(vo);
    	
		
    	//DB insert
    	if(result > 0 && !list.isEmpty()) {
				for( String imageUrl : list ) {
    			
    			imageService.save(imageUrl,vo.getNews_idx());
    		}
    	}

    	return "redirect:/main.do";
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
    	
    	return "redirect:/main.do";
    }
    
    
   
    
  
    //수정폼 띄우기
  	@RequestMapping("/news/modify_form.do")
  	public String modify_form(int news_idx, Model model) {
  	
  		
  		//idx에 해당되는 게시물 1건 얻어오기
  		NewsVo vo = newsService.selectOne(news_idx);
  		
  		//idx에 맞는 선택된 카테고리 가져오기
  		List<CategoryVo> categoryVo = newsService.category_list();

  		// news_idx에 일치하는 s3attechment ImageUrl가져오기
  		List<String> s3AttechmentList = imageService.getFileUrlByNewsIdx(news_idx);
  		//System.out.println("사진 사이즈 : " + s3AttechmentList.size());	List의 갯수 확인 가능
  		//System.out.println("get0 사진 : " + s3AttechmentList.get(0));	사진url은  get( 숫자 ) 로  확인 가능
  		
  		//for( String img : s3AttechmentList) {
  		//	System.out.println(img);
  		//}
  		
  		// textarea \n기능처리 : <br> -> \n변환
  		String content = vo.getNews_content().replaceAll("<br>", "\n");
  		vo.setNews_content(content);
  		
  		

  		//3.request binding
  		model.addAttribute("vo", vo);	// news_idx에 해당하는  news 데이터 포장
  		model.addAttribute("categoryVo", categoryVo); // 수정 시 선택가능한 카테고리 리스트 포장
  		model.addAttribute("s3AttechmentList", s3AttechmentList); // news_idx에 해당하는 imgUrl List객체로 포장하여 전송
  		
  		
  		return "news/newsModifyForm";
  	}
  	
	
	
	  // 뉴스 수정하기
	  // /news/detail.do?news_idx=8
  	
	  @RequestMapping("/news/modify.do")
	  public String modify(NewsVo vo, @RequestParam(name="url") List<String> newList ,RedirectAttributes ra) {

		  vo.setNews_title(vo.getNews_title());
		  vo.setCategory_idx(vo.getCategory_idx());
		  vo.setCategory_name(vo.getCategory_name());
		  
		  String news_content = vo.getNews_content().replaceAll("\n", "<br>");
		  vo.setNews_content(news_content);
		
		//System.out.println(news_thumbnail_image);
		  
	  // 1. vo에 있는 news_idx로 s3attachment에 있는 이미지를 전부 삭제.
	  // 
		List<String> oldList = imageService.getFileUrlByNewsIdx(vo.getNews_idx());
		

		List<String> oldNoneMatchList = oldList.stream().filter(o -> newList.stream()
				.noneMatch(Predicate.isEqual(o))).collect(Collectors.toList());

		List<String> newNoneMatchList = newList.stream().filter(n -> oldList.stream()
				.noneMatch(Predicate.isEqual(n))).collect(Collectors.toList());

		
		
		System.out.println("현재 뉴스 idx : " + vo.getNews_idx());
		
		// 반복문으로 S3에 해당 url을 가진 이미지 제거.
    	for(String url : oldNoneMatchList) {
    		imageService.deleteImageFromS3(url);
    	}
    	
    	// s3Attechment 테이블에서 이미지 삭제.
       	for(String url : oldNoneMatchList) {
    	imageService.deleteByUrl(url);
       	}
       	
       	// s3Attechment 테이블에 이미지 추가
       	if(newNoneMatchList.size() > 0 ) {
       		for( String imageUrl : newNoneMatchList ) {
       			
       			imageService.save(imageUrl,vo.getNews_idx());
       		}
       	}
       	List<String> changeList = imageService.getFileUrlByNewsIdx(vo.getNews_idx());
       	
       	// 썸네일 넣기
       	String news_thumbnail_image = (String) changeList.get(0);
       	vo.setNews_thumbnail_image(news_thumbnail_image);
       	
       	
       	int result = newsService.update(vo);
		ra.addAttribute("news_idx", vo.getNews_idx());
		
		
		return "redirect:detail.do";
	  }
	 
	  
	  //  --------------- 구독----------------
	  
	  
	  
	    // 구독여부 확인/news/check_Subscribe.do
	  
	  	@RequestMapping(value = "/news/check_Subscribe.do", produces = "application/json; charset=utf-8;")
	    @ResponseBody
	    public String check_Subscribe(SubscribeVo vo) {

	        int result = newsService.checkMemberIsSubscribe(vo);
	        return (result > 0 ? "true" : "false");
	    }

	  
	  
	    // 뉴스 좋아요/취소 하기.
	     
	    @RequestMapping(value = "/news/news_subscribe_on_off.do",
	            produces = "application/json; charset=utf-8;")
	    @ResponseBody
	    public String subscribe_on_off(String subscribe_checked, int mem_idx, int reporter_idx) {
	    		
	    	
	    	System.out.println("reporter_idx : " + subscribe_checked);
	    	System.out.println("mem_idx : " + mem_idx);
	    	System.out.println("reporter_idx : " + reporter_idx);
	        int result = newsService.subscribe_on_off(subscribe_checked, mem_idx, reporter_idx);
	        
	        return String.valueOf(result);
	    }
	    
	    
  	}
  	
