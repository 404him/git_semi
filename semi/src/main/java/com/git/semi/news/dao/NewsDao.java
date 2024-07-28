package com.git.semi.news.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.git.semi.news.vo.NewsVo;

@Repository
public class NewsDao {
	
	private final SqlSession sqlSession;

	
	@Autowired
    public NewsDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	
	public int insert(NewsVo vo) {
		return sqlSession.insert("new.news_insert", vo);
	}
}
