package com.git.semi.news.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.git.semi.news.dao.NewsDao;
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
	 
	 
}
