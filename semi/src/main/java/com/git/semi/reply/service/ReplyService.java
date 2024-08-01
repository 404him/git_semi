package com.git.semi.reply.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.git.semi.reply.dao.ReplyDao;
import com.git.semi.reply.vo.ReplyLikeVo;
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
	
	// 댓글 좋아요 여부 확인
    public int checkMemberIsLikeNews(ReplyLikeVo vo) {
        return replyDao.checkMemberIsLikeReply(vo);
    }

	// 댓글 좋아요 하기 / 취소
	public int rpy_like_on_off(String thumbsColor, int mem_idx, int news_idx) {
        // 좋아요한 뉴스일 경우 - 좋아요 취소
        if(thumbsColor.equals("#1f2f4d")) {
            return replyDao.deleteNewsLike(mem_idx, news_idx);
        }else {
            // 뉴스를 좋아요할 경우 - 좋아요
            return replyDao.insertNewsLike(mem_idx, news_idx);
        }
	
    // 댓글 좋아요 갯수 카운트
    public int news_like_count(int news_idx) {
            return replyDao.news_like_count(news_idx);
        }

	
	
	
	
	
	
}
