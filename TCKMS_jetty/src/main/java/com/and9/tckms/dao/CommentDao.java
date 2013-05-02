package com.and9.tckms.dao;



import java.util.List;

import com.and9.tckms.entity.MessageBoard;

/**
 * 留言dao
 * */
public interface CommentDao {
	
	/**
	 * 插入数据，判断数据库中是否有存在的id，若有，则是更新，若无，则是插入
	 * */
	public abstract int input(MessageBoard msgBoard);
	
	/**
	 * 根据视频id，从指定位置begin，获取指定长度size的留言
	 * */
	public abstract List<MessageBoard> getCommentsBySizeNVid(long vid,int begin,int size);
}
