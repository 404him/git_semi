package com.git.semi.news.service;


import com.git.semi.news.dao.News1Dao;
import com.git.semi.news.dao.NewsDao;
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



}
