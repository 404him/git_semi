package com.git.semi.news.dao;


import com.git.semi.news.vo.NewsVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class News1Dao {


    private final SqlSession sqlSession;

    @Autowired
    public News1Dao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }


    public List<NewsVo> selectAll() {
        return sqlSession.selectList("news.news_list");
    }

    public List<NewsVo> selectAll(int category_idx) {
        return sqlSession.selectList("news.news_category_list", category_idx);
    }

    public NewsVo selectOne(int news_idx) {
        return sqlSession.selectOne("news.news_one", news_idx);
    }
}
