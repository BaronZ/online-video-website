package com.and9.tckms.entity;

import java.util.List;


public class VideoSubject {
	
	private int video_subject_id;
	private String video_subject_name;
	private String video_subject_discription;
	private List<VideoType> videoTypes;
	public int getVideo_subject_id() {
		return video_subject_id;
	}
	public void setVideo_subject_id(int video_subject_id) {
		this.video_subject_id = video_subject_id;
	}
	public String getVideo_subject_name() {
		return video_subject_name;
	}
	public void setVideo_subject_name(String video_subject_name) {
		this.video_subject_name = video_subject_name;
	}
	public String getVideo_subject_discription() {
		return video_subject_discription;
	}
	public void setVideo_subject_discription(String video_subject_discription) {
		this.video_subject_discription = video_subject_discription;
	}
	public List<VideoType> getVideoTypes() {
		return videoTypes;
	}
	public void setVideoTypes(List<VideoType> videoTypes) {
		this.videoTypes = videoTypes;
	}
}
