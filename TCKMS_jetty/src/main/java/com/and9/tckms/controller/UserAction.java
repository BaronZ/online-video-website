package com.and9.tckms.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javassist.expr.NewArray;

import com.and9.tckms.entity.Favorites;
import com.and9.tckms.entity.User;
import com.and9.tckms.entity.Video;
import com.and9.tckms.service.FavoritesService;
import com.and9.tckms.service.UserService;

/**
 * 与用户操作有关的控制器
 */
public class UserAction extends BaseAction{
	
	private long uid;//用户id
	private FavoritesService favoritesService = new FavoritesService();
	private UserService userService = new UserService();
	
	public UserAction(){
		System.out.println("调用userAction");
	}
	public long getUid() {
		System.out.println("调用getUid");
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}

	/**
	 * 显示用记收藏视频列表
	 * @author zzb
	 */
	public String showUserFavs() throws IOException{
		System.out.println("调用showUserFavs");
		int begin = 0;//默认从0开始获取视频
		int size = 10;//默认获取10条收藏视频
		List<Video> videos = userService.getUserFavs(getUid(),begin,size);
		favoritesService.showFavs(videos);
		//Request.put("videos", videos);
		return null;
	}
	/**
	 * 显示用户上传的视频列表
	 * @throws IOException 
	 */
	public String showUserUpload() throws IOException{
		System.out.println( "调用showUserUpload");
		int begin = 0;
		int size = 10;
		List<Video> videos = userService.getUserUploads(getUid(), begin, size);
		userService.showUploads(videos);//TODO 显示得改
		return null;
		
	}
	

}
