package com.git.semi.member.dao;

import java.util.List;
import java.util.Map;

import com.git.semi.member.vo.MemberVo;

public interface MemberDao {

	
	int insert(MemberVo vo);
	
	MemberVo selectMemId(String mem_id);
	
	MemberVo selectMemNickname(String mem_nickname);
	
	MemberVo selectMemPhone(String mem_phone);
	
	List<String> selectSearchPw(Map<String, Object> map);
	
	MemberVo selectProfile(int mem_idx);
	
	public int selectProfileUpdate(MemberVo vo);

	public int deleteOneMember(int mem_idx);
	
	public MemberVo selectMemPwd(int mem_idx);


	List<MemberVo> selectLockMem();
}
