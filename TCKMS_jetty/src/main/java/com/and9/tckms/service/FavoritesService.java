package com.and9.tckms.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.and9.tckms.dao.FavoritesDao;
import com.and9.tckms.entity.Favorites;
import com.and9.tckms.entity.MessageBoard;
import com.and9.tckms.entity.Video;
import com.and9.tckms.factory.FavoritesDaoFactory;

public class FavoritesService {
	private FavoritesDao favDao = FavoritesDaoFactory.getInstance()
			.getFavoritesDao();

	/**
	 * 收藏
	 * 
	 * @return
	 */
	public int addFav(Favorites favorites) {

		int count = favDao.get(favorites.getUser_id(), favorites.getVideo_id());
		if (count > 0)// count>0该用户已经收藏了该视频，不再执行插入
			return 0;
		else
			return favDao.input(favorites);//否则，收藏视频
	}

	/**
	 * 取消收藏
	 */
	public int cancleFav(Favorites favorites) {
		return favDao.delete(favorites);
	}
	
	/**
	 * 传入用户id和视频id，查看该用户是否收藏了该视频，如果>0,则是收藏了该视频
	 */
	public boolean isFav(long user_id,long video_id){
		return favDao.get(user_id, video_id)>0?true:false;
	}
	/**
	 * 显示“收藏视频列表”
	 * 
	 */
	public void showFavs(List<Video> videos) throws IOException{
		
		
		ServletActionContext.getResponse().setContentType(  
                "text/html;charset=utf-8");  
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		Iterator<Video> it = videos.iterator();
		Video video = null;
		while(it.hasNext()){
			video = it.next();
			
			out.write("<div id='myCollection' class='w700'>");
            out.write("<div id='myCollection_item' class='w700'>");
            //http://localhost:8080/TCKMS/playVideo.action?vid=563
            out.write("<img class='fl' src='"+video.getVideo_img_url()+"'/>");
            out.write("<div id='myCollection_item_txt'><h5>"); 	
            out.write("<a href='http://localhost:8080/TCKMS/playVideo.action?vid="+video.getVideo_id()+"' target='_blank'>"+video.getVideo_title()+"</a><b class='time'>时长:"+video.getVideo_duration()+"</b>");    
            out.write("</h5><ul><li>"+video.getFavTime()+"<em>收藏</em></li>");
            out.write("<li>点击量:"+video.getVideo_clicks()+"</li></ul>");
            //out.write("<button class='fr' type='button'>取消收藏</button>");//TODO 要加取消收藏的方法
            out.write("</div></div></div>");    
			
			out.flush();
		}
	}
}
