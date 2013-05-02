package com.and9.tckms.service;

import java.util.ArrayList;
import java.util.List;

import com.and9.tckms.dao.VideoTypeDao;
import com.and9.tckms.entity.VideoSubject;
import com.and9.tckms.entity.VideoType;
import com.and9.tckms.factory.VideoTypeDaoFactory;
import com.sun.org.apache.bcel.internal.generic.NEW;


public class VideoTypeService {
	
	private VideoTypeDao vtDao=VideoTypeDaoFactory.getInstance().getVideoTypeDao();
	
	
	public ArrayList<VideoType> getAllVideoType(){
		return (ArrayList<VideoType>) vtDao.getAllVideoType();
	}
	
	
	public VideoTypeDao getVideoTypeDao(){
		return this.vtDao;
	}
	
	public ArrayList<VideoSubject> getAllVideoSubject(){
		List<VideoSubject> videoSubjects=vtDao.getAllVideoSubject();
		if(videoSubjects!=null&&videoSubjects.size()>0){
			for(VideoSubject videoSubject:videoSubjects){
				
				videoSubject.setVideoTypes(
						vtDao.getVideoTypesByVideoSbujectId(
								videoSubject.getVideo_subject_id()));
			}
		}
		return (ArrayList<VideoSubject>) videoSubjects;
	}
	
	public List<VideoType> getVideoTypesByVideoSbujectId(int video_subject_id){
		return vtDao.getVideoTypesByVideoSbujectId(video_subject_id);
	}
}
