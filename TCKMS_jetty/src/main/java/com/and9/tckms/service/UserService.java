package com.and9.tckms.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import javassist.expr.NewArray;

import com.and9.tckms.dao.AuthorityDao;
import com.and9.tckms.dao.FavoritesDao;
import com.and9.tckms.dao.RoleDao;
import com.and9.tckms.dao.UserDao;
import com.and9.tckms.dao.VideoDao;
import com.and9.tckms.dao.impl.AuthorityDaoImpl;
import com.and9.tckms.dao.impl.FavoritesDaoImpl;
import com.and9.tckms.dao.impl.RoleDaoImpl;
import com.and9.tckms.dao.impl.VideoDaoImpl;
import com.and9.tckms.entity.Authority;
import com.and9.tckms.entity.Favorites;
import com.and9.tckms.entity.Role;
import com.and9.tckms.entity.User;
import com.and9.tckms.entity.Video;
import com.and9.tckms.factory.UserDaoFactory;
import com.and9.tckms.web.utils.CipherUtil;


public class UserService {
	
	private UserDao uDao = UserDaoFactory.getInstance().getUserDao();
	private FavoritesDao fDao = new FavoritesDaoImpl();
	private VideoDao vDao = new VideoDaoImpl();
	private RoleDao rDao=new RoleDaoImpl();
	private AuthorityDao aDao=new AuthorityDaoImpl();
	
	/**
	 * 用户登录
	 */
	public  User login(String username,String password){
		
		User user=null;
		if(username!=null&&password!=null&&username.length()!=0&&password.length()!=0){
			user=uDao.findByUsername(username);
			if(user == null || CipherUtil.validatePassword(user.getPassword(), password) == false){
				return null;
			}
		}
		
		
		
		return user;
	}
	
	/**
	 * 获取用户收藏的视频及其信息
	 */
	public List<Video> getUserFavs(long user_id,int begin,int size){
		//获取用户收藏的视频id
		ArrayList<Favorites> favorites =(ArrayList<Favorites>) fDao.getFavoritesByUserId(user_id,begin,size);
		ArrayList<Video> videos = new ArrayList<Video>();
		Video video = null;
		Favorites fav = null;
		Iterator<Favorites> it = favorites.iterator();
		
		while(it.hasNext()){
			fav = it.next();
			//根据上面获取的视频id获取视频信息
			video = vDao.getVideoByVid(fav.getVideo_id());
			
			//封装收藏时间
			video.setFavTime(fav.getTime());
			videos.add(video);
			
		}
		return videos;
	}
	
	/**
	 * 获取用户上传的视频及其信息
	 */
	public List<Video> getUserUploads(long user_id,int begin,int size){
		//获取用户上传的视频id
		return vDao.getVideosByUid(user_id, begin, size);
	}
	/**
	 * 显示“收藏视频列表”
	 * 
	 */
	public void showUploads(List<Video> videos) throws IOException{
		
		
		ServletActionContext.getResponse().setContentType(  
                "text/html;charset=utf-8");  
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		Iterator<Video> it = videos.iterator();
		Video video = null;
		while(it.hasNext()){
			video = it.next();
			out.write("<div id='myCollection' class='w700'>");
            out.write("<div id='myCollection_item' class='w700'>");
            out.write("<img class='fl' src='"+video.getVideo_img_url()+"'/>");
            out.write("<div id='myCollection_item_txt'><h5>"); 	
            out.write("<a href='http://localhost:8080/TCKMS/playVideo.action?vid="+video.getVideo_id()+"' target='_blank'>"+video.getVideo_title()+"</a><b class='time'>时长:"+video.getVideo_duration()+"</b>");    
            out.write("</h5><ul><li>"+video.getVideo_udate()+"<em>上传</em></li>");
            out.write("<li>点击量:"+video.getVideo_clicks()+"</li></ul>");
            //out.write("<button class='fr' type='button'>收藏</button>");//TODO 要加取消收藏的方法
            out.write("</div></div></div>");    
			out.flush();
		}
	}
}
