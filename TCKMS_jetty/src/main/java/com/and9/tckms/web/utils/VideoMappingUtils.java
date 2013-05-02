package com.and9.tckms.web.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.and9.tckms.entity.Video;
import com.and9.tckms.entity.VideoSubject;
import com.and9.tckms.entity.VideoType;
import com.sun.crypto.provider.RSACipher;
import com.sun.org.apache.regexp.internal.recompile;

/**
 * @作用：封装对象
 * @author TheRealBo
 * */
public class VideoMappingUtils {
	
	
	public static VideoSubject videoSubjectMapping(ResultSet rs){
		VideoSubject videoSubject=new VideoSubject();
		try{
			videoSubject.setVideo_subject_id(rs.getInt("video_subject_id"));
			videoSubject.setVideo_subject_name(rs.getString("video_subject_name"));
			videoSubject.setVideo_subject_discription(rs.getString("video_subject_discription"));
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return videoSubject;
	}
	
	/**
	 * 热门视频排行榜
	 * @author MC
	 * @param rs
	 * @return
	 */
	public static Video hotVideoMapping(ResultSet rs){
		Video video=new Video();
		try{
			// vid,vtittle,vclicks
			video.setVideo_id(rs.getLong("video_id"));
			video.setVideo_title(rs.getString("video_tittle"));
			video.setVideo_clicks(rs.getInt("video_clicks"));
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return video;
	}
	
	/**
	 * 根据数据库操作的结果集，把结果集的内容封装到videotype
	 * @author MC
	 * @param rs
	 * @return
	 */
	public static VideoType videoTypeMapping(ResultSet rs){
		VideoType videoType=new VideoType();
		try{
			videoType.setVideo_type_id(rs.getInt("video_type_id"));
			videoType.setVideo_type_name(rs.getString("video_type_name"));
		
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return videoType;
	}
	
	
	
	/**
	 * @作用：根据数据库操作返回的结果集，把结果集的内容封装到video
	 * 主要在首页显示
	 * video_id,video_title,video_type_name,user_id,nickname,video_clicks,
	 * video_link,video_img_url,video_udate
	 * @author TheRealBo,MC
	 * @param ResultSet
	 * */
	public static Video videoMapping2Index(ResultSet rs,String key) {
		
		Video video = new Video();
		try {
			
			video.setVideo_id(rs.getLong("video_id"));
			video.setVideo_title(rs.getString("video_title"));
			video.setVideo_type_name(rs.getString("video_type_name"));
			video.setUser_id(rs.getInt("user_id"));
			video.setNickname(rs.getString("nickname"));
			video.setVideo_clicks(rs.getInt("video_clicks"));
			video.setVideo_link(rs.getString("video_link"));
			video.setVideo_img_url(rs.getString("video_img_url"));
			video.setVideo_udate(rs.getDate("video_udate"));
			video.setSimple_video_title(VideoMappingUtils.simpleVideoTitleMapping
					(video.getVideo_title(), key, 23));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return video;
	}
	
	public static Video videoMapping2Uploads(ResultSet rs){
		Video video = new Video();
		try {
			video.setVideo_id(rs.getLong("video_id"));
			video.setVideo_title(rs.getString("video_title"));
			video.setVideo_type_name(rs.getString("video_type_name"));
			//video.setUser_id(rs.getInt("user_id"));
			video.setNickname(rs.getString("nickname"));
			video.setVideo_clicks(rs.getInt("video_clicks"));
			video.setVideo_link(rs.getString("video_link"));
			video.setVideo_img_url(rs.getString("video_img_url"));
			video.setVideo_udate(rs.getDate("video_udate"));
			video.setVideo_duration(rs.getString("video_duration"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return video;
	}
public static Video hotvideoMapping2Index(ResultSet rs) {
		
		Video video = new Video();
		try {
			video.setVideo_title(rs.getString("video_title"));
			video.setVideo_link(rs.getString("video_link"));
			video.setVideo_id(rs.getLong("video_id"));
			video.setVideo_clicks(rs.getInt("video_clicks"));
			video.setSimple_video_title(VideoMappingUtils.simpleVideoTitleMapping
					(video.getVideo_title(), null, 14));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return video;
	}
	
/**
 * new
 * 封装播放页面的视频信息
 * @author TheRealBo
 * */
public static Video playVideoMapping(ResultSet rs){
	Video video = new Video();
	try{
		
		video.setVideo_id(rs.getLong("video_id"));
		video.setVideo_title(rs.getString("video_title"));
		video.setVideo_info(rs.getString("video_info"));
		video.setVideo_type_name(rs.getString("video_type_name"));
		video.setNickname(rs.getString("nickname"));
		video.setVideo_udate(rs.getDate("video_udate"));
		video.setVideo_duration(rs.getString("video_duration"));
		video.setVideo_clicks(rs.getInt("video_clicks"));
		video.setVideo_link(rs.getString("video_link"));
		video.setVideo_img_url(rs.getString("video_img_url"));
		String video_tags=rs.getString("video_tags");
		video.setVideo_tag(video_tags.split(","));
	}catch (Exception e) {
		e.printStackTrace();
	}
	return video;
	}


	public static StringBuilder simpleVideoTitleMapping(String str,String key,int size){
		
		int i=0;
		
		StringBuilder simpleBuilder=new StringBuilder(str);
		if(key==null){
			if(simpleBuilder.length()>size+1)
			simpleBuilder.replace(size, simpleBuilder.length(), "..");
		}
		else{ 
			if(simpleBuilder.length()>size+1){
				i=simpleBuilder.toString().toUpperCase().indexOf(key.toUpperCase());
				key=simpleBuilder.substring(i, i+key.length());
				if(i>=0){
					if(i+key.length()<size){
						simpleBuilder.replace(size, simpleBuilder.length(), "..");
					}
					else{
						if(simpleBuilder.length()-i<size-2){
							simpleBuilder.replace(size-(simpleBuilder.length()-i), i, "..");
						}
						else {
							simpleBuilder.replace(1,i , "..");
							simpleBuilder.replace(size+1, str.length(), "");
						}
					}
				}
			}	
		
			Pattern p=Pattern.compile(key,Pattern.CASE_INSENSITIVE); 

			Matcher m=p.matcher(simpleBuilder); 
			simpleBuilder=simpleBuilder.replace(0, simpleBuilder.length(), m.replaceAll("<span id='highlight'>"+key+"</span>")); 
			
		}
		return simpleBuilder;
	}
	
	
}
