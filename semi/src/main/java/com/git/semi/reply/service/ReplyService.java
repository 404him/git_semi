package com.git.semi.reply.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.git.semi.reply.dao.ReplyDao;
import com.git.semi.reply.vo.ReplyVo;

@Service
public class ReplyService {
	
	private final ReplyDao replyDao;
	
	 @Autowired
	    public ReplyService(ReplyDao replyDao) {
	        this.replyDao = replyDao;
	    }
	
	 
	 public List<ReplyVo> selectList(int news_idx){
		 return replyDao.selectList(news_idx);
	 }
	 
	 
	 
	public int insert(ReplyVo vo) {
		 return replyDao.insert(vo);
	}

	public int delete(int rpy_idx) {
		return replyDao.delete(rpy_idx);
	}
	
   public ReplyVo selectOne(int rpy_idx) {
       return replyDao.selectOne(rpy_idx);
   }

	public int update(ReplyVo vo) {
		return replyDao.update(vo);
	}
	

	
	
	
	
	
	
}
