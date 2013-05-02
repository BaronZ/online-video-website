package com.and9.tckms.dao;

import java.util.List;

import com.and9.tckms.entity.News;

public interface NewsDao {
	
	public List<News> getNewsList(int top,int size);
	
	public int getCountofAllNews();

	
	public News getNewsById(int news_id);
}
