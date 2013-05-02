package com.and9.tckms.entity;

import java.sql.Timestamp;

/**
 * 收藏视频实体类
 * */
public class Favorites {
	private long favorites_id;
	private long video_id;
	private long user_id;
	private Timestamp time;
	
	public Favorites() {
	}
	
	public Favorites(long video_id, long user_id, Timestamp time) {
		super();
		this.video_id = video_id;
		this.user_id = user_id;
		this.time = time;
	}
	
	
	public Favorites(long favorites_id, long video_id, long user_id,
			Timestamp time) {
		this(video_id, user_id, time);
		this.favorites_id = favorites_id;
	}

	//getters and setters
	public long getFavorites_id() {
		return favorites_id;
	}
	public void setFavorites_id(long favorites_id) {
		this.favorites_id = favorites_id;
	}
	public long getVideo_id() {
		return video_id;
	}
	public void setVideo_id(long video_id) {
		this.video_id = video_id;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	
}
