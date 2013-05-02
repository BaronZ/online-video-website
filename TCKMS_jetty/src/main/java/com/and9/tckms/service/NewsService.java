package com.and9.tckms.service;

import java.util.List;

import com.and9.tckms.dao.NewsDao;
import com.and9.tckms.entity.News;
import com.and9.tckms.factory.NewsDaoFactory;

public class NewsService {
	
	private NewsDao newsDao=NewsDaoFactory.getInstance().getNewsDao();
	
	public List<News> getNews2Index(int top ,int size){
		List<News> newsList=newsDao.getNewsList(top, size);
		return newsList;
	}
	
	
	public News getNewsById(int news_id){
		return newsDao.getNewsById(news_id);
	}
}
