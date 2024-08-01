package com.git.semi.news.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.git.semi.news.vo.CategoryVo;
import com.git.semi.news.vo.NewsVo;
import com.git.semi.news.vo.SubscribeVo;

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
	
	public List<NewsVo> selectAllBySubscribeIdx(int mem_idx) {
		return sqlSession.selectList("news.news_subscribe_list", mem_idx);
	}
	

	public int delete(int news_idx) {

		return sqlSession.delete("news.news_delete",news_idx);
	}


    public NewsVo selectOne(int news_idx) {
        return sqlSession.selectOne("news.news_modify_select_one", news_idx);
    }


	public int update(NewsVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("news.news_update", vo);
	}
	
//	 -------구독---------
//	구독확인
	public int checkMemberIsSubscribe(SubscribeVo vo) {
        return sqlSession.selectOne("news.check_subscribe",vo);
    }
//  구독 추가
    public int insertSubscribe(int mem_idx, int reporter_idx) {
    	Map map = new HashMap();
    	map.put("mem_idx", mem_idx);
    	map.put("reporter_idx", reporter_idx);
    	return sqlSession.insert("news.insert_subscribe", map);
    }
//  구독 취소
    public int deleteSubscribe(int mem_idx, int reporter_idx) {
        Map map = new HashMap();
        map.put("mem_idx", mem_idx);
        map.put("reporter_idx", reporter_idx);
        return sqlSession.delete("news.delete_subscribe",map);
    }
	
	
	
}
