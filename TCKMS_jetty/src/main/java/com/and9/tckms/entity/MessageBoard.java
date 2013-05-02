package com.and9.tckms.entity;

import java.sql.Timestamp;


/**
 * 留言板实体
 */
public class MessageBoard {

	private long msg_id;//留言版id
	private long video_id;//视频id
	private long user_id;//用户id
	private Timestamp time;//留言时间
	private String content;//留言内容
	private String nickname;//留言者昵称

	
	public MessageBoard() {
	}
	public MessageBoard( long video_id, long user_id,
			Timestamp time, String content, String nickname) {
		super();
		
		this.video_id = video_id;
		this.user_id = user_id;
		this.time = time;
		this.content = content;
		this.nickname = nickname;
	}
	public long getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(long msg_id) {
		this.msg_id = msg_id;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
}
