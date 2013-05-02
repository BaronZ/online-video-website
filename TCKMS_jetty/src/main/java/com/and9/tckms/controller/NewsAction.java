package com.and9.tckms.controller;

import java.util.ArrayList;

import com.and9.tckms.entity.VideoSubject;
import com.and9.tckms.service.NewsService;
import com.and9.tckms.service.VideoTypeService;

public class NewsAction extends BaseAction{
	
	private NewsService newsService=new NewsService();
	private VideoTypeService videoTypeService=new VideoTypeService();
	
	public String init(){
		
		if(Session.get("navbar")==null){
			ArrayList<VideoSubject> videoSubjects=videoTypeService.getAllVideoSubject();
			Session.put("navbar",videoSubjects);
		}
		
		Request.put("newsList", newsService.getNews2Index(0, 10));
		
		return "init";
		
	}
	
	public String detail(){
		
		int news_id=1;
		
		try {
			Object o=getServletRequest().getParameter("news_id");
			System.out.println(o);
			if(o!=null){
				news_id=Integer.parseInt(o.toString());
			}
			
		} catch (NumberFormatException e) {
			// TODO: handle exception
			System.out.println("抛异常啦");
			throw e;
		}
		Request.put("news", newsService.getNewsById(news_id));
		return "detail";
	}
}
