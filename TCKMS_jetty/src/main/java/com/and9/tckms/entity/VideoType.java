package com.and9.tckms.entity;

import java.io.Serializable;


public class VideoType implements Serializable{
	
	private int video_type_id;						//视频类型id
	private String video_type_name;					//视频类型名称
	private String video_type_discription;	//视频类型介绍
	private int video_subject_id;
	
	public int getVideo_type_id() {
		return video_type_id;
	}
	public void setVideo_type_id(int videoTypeId) {
		video_type_id = videoTypeId;
	}
	public String getVideo_type_name() {
		return video_type_name;
	}
	public void setVideo_type_name(String videoTypeName) {
		video_type_name = videoTypeName;
	}
	public String getVideo_type_discription() {
		return video_type_discription;
	}
	public void setVideo_type_discription(String videoTypeDiscription) {
		video_type_discription = videoTypeDiscription;
	}
	public int getVideo_subject_id() {
		return video_subject_id;
	}
	public void setVideo_subject_id(int video_subject_id) {
		this.video_subject_id = video_subject_id;
	}
	
	
//	private int vtid;			//视频类型ID
//	private String vtype;		//类型
//	
//	public VideoType(){}
//	
//	public String getVtype() {
//		return vtype;
//	}
//	public void setVtype(String vtype) {
//		this.vtype = vtype;
//	}
//	public int getVtid() {
//		return vtid;
//	}
//	public void setVtid(int vtid) {
//		this.vtid = vtid;
//	}

}
