package com.and9.tckms.dao;

import java.util.List;

import com.and9.tckms.entity.VideoSubject;
import com.and9.tckms.entity.VideoType;


public interface VideoTypeDao {
	
	
	//获取视频的所有类别 
	public abstract List<VideoType> getAllVideoType();
	
	
	//根据id获取视频的类别
	public abstract VideoType getVideoTypeByID(int vtid);
	
	//返回所有类型与之对应分类
	public abstract List<VideoSubject> getAllVideoSubject();
	
	public abstract List<VideoType> getVideoTypesByVideoSbujectId(int video_subject_id);
	
}
