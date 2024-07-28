package com.git.semi.news.controller;

import com.git.semi.news.service.News1Service;
import com.git.semi.news.vo.NewsLikeVo;
import com.git.semi.news.vo.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller

public class News1Controller {

    private final News1Service news1Service;

    @Autowired
    public News1Controller(News1Service news1Service) {
        this.news1Service = news1Service;
    }


    /**
     * 뉴스 리스트 조회
     * @return
     */
    @RequestMapping("/news/list.do")
    public String newsList(Model model) {

        List<NewsVo> newsList = news1Service.selectAll();

        model.addAttribute("newsList", newsList);

        return "news/newsListView";
    }

    /**
     * 카테고리별 뉴스 리스트 조회
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
    @RequestMapping("/news/detail.do")
    public String newsOne(int news_idx, Model model) {

        NewsVo vo = news1Service.selectOne(news_idx);


        model.addAttribute("vo", vo);

        return "news/newsDetailView";
    }

    /**
     * 뉴스 조회 수 증가
     */
    @RequestMapping(value = "/news/count_up.do",
            produces = "application/json; charset=utf-8;")
    @ResponseBody    public String newsCountUp(int news_idx) {
        int result = news1Service.news_count_up(news_idx);

        return String.valueOf(result);
    }



    /**
     * 뉴스 좋아요한 사용자 조회
     */
    @RequestMapping(value = "/news/check_member_isLike_news.do",
            produces = "application/json; charset=utf-8;")
    @ResponseBody
    public String check_member_isLike_news(NewsLikeVo vo) {

        int result = news1Service.checkMemberIsLikeNews(vo);
        return (result > 0 ? "true" : "false");
    }

    /**
     * 뉴스 좋아요 갯수
     */
    @RequestMapping(value = "/news/news_like_count.do",
            produces="application/json; charset=utf-8;")
    @ResponseBody
    public int news_like_count(int news_idx) {
        int count = news1Service.news_like_count(news_idx);

        return count;
    }




    /**
     * news_like_on_off
     * 뉴스 좋아요/취소 하기.
     */
    @RequestMapping(value = "/news/news_like_on_off.do",
            produces="application/json; charset=utf-8;")
    @ResponseBody
    public String news_like_on_off(String heartColor, int mem_idx, int news_idx) {

        int result = news1Service.news_like_on_off(heartColor, mem_idx, news_idx);

        return String.valueOf(result);
    }
}
