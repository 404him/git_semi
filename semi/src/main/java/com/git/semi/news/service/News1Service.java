package com.git.semi.news.service;


import com.git.semi.news.dao.News1Dao;
import com.git.semi.news.dao.NewsDao;
import com.git.semi.news.vo.NewsLikeVo;
import com.git.semi.news.vo.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class News1Service {

    private final News1Dao news1Dao;

    @Autowired
    public News1Service(News1Dao news1Dao) {
        this.news1Dao = news1Dao;
    }


    public List<NewsVo> selectAll() {
        return news1Dao.selectAll();
    }

    public List<NewsVo> selectAllByCategoryIdx(int category_idx) {
        return news1Dao.selectAll(category_idx);
    }

    public NewsVo selectOne(int news_idx) {
        return news1Dao.selectOne(news_idx);
    }


    public int checkMemberIsLikeNews(NewsLikeVo vo) {
        return news1Dao.checkMemberIsLikeNews(vo);
    }

    public int news_like_on_off(String heartColor, int mem_idx, int news_idx) {
        // 좋아요한 뉴스일 경우 - 좋아요 취소
        if(heartColor.equals("red")) {
            return news1Dao.deleteNewsLike(mem_idx, news_idx);
        }else {
            // 뉴스를 좋아요할 경우 - 좋아요
            return news1Dao.insertNewsLike(mem_idx, news_idx);
        }

    }

    public int news_like_count(int news_idx) {
        return news1Dao.news_like_count(news_idx);
    }

    public int news_count_up(int news_idx) {
        return news1Dao.news_count_up(news_idx);
    }

    public List<NewsVo> news_search(String news_search_text) {
        return news1Dao.news_search(news_search_text);
    }
}
