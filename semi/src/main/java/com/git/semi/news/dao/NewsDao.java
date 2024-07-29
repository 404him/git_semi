package com.git.semi.news.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.git.semi.news.vo.CategoryVo;
import com.git.semi.news.vo.NewsVo;

@Repository
public class NewsDao {
	
	private final SqlSession sqlSession;

	
	@Autowired
    public NewsDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	
	public int insert(NewsVo vo) {
				
		return sqlSession.insert("news.news_insert", vo);
	}
	
	public List<CategoryVo> category_list() {
		return sqlSession.selectList("news.news_category");
	}


	public int delete(int news_idx) {

		return sqlSession.delete("news.news_delete",news_idx);
	}


    public NewsVo selectOne(int news_idx) {
        return sqlSession.selectOne("news.news_modify_select_one", news_idx);
    }
}
