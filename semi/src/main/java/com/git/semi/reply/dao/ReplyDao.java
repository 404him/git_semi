package com.git.semi.reply.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.git.semi.reply.vo.ReplyVo;

@Repository
public class ReplyDao {
	
private final SqlSession sqlSession;

	
	@Autowired
    public ReplyDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	public List<ReplyVo> selectList(int news_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reply.reply_list", news_idx);
	}
	
	
	
	public int insert(ReplyVo vo) {
				
		return sqlSession.insert("reply.reply_insert", vo);
	}
	
	public int delete(int rpy_idx) {

		return sqlSession.delete("reply.reply_delete",rpy_idx);
	}


    public ReplyVo selectOne(int rpy_idx) {
        return sqlSession.selectOne("reply.reply_modify_select_one", rpy_idx);
    }


	public int update(ReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("reply.reply_update", vo);
	}
	
}
