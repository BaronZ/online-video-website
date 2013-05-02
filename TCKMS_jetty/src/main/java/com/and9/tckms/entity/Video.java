package com.and9.tckms.entity;

import java.sql.Timestamp;
import java.util.Date;
/**
 * 视频实体
 * */
public class Video {
	
	private long video_id;						//视频id
	private String video_name;					//视频文件名
	private String video_title;					//视频标题
	private StringBuilder simple_video_title;	//视频标题简写
	private String video_info;					//视频信息
	private String video_link;					//视频连接
	private String[] video_tag;					//视频标签
	private Date video_udate;					//视频发布时间
	private Date video_mdate;					//视频最后更改时间
	private int video_clicks;					//视频的点击数
	private String video_pass;					//视频是否通过
	private int video_size;						//视频大小
	private String video_duration;				//视频时间长
	private String video_img_url;				//视频图片连接
	private int video_type_id;					//视频类型id
	private String video_type_name;				//视频类型名
	private int user_id;						//发布者的id
	private String nickname;					//发布者的网络名
	private Timestamp favTime;     		//收藏时间
	
	
	public Timestamp getFavTime() {
		return favTime;
	}
	public void setFavTime(Timestamp favTime) {
		this.favTime = favTime;
	}
	public String getVideo_info() {
		return video_info;
	}
	public void setVideo_info(String videoInfo) {
		video_info = videoInfo;
	}
	public StringBuilder getSimple_video_title() {
		return simple_video_title;
	}
	public void setSimple_video_title(StringBuilder simpleVideoTitle) {
		simple_video_title = simpleVideoTitle;
	}
	
	public long getVideo_id() {
		return video_id;
	}
	public void setVideo_id(long videoId) {
		video_id = videoId;
	}
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String videoName) {
		video_name = videoName;
	}
	public String getVideo_title() {
		return video_title;
	}
	public void setVideo_title(String videoTitle) {
		video_title = videoTitle;
	}


	public String getVideo_link() {
		return video_link;
	}
	public void setVideo_link(String videoLink) {
		video_link = videoLink;
	}
	
	public String[] getVideo_tag() {
		return video_tag;
	}
	public void setVideo_tag(String[] video_tag) {
		this.video_tag = video_tag;
	}
	public Date getVideo_udate() {
		return video_udate;
	}
	public void setVideo_udate(Date videoUdate) {
		video_udate = videoUdate;
	}
	public Date getVideo_mdate() {
		return video_mdate;
	}
	public void setVideo_mdate(Date videoMdate) {
		video_mdate = videoMdate;
	}
	public int getVideo_clicks() {
		return video_clicks;
	}
	public void setVideo_clicks(int videoClicks) {
		video_clicks = videoClicks;
	}
	public String getVideo_pass() {
		return video_pass;
	}
	public void setVideo_pass(String videoPass) {
		video_pass = videoPass;
	}
	public int getVideo_size() {
		return video_size;
	}
	public void setVideo_size(int videoSize) {
		video_size = videoSize;
	}
	public String getVideo_duration() {
		return video_duration;
	}
	public void setVideo_duration(String videoDuration) {
		video_duration = videoDuration;
	}
	public String getVideo_img_url() {
		return video_img_url;
	}
	public void setVideo_img_url(String videoImgUrl) {
		video_img_url = videoImgUrl;
	}
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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	
//	private String vname;        //b4:fileName  同一个人上传的记号,、即uuid ,服务器上的文件名
//	private String vtitle;        //b4:title 视频的显示名称,原name
//	private long vid;			 //b4:id 自增
//	private String vinfo;         //b4:info视频信息
//
//	private String vlink;         //b4:link数据库中视频的链接
//	private int vclicks;			 //b4:clicks   视频点击数	
//	private String vtype;				//b4:type类别名称
//	//private String UID;				//b4:UID上传者工号
//	private String vtags;			//视频标签
//	private String vudate;         //视频上传日期时间
//	private String vmdate;         //修改视频信息时间
//	private boolean vpass;         //视频审核值，默认是false           
//	private float vsize;			//视频大小
//	private String vduration;			//视频持续时间
//	
//	private String nickname;		// 上传者昵称
//	private long uid;              	//上传者的自己id
//	private String vimg_url;		//视频图片地址
//	
//	public String getVimg_url() {
//		return vimg_url;
//	}
//	public void setVimg_url(String vimgUrl) {
//		vimg_url = vimgUrl;
//	}
//	public Video(){}
//	public Video(long vid,String vname,String vtype,String vinfo){
//		this.vid=vid;
//		this.vname=vname;
//		this.vinfo=vinfo;
//		this.vtype=vtype;
//	}
//	public String getVname() {
//		return vname;
//	}
//	public void setVname(String vname) {
//		this.vname = vname;
//	}
//	public String getVtitle() {
//		return vtitle;
//	}
//	public void setVtitle(String vtitle) {
//		this.vtitle = vtitle;
//	}
//	public long getVid() {
//		return vid;
//	}
//	public void setVid(long vid) {
//		this.vid = vid;
//	}
//	public String getVinfo() {
//		return vinfo;
//	}
//	public void setVinfo(String vinfo) {
//		this.vinfo = vinfo;
//	}
//	public String getVlink() {
//		return vlink;
//	}
//	public void setVlink(String vlink) {
//		this.vlink = vlink;
//	}
//
//	public int getVclicks() {
//		return vclicks;
//	}
//	public void setVclicks(int vclicks) {
//		this.vclicks = vclicks;
//	}
//	public String getVtype() {
//		return vtype;
//	}
//	public void setVtype(String vtype) {
//		this.vtype = vtype;
//	}
//	public String getVtags() {
//		return vtags;
//	}
//	public void setVtags(String vtags) {
//		this.vtags = vtags;
//	}
//	public long getUid() {
//		return uid;
//	}
//	public void setUid(long uid) {
//		this.uid = uid;
//	}
//	public String getVudate() {
//		return vudate;
//	}
//	public void setVudate(String vudate) {
//		this.vudate = vudate;
//	}
//	public String getVmdate() {
//		return vmdate;
//	}
//	public void setVmdate(String vmdate) {
//		this.vmdate = vmdate;
//	}
//	public boolean isVpass() {
//		return vpass;
//	}
//	public void setVpass(boolean vpass) {
//		this.vpass = vpass;
//	}
//	public float getVsize() {
//		return vsize;
//	}
//	public void setVsize(float vsize) {
//		this.vsize = vsize;
//	}
//	public String getVduration() {
//		return vduration;
//	}
//	public void setVduration(String vduration) {
//		this.vduration = vduration;
//	}
//	public void setNickname(String nickname) {
//		this.nickname = nickname;
//	}
//	public String getNickname() {
//		return nickname;
//	}
//	
//
//	
//	
//	
}
