package com.git.semi.news.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.git.semi.news.dao.NewsDao;
import com.git.semi.news.vo.CategoryVo;
import com.git.semi.news.vo.NewsVo;
import com.git.semi.news.vo.SubscribeVo;

@Service
public class NewsService {
	
	private final NewsDao newsDao;
	
	 @Autowired
	    public NewsService(NewsDao newsDao) {
	        this.newsDao = newsDao;
	    }
	 
	 
	 // 구독 기자 조회
	 
	 public List<NewsVo> selectAllBySubscribeIdx(int mem_idx) {
		 return newsDao.selectAllBySubscribeIdx(mem_idx);
		
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

	public int checkMemberIsSubscribe(SubscribeVo vo) {
		return newsDao.checkMemberIsSubscribe(vo);
	}

	public int subscribe_on_off(String subscribe_checked, int mem_idx, int reporter_idx) {
		// 구독한 기자일 경우 - 구독 취소
		if (subscribe_checked.equals("false")) {
			return newsDao.deleteSubscribe(mem_idx, reporter_idx);
		} else {
			// 기자를 구독할 경우 - 구독활성화
			return newsDao.insertSubscribe(mem_idx, reporter_idx);
		}
	}
	 
}
