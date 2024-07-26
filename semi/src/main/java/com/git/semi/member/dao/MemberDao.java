package com.git.semi.member.dao;

import com.git.semi.member.vo.MemberVo;

public interface MemberDao {

	
	int insert(MemberVo vo);
	
	MemberVo selectMemId(String mem_id);
	
	MemberVo selectMemNickname(String mem_nickname);
	
}
