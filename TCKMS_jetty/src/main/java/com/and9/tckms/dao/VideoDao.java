package com.and9.tckms.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.and9.tckms.entity.Video;





public interface VideoDao {
	
	//返回某关键字的视频列表到首页
	public abstract List<Video> getVideoListByKey(String key,long top,int size);
	
	/**
	 * 返回视频列表by vtid到首页
	 * @param vtid
	 * @param top
	 * @param size
	 * @return
	 */
	public abstract List<Video> getVideoListByVTId(int vtid,long top,int size);
	
	/**
	 * 返回所有类型的视频列表到首页 size表示返回的视频个数
	 * @param top
	 * @param size
	 * @return
	 */
	public abstract List<Video> getAllVideoList(long top,int size);
	
	//返回某关键字的视频列表总个数
	public abstract int getCountofVideoListByKey(String key);
	
	/**
	 * 返回某个类型的视频列表总个数
	 * @param vtid
	 * @return
	 */
	public abstract int getCountofVideoListByVTId(int vtid);
	
	/**
	 * 返回所有类型的视频列表总个数
	 * @return
	 */
	public abstract int getAllCountofVideoList();
	
	/**
	 * 返回某个类型前十个视频列表
	 * @param vtid
	 * @return
	 */
	public abstract List<Video> getVideoListByClicks(int vtid);
	
	/**
	 * 返回所有类型的前十个视频列表
	 * @return
	 */
	public abstract List<Video> getVideoListByClicks();
	
	/**
	 *  更新视频点击数
	 * @param vid
	 * @return
	 */
	public abstract int updateClicks(long vid);
	
	/**
	 * 获取视频信息byVid
	 * @param vid
	 * @return
	 */
	public abstract Video getVideoByVid(long vid);
	
	/**
	 * 根据用户id(user_id)获取视频列表
	 */
	public abstract List getVideosByUid(long uid,int begin,int size);
	
	public abstract int saveUploadVideoName(Video video);
	
	public abstract int saveUploadVideo(Video video);
	
	public abstract int getCountofRecommendedVideos();
	
	public abstract List<Video> getRecommendedVideos(long top,int size);
	
//	//模糊查找视频byTitle
//	public abstract List<Video> getVideoByTitle(String vtitle);
//	
//	//根据id查询视频信息
//	public abstract Video getVideoByID(long vid);
//	
//	//更新视频信息
//	public abstract int update(Video video);
//	
//	//删除视频byid
//	public abstract int delete(long vid);
//	
//	//添加视频
//	public abstract void add(Video video);
//	
//	//添加路径
//	public abstract void addPath(Video v);
//	
//	//返回视频列表by vtid
//	public abstract List<Video> getVListByType2Index(long vtid);
//	
//	//返回视频类型排行榜by click type=0表示all
//	public abstract List<Video> getVListRankingByClick(int type);
//	
//	//根据上传者uid查找视频
//	public abstract List<Video> getVListByUid(long uid);
//	
//	
//	//获取视频信息（播放页面）
//	public abstract Video getPlayVinfo(int vid);
	
}
