package com.git.semi.news.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.git.semi.news.dao.NewsDao;
import com.git.semi.news.vo.CategoryVo;
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
	 
	 
}
