package com.git.semi.news.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.git.semi.news.dao.NewsDao;
import com.git.semi.news.vo.CategoryVo;
import com.git.semi.news.vo.NewsLikeVo;
import com.git.semi.news.vo.NewsVo;

@Service
public class NewsService {
	
	private final NewsDao newsDao;
	
	 @Autowired
	    public NewsService(NewsDao newsDao) {
	        this.newsDao = newsDao;
	    }
	 
	public int insert(NewsVo vo) {
		 return newsDao.insert(vo);
	}
	 
	public List<CategoryVo> category_list() {
		return newsDao.category_list();
	}

	public int delete(int news_idx) {
		return newsDao.delete(news_idx);
	}
	
    public NewsVo selectOne(int news_idx) {
        return newsDao.selectOne(news_idx);
    }

	public int update(NewsVo vo) {
		return newsDao.update(vo);
	}
	
	   public int checkMemberIsSubscribe(NewsLikeVo vo) {
	        return newsDao.checkMemberIsSubscribe(vo);
	    }

	    public int subscribe_on_off(String heartColor, int mem_idx, int reporter_idx) {
	        // 좋아요한 뉴스일 경우 - 좋아요 취소
	        if(heartColor.equals("red")) {
	            return newsDao.deleteSubscribe(mem_idx, reporter_idx);
	        }else {
	            // 뉴스를 좋아요할 경우 - 좋아요
	            return newsDao.insertSubscribe(mem_idx, reporter_idx);
	        }

	    }
	
	 
	 
}
