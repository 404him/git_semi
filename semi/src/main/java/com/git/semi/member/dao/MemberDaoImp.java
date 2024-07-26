package com.git.semi.member.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.git.semi.member.vo.MemberVo;

@Repository
public class MemberDaoImp implements MemberDao {

	private final SqlSession sqlSession;
	
	@Autowired
	public MemberDaoImp(SqlSession sqlSession) { 
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.member_login_insert",vo);
	}

	@Override
	public MemberVo selectMemId(String mem_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_id",mem_id);
	}

	@Override
	public MemberVo selectMemNickname(String mem_nickname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_nickname",mem_nickname);
	}
}
