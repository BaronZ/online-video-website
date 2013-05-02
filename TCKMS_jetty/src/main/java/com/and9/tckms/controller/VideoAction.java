package com.and9.tckms.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import com.and9.tckms.entity.Favorites;
import com.and9.tckms.entity.MessageBoard;
import com.and9.tckms.entity.User;
import com.and9.tckms.entity.Video;
import com.and9.tckms.service.CommentService;
import com.and9.tckms.service.FavoritesService;
import com.and9.tckms.service.VideoService;

public class VideoAction extends BaseAction {
	private VideoService vService = new VideoService();
	private CommentService cmtService = new CommentService();
	private FavoritesService favService = new FavoritesService();
	private long vid;
	private String content;

	public long getVid() {
		return vid;
	}

	public void setVid(long vid) {
		this.vid = vid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public VideoAction() {
		System.out.println("调用VideoAction");
	}

	/**
	 * 播放视频
	 * */
	public String playVideo() throws IOException {
		System.out.println("调用playVideo方法");
		//获取视频id
		long vid = Long.parseLong(Request.get("vid").toString());
		
		Video video = vService.getPlayVideoInfo(vid);
		Request.put("video", video);
		// 更新播放次数
		vService.updateClicks(vid);
		
		// 获取最新10条留言
		List cmts = cmtService.getComments(vid, 0, 10);
		Request.put("cmts", cmts);
		User u = (User)Session.get("user");
		//视频收藏显示（eg:如果已经收藏的用户，返回的结果是true,会显示“取消收藏”）
		boolean isFav = favService.isFav(u.getUser_id(), vid);
		
		Request.put("isFav", isFav);//前台用el表达式判断，如果是true则显示“取消收藏” vice versa
		return SUCCESS;
	}

	/**
	 * 视频留言
	 * @author zzb
	 */
	public String comment() throws IOException {

		System.out.println("调用comment.action");
		// 获取系统当前时间作为评论时间
		Timestamp time = new Timestamp(System.currentTimeMillis());
		// 获取留言内容
		String content = getContent();
		// 获取当前视频的id
		long vid = getVid();
		// 获取当前用户信息
		User user = (User) Session.get("user");
		// 把留言者，留言内容等信息封装到 MessageBoard 实体
		MessageBoard msgBoard = new MessageBoard(getVid(), user.getUser_id(),
				time, content, user.getNickname());
		// 把留言信息写入数据库
		int inserted = cmtService.comment(msgBoard);
		// 从数据库中获取留言,并把留言内容打印到网页中
		cmtService.showComments(vid);
		return null;
	}

	/**
	 * 收藏视频
	 */
	public String fav() {

		System.out.println("调用fav.action:收藏");
		// 收藏时间
		Timestamp time = new Timestamp(System.currentTimeMillis());
		// 获取当前视频的id
		long vid = getVid();
		// 获取当前用户信息
		User user = (User) Session.get("user");
		
		Favorites favs = new Favorites(vid, user.getUser_id(), time);
		// 收藏
		favService.addFav(favs);
		return null;
	}
	
	/**
	 * 取消收藏视频
	 */
	public String unFav(){
		long vid = getVid();
		// 获取当前用户信息
		User user = (User) Session.get("user");
		Favorites favs = new Favorites(vid, user.getUser_id(), null);
		favService.cancleFav(favs);
		return null;
	}
}
