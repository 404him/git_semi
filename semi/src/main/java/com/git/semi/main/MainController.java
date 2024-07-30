package com.git.semi.main;

import com.git.semi.news.service.News1Service;
import com.git.semi.news.vo.NewsVo;
import com.git.semi.util.openApi.NewsApiService;
import com.git.semi.util.openApi.NewsApiVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MainController {

    private final News1Service news1Service;
    private final NewsApiService newsApiService;

    @Autowired
    public MainController(News1Service news1Service, NewsApiService newsApiService) {
        this.news1Service = news1Service;
        this.newsApiService = newsApiService;
    }

    @RequestMapping("main.do")
    public String main(Model model) {

        // 뉴스 리스트 조회
        List<NewsVo> newsList = news1Service.selectAll();
        model.addAttribute("newsList", newsList);

        // 핫 뉴스 리스트 조회
        List<NewsApiVo> topList = newsApiService.getTopHeadLineNews();
        model.addAttribute("topList", topList);

        return "/common/mainPage";
    }


}
