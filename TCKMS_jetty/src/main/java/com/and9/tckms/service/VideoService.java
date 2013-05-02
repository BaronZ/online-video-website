package com.and9.tckms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.and9.tckms.dao.VideoDao;
import com.and9.tckms.entity.Video;
import com.and9.tckms.factory.VideoDaoFactory;
import com.and9.tckms.web.utils.PageUtils;
import com.sun.org.apache.regexp.internal.recompile;

public class VideoService {
	
	public static final String VIDEO_LIST="videolist";
	public static final String CURRENT_PAGE="curpage";
	public static final String BOTTOM_PAGE="btompage";
	public static final String PAGE_COUNT="pagecount";
	public static final String VIDEO_COUNT="vcount";
	
	private VideoDao vDao = VideoDaoFactory.getInstance().getVideoDao();
	
	/**
	 * 根据视频类型id和当前页返回Map对象
	 * map.put(VIDEO_LIST, videoList);//保存视频列表
	 * map.put(CURRENT_PAGE, curPage);//保存当前页
	 * map.put(BOTTOM_PAGE, btomPage);//保存底页数组
	 * @param vtid
	 * @param curPage
	 * @return Map<String, Object>
	 * @author MC
	 */
	public Map<String, Object> getPageInfo2Index(int vtid,int curPage){
		
		long top=0;//获取某一页视频的首个元素
		int size=PageUtils.VIDEO_PAGE_SIZE;//获取视频的数量
		int vcount=0;//视频总个数
		int pageCount=0;//总页数
		ArrayList<Video> videoList;
		Map<String, Object> map=new TreeMap<String, Object>();//封装首页需要的信息
		
		
		if(vtid!=0){
			
			vcount=vDao.getCountofVideoListByVTId(vtid);
			pageCount=PageUtils.getVideoPageCount(vcount);
			
			if(curPage<=0)
				curPage=1;
			if(curPage>pageCount)
				curPage=pageCount;
			
			top=(curPage-1)*PageUtils.VIDEO_PAGE_SIZE;
			
			if(top<0)top=0;
			
			videoList=(ArrayList<Video>) vDao.getVideoListByVTId(vtid, top, size);
		}else {
			
			vcount=vDao.getAllCountofVideoList();
			pageCount=PageUtils.getVideoPageCount(vcount);
			
			if(curPage<=0)
				curPage=1;
			if(curPage>pageCount)
				curPage=pageCount;
			
			top=(curPage-1)*PageUtils.VIDEO_PAGE_SIZE;
			
			if(top<0)top=0;
			
			videoList=(ArrayList<Video>) vDao.getAllVideoList(top, size);
			
		}
		
		int[] btomPage=PageUtils.getVideoBottomPage(pageCount, curPage);
		
		map.put(VIDEO_LIST, videoList);//保存视频列表
		map.put(CURRENT_PAGE, curPage);//保存当前页
		map.put(BOTTOM_PAGE, btomPage);//保存底页数组
		map.put(VIDEO_COUNT, vcount);
		map.put(PAGE_COUNT, pageCount);//保存总页数
		return map;
	}
	
	
	public Map<String, Object> getPageInfo2Index(String key,int curPage){
		long top=0;//获取某一页视频的首个元素
		int size=PageUtils.VIDEO_PAGE_SIZE;//获取视频的数量
		int vcount=0;//视频总个数
		int pageCount=0;//总页数
		ArrayList<Video> videoList;
		Map<String, Object> map=new TreeMap<String, Object>();//封装首页需要的信息
		
		vcount=vDao.getCountofVideoListByKey(key);
		pageCount=PageUtils.getVideoPageCount(vcount);
		
		if(curPage<=0)
			curPage=1;
		if(curPage>pageCount)
			curPage=pageCount;
		
		top=(curPage-1)*PageUtils.VIDEO_PAGE_SIZE;
		
		if(top<0)top=0;
		
		videoList=(ArrayList<Video>) vDao.getVideoListByKey(key, top, size);
		
		int[] btomPage=PageUtils.getVideoBottomPage(pageCount, curPage);
		
		map.put(VIDEO_LIST, videoList);//保存视频列表
		map.put(CURRENT_PAGE, curPage);//保存当前页
		map.put(BOTTOM_PAGE, btomPage);//保存底页数组
		map.put(VIDEO_COUNT, vcount);
		map.put(PAGE_COUNT, pageCount);//保存总页数
		return map;
	}
	
	public List<Video> getHotVideoList(int vtid){
		
		List<Video> hotVideoList;
		
		if(vtid==0)
			hotVideoList= vDao.getVideoListByClicks();
		else
			hotVideoList= vDao.getVideoListByClicks(vtid);
		
		return hotVideoList;
	}
	
	
	/**
	 * 更新视频点击数
	 * */
	public int updateClicks(long vid) {
		return vDao.updateClicks(vid);
	}
	/**
	 * 获取播放页面的视频信息
	 * @param vid
	 * @return
	 */
	public Video getPlayVideoInfo(long vid){
		return vDao.getVideoByVid(vid);
	} 
	
	public int saveUploadVideo(Video video){
		vDao.saveUploadVideo(video);
		return 0;
	}
	
	public Map<String, Object> getRecommendVideos(int curPage){
		
		Map<String, Object> map=new TreeMap<String, Object>();//封装首页需要的信息
		long top=0;//获取某一页视频的首个元素
		int size=PageUtils.VIDEO_PAGE_SIZE;//获取视频的数量
		int vcount=0;//视频总个数
		int pageCount=0;//总页数
		ArrayList<Video> videoList;
		
		vcount=vDao.getCountofRecommendedVideos();
		pageCount=PageUtils.getVideoPageCount(vcount);
		
		if(curPage<=0)
			curPage=1;
		if(curPage>pageCount)
			curPage=pageCount;
		
		top=(curPage-1)*PageUtils.VIDEO_PAGE_SIZE;
		
		videoList=(ArrayList<Video>) vDao.getRecommendedVideos(top, size);
		
		int[] btomPage=PageUtils.getVideoBottomPage(pageCount, curPage);
		
		map.put(VIDEO_LIST, videoList);//保存视频列表
		map.put(CURRENT_PAGE, curPage);//保存当前页
		map.put(BOTTOM_PAGE, btomPage);//保存底页数组
		map.put(VIDEO_COUNT, vcount);
		map.put(PAGE_COUNT, pageCount);//保存总页数
		return map;
	}
}
