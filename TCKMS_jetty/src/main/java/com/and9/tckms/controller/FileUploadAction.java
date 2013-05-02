package com.and9.tckms.controller;

import java.io.File;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;

import com.and9.tckms.entity.User;
import com.and9.tckms.entity.Video;
import com.and9.tckms.entity.VideoSubject;
import com.and9.tckms.entity.VideoType;
import com.and9.tckms.service.VideoService;
import com.and9.tckms.service.VideoTypeService;
import com.and9.tckms.web.utils.FileOperation;

public class FileUploadAction extends BaseAction {
	
	private File doc;
	private Video video;
	private String video_tags;
	private List<VideoSubject> videoSubjectList;
	private Map<Integer, List<VideoType>> videoTypeMap;
	private VideoTypeService videoTypeService= new VideoTypeService();
	private VideoService videoService=new VideoService();
	
	public static final String submit_token_key="uploadvideotoken";
	
	
	public String upLoadVideo() throws Exception {
		System.out.println("访问我啊");
		String[] names = ((MultiPartRequestWrapper)getServletRequest()).getFileNames("doc");
		String vnewname=getServletRequest().getParameter("uuid");
		if(names!=null&&vnewname!=null){
			StringBuffer fileName=new StringBuffer();
			fileName.append(vnewname).append(names[0].substring(names[0].lastIndexOf(".")));
			File target = new File(context.getRealPath("/upload/videos"), fileName.toString());
			FileUtils.copyFile(doc, target);
			
			getServletRequest().getSession().setAttribute("video_path", fileName.toString());
			System.out.println("访问我啊");
		}
		
		return "toVideo";

	}

	public String toVideo(){
		
		Session.put(submit_token_key, 0);
		
		initVideoSubjectType();
		
		return "toVideo";
	}
	
	public String  toSaveVideo() {
		
		synchronized(this){
			int count=0;
			if(Session.get(submit_token_key)==null){
				return ERROR;
			}else {
				count=(Integer) Session.get(submit_token_key);
				if(count==0){
					count++;
					Session.put(submit_token_key, count);
				}else {
					return "token";
				}
			}
		}
		
		if(video!=null){
			//video.setVideo_name(Session.get("video_path").toString());
			//System.out.println(getServletRequest().getParameter("uuid"));
			String oldFilePath=context.getRealPath("/upload/videos");
			String newFilePath=context.getRealPath("/resource/videos");
			if(FileOperation.cutFiletoNewFile(oldFilePath, newFilePath,video.getVideo_name())==FileOperation.cutNewFileSuccess){
				video.setUser_id(((User)Session.get("user")).getUser_id());
				video.setVideo_link("resource/videos/"+video.getVideo_name());
				video.setVideo_img_url("resource/vimgs/null.jpg");
				video.setVideo_udate(new Date());
				video.setVideo_tag(video_tags.split(",|，| "));
				System.out.println("video_name:"+video.getVideo_name());
				System.out.println("video_title:"+video.getVideo_title());
				System.out.println("video_info:"+video.getVideo_info());
				System.out.println("video_link:"+video.getVideo_link());
				System.out.println("video_tags:"+video_tags);
				System.out.println("video_udate"+video.getVideo_udate());
				System.out.println("video_size:"+video.getVideo_size());
				System.out.println("video_img_url:"+video.getVideo_img_url());
				System.out.println("video_type_id:"+video.getVideo_type_id());
				System.out.println("user_id:"+video.getUser_id());
				System.out.println("访问到数据库啦");
				videoService.saveUploadVideo(video);
				Session.remove(submit_token_key);
				return SUCCESS;
			}
		}
			return ERROR;
	}
	
	public void validateToSaveVideo(){
		if(video_tags!=null&&!video_tags.equals("")){
			
			String[] video_tag=getVideo_tags().split("，| |,");
			
			initVideoSubjectType();
			if(video_tag.length>5){
				
				addFieldError("video_tags", "标签长度不能大于5");
				
			
			}else if(hasSameType(video_tag)){
				
				addFieldError("video_tags", "标签不能重复");
			
			}else
			{
				
				for(String vtag: video_tag){
					if(vtag.equals(""))
						addFieldError("video_tags", "输入格式不正确");
				}
				
			}
			
			System.out.println("标签总长度:length"+video_tag.length);
		
		}
		
	}
	
	/**
	 * 判断标签数组是否存在相同的值
	 * 存在返回true，不存在返回false。
	 * @param tags
	 * @return
	 */
	private boolean hasSameType(String[] tags){
		Set<String> set=new HashSet<String>();
		for(String s:tags){
			set.add(s);
		}
		if(set.size()==tags.length)
			return false;
		return true;
	}
	
	/**
	 * 初始化视频类型
	 */
	private void initVideoSubjectType() {
		videoSubjectList=videoTypeService.getAllVideoSubject();
		videoTypeMap=new LinkedHashMap<Integer, List<VideoType>>();
		
		for(VideoSubject vt:videoSubjectList){
			videoTypeMap.put(vt.getVideo_subject_id(), vt.getVideoTypes());
			System.out.println(vt.getVideoTypes());
		}
	}
	
	public File getDoc() {
		return doc;
	}

	public void setDoc(File doc) {
		this.doc = doc;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public String getVideo_tags() {
		return video_tags;
	}

	public void setVideo_tags(String video_tags) {
		this.video_tags = video_tags;
	}

	public List<VideoSubject> getVideoSubjectList() {
		return videoSubjectList;
	}

	public void setVideoSubjectList(List<VideoSubject> videoSubjectList) {
		this.videoSubjectList = videoSubjectList;
	}

	public Map<Integer, List<VideoType>> getVideoTypeMap() {
		return videoTypeMap;
	}

	public void setVideoTypeMap(Map<Integer, List<VideoType>> videoTypeMap) {
		this.videoTypeMap = videoTypeMap;
	}
	
}
