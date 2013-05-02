package com.and9.tckms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.and9.tckms.entity.Video;
import com.and9.tckms.entity.VideoSubject;
import com.and9.tckms.entity.VideoType;
import com.and9.tckms.service.NewsService;
import com.and9.tckms.service.VideoService;
import com.and9.tckms.service.VideoTypeService;


public class HomeAction extends BaseAction{
	
//	private String actionLink="";	//action的连接
//	private String vtid;				//视频类型id	
//	private int page;				//视频的页数
	private String key;				//搜索视频关键字

	private VideoService videoService=new VideoService();
	private VideoTypeService videoTypeService= new VideoTypeService();
	private NewsService newsService=new NewsService();
	
	
	public String Init(){
		if(Session.get("navbar")==null){
			ArrayList<VideoSubject> videoSubjects=videoTypeService.getAllVideoSubject();
			Session.put("navbar",videoSubjects);
		}
		
		Map<String, Object> map=videoService.getPageInfo2Index(0, 1);
		Map<String,Object> rmap=videoService.getRecommendVideos(1);
		Request.put("newsList", newsService.getNews2Index(0, 5));
		Request.put("vlist_recommend", (ArrayList<Video>)rmap.get(VideoService.VIDEO_LIST));
		Request.put("hotvlist", (ArrayList<Video>) videoService.getHotVideoList(0));
		Request.put("vlist_lately", (ArrayList<Video>) map.get(VideoService.VIDEO_LIST));
		Request.put("key", "请输入关键字");
		return SUCCESS;
		
	}
	
	public String VideoList(){
		System.out.println(getServletRequest().getParameter("page"));
		
		if(Session.get("navbar")==null){
			ArrayList<VideoType> videoTypeList=videoTypeService.getAllVideoType();
			Session.put("navbar",videoTypeList.toArray());
			System.out.println("导航栏");
		}
		
		int vtid=0;
		int page=1;
		
		try{
			vtid=Integer.parseInt(getServletRequest().getParameter("vtid"));
			Object object=getServletRequest().getParameter("page");
			if(object!=null)
				page=Integer.parseInt(object.toString());
		}catch (NullPointerException e1) {
			// TODO: handle exception
			System.out.println("空值啊！！！");
			throw e1;
		}catch (NumberFormatException e2) {
			// TODO: handle exception
			System.out.println("转不了啊！！！");
			throw e2;
		}
		
		Map<String, Object> map=videoService.getPageInfo2Index(vtid, page);
		
		Request.put("hotvlist", (ArrayList<Video>) videoService.getHotVideoList(vtid));
		Request.put("vlist", (ArrayList<Video>) map.get(VideoService.VIDEO_LIST));
		Request.put("curpage", Integer.parseInt(map.get(VideoService.CURRENT_PAGE).toString()));
		Request.put("btmpage", (int[]) map.get(VideoService.BOTTOM_PAGE));
		Request.put("alink", "Home_VideoList.action?vtid="+vtid);
		Request.put("vtid_key",vtid );
		Request.put("pagecount", Integer.parseInt(map.get(videoService.PAGE_COUNT).toString()));
		Request.put("vcount",Integer.parseInt(map.get(VideoService.VIDEO_COUNT).toString()));
		Request.put("key", "请输入关键字");
		Request.put("vtid_key", vtid);
		return "videos";
	}
	

	public String VideoListLately(){
		System.out.println(getServletRequest().getParameter("page"));
		
		if(Session.get("navbar")==null){
			ArrayList<VideoType> videoTypeList=videoTypeService.getAllVideoType();
			Session.put("navbar",videoTypeList.toArray());
			System.out.println("导航栏");
		}
		
		int vtid=0;
		int page=1;
		
		try{
			Object object=getServletRequest().getParameter("page");
			if(object!=null)
				page=Integer.parseInt(object.toString());
		}catch (NullPointerException e1) {
			// TODO: handle exception
			System.out.println("空值啊！！！");
			throw e1;
		}catch (NumberFormatException e2) {
			// TODO: handle exception
			System.out.println("转不了啊！！！");
			throw e2;
		}
		
		Map<String, Object> map=videoService.getPageInfo2Index(vtid, page);
		
		Map<String, String> params=new HashMap<String, String>();
		
		params.put("vtid", String.valueOf(vtid));
		
		Request.put("hotvlist", (ArrayList<Video>) videoService.getHotVideoList(vtid));
		Request.put("vlist", (ArrayList<Video>) map.get(VideoService.VIDEO_LIST));
		Request.put("curpage", Integer.parseInt(map.get(VideoService.CURRENT_PAGE).toString()));
		Request.put("btmpage", (int[]) map.get(VideoService.BOTTOM_PAGE));
		Request.put("alink", "Home_VideoListLately.action?vtid=0");
		Request.put("params", params);
		Request.put("pagecount", Integer.parseInt(map.get(videoService.PAGE_COUNT).toString()));
		Request.put("vcount",Integer.parseInt(map.get(VideoService.VIDEO_COUNT).toString()));
		Request.put("key", "请输入关键字");
		return "videos";
		
	}
	
	public String VideoListRecommend(){
		System.out.println(getServletRequest().getParameter("page"));
		
		if(Session.get("navbar")==null){
			ArrayList<VideoType> videoTypeList=videoTypeService.getAllVideoType();
			Session.put("navbar",videoTypeList.toArray());
			System.out.println("导航栏");
		}
		
		int vtid=0;
		int page=1;
		
		try{
			Object object=getServletRequest().getParameter("page");
			if(object!=null)
				page=Integer.parseInt(object.toString());
		}catch (NullPointerException e1) {
			// TODO: handle exception
			System.out.println("空值啊！！！");
			throw e1;
		}catch (NumberFormatException e2) {
			// TODO: handle exception
			System.out.println("转不了啊！！！");
			throw e2;
		}
		
		Map<String, Object> map=videoService.getRecommendVideos(page);
		
		Map<String, String> params=new HashMap<String, String>();
		
		params.put("vtid", String.valueOf(vtid));
		
		Request.put("hotvlist", (ArrayList<Video>) videoService.getHotVideoList(vtid));
		Request.put("vlist", (ArrayList<Video>) map.get(VideoService.VIDEO_LIST));
		Request.put("curpage", Integer.parseInt(map.get(VideoService.CURRENT_PAGE).toString()));
		Request.put("btmpage", (int[]) map.get(VideoService.BOTTOM_PAGE));
		Request.put("alink", "Home_VideoListRecommend.action?vtid=0");
		Request.put("params", params);
		Request.put("pagecount", Integer.parseInt(map.get(videoService.PAGE_COUNT).toString()));
		Request.put("vcount",Integer.parseInt(map.get(VideoService.VIDEO_COUNT).toString()));
		Request.put("key", "请输入关键字");
		return "videos";
		
	}
	
	public String VideoListSearch(){
		
		if(Session.get("navbar")==null){
			ArrayList<VideoType> videoTypeList=videoTypeService.getAllVideoType();
			Session.put("navbar",videoTypeList.toArray());
			System.out.println("导航栏");
		}
		
		int vtid=0;
		int page=1;
		
		if(key==null||key.trim().length()==0){
			 return Init();
		}
		else {
			
			try{
				Object object=getServletRequest().getParameter("page");
				if(object!=null)
					page=Integer.parseInt(object.toString());
			}catch (NullPointerException e1) {
				// TODO: handle exception
				System.out.println("空值啊！！！");
				throw e1;
			}catch (NumberFormatException e2) {
				// TODO: handle exception
				System.out.println("转不了啊！！！");
				throw e2;
			}
			
			
			key=key.trim();
			System.out.println("key="+key);
			Map<String, Object> map=videoService.getPageInfo2Index(key, page);
			Request.put("hotvlist", (ArrayList<Video>) videoService.getHotVideoList(vtid));
			Request.put("vlist", (ArrayList<Video>) map.get(VideoService.VIDEO_LIST));
			Request.put("curpage", Integer.parseInt(map.get(VideoService.CURRENT_PAGE).toString()));
			Request.put("btmpage", (int[]) map.get(VideoService.BOTTOM_PAGE));
			Request.put("alink", "Home_VideoListSearch.action?vtid=0&key="+key);
			Request.put("pagecount", Integer.parseInt(map.get(videoService.PAGE_COUNT).toString()));
			Request.put("vcount",Integer.parseInt(map.get(VideoService.VIDEO_COUNT).toString()));
			Request.put("key", key);
			return "videos";
		}
		
	}
	

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
}
