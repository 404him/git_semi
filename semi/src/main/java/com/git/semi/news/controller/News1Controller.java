package com.git.semi.news.controller;

import com.git.semi.news.service.News1Service;
import com.git.semi.news.vo.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class News1Controller {

    private final News1Service news1Service;

    @Autowired
    public News1Controller(News1Service news1Service) {
        this.news1Service = news1Service;
    }


    /**
     * 뉴스 전체 조회
     * @return
     */
    @RequestMapping("/news/list.do")
    public String newsList(Model model) {

        List<NewsVo> newsList = news1Service.selectAll();

        model.addAttribute("newsList", newsList);

        return "news/newsList";
    }

    /**
     * 카테고리별 뉴스 조회
     */
    @RequestMapping("/news/category/list.do")
    public String newsCategoryList(int category_idx, Model model) {

        List<NewsVo> news_clist = news1Service.selectAllByCategoryIdx(category_idx);

        model.addAttribute("news_clist", news_clist);

        return "news/newsCategoryList";
    }

    /**
     * 뉴스 상세 조회
     */
    @RequestMapping("/news/one.do")
    public String newsOne(int news_idx, Model model) {

        NewsVo news = news1Service.selectOne(news_idx);

        model.addAttribute("news", news);

        return "news/news.jsp";
    }




}