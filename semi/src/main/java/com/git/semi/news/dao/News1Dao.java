package com.git.semi.news.dao;


import com.git.semi.news.vo.NewsLikeVo;
import com.git.semi.news.vo.NewsVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public int checkMemberIsLikeNews(NewsLikeVo vo) {
        return sqlSession.selectOne("news.check_news_like",vo);
    }

    public int deleteNewsLike(int mem_idx, int news_idx) {
        Map map = new HashMap();
        map.put("mem_idx", mem_idx);
        map.put("news_idx", news_idx);
        return sqlSession.delete("news.delete_news_like",map);
    }

    public int insertNewsLike(int mem_idx, int news_idx) {
        Map map = new HashMap();
        map.put("mem_idx", mem_idx);
        map.put("news_idx", news_idx);
        return sqlSession.insert("news.insert_news_like", map);
    }

    public int news_like_count(int news_idx) {
        return sqlSession.selectOne("news.news_like_count",news_idx);
    }

    public int news_count_up(int news_idx) {
        return sqlSession.update("news.news_count_up",news_idx);
    }
}
