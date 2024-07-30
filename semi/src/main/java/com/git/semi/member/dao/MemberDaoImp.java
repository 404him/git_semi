package com.git.semi.member.dao;


import java.util.List;
import java.util.Map;

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
	
	// 회원가입
	@Override
	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.member_login_insert",vo);
	}

	// id 중복체크
	@Override
	public MemberVo selectMemId(String mem_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_id",mem_id);
	}

	// 닉네임 중복체크
	@Override
	public MemberVo selectMemNickname(String mem_nickname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_nickname",mem_nickname);
	}

	// 휴대폰 중복체크
	@Override
	public MemberVo selectMemPhone(String mem_phone) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_phone",mem_phone);
	}

	// 비밀번호 찾기
	@Override
	public List<String> selectSearchPw(Map<String, Object> map) {
		return sqlSession.selectList("member.member_search_pw",map);
	}

	// 회원 프로필 조회
	@Override
	public MemberVo selectProfile(int mem_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_profile",mem_idx);
	}

	// 회원 프로필 업데이트
	public int selectProfileUpdate(MemberVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.member_profile_update",vo);
	}

	// 회원 삭제
	@Override
	public int deleteOneMember(int mem_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.member_delete",mem_idx);
	}

	// 현재 사용중인 비밀번호 확인
	@Override
	public MemberVo selectMemPwd(int mem_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_user_pw",mem_idx);
	}


}
