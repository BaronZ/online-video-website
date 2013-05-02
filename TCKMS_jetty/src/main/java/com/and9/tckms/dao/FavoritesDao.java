package com.and9.tckms.dao;

import java.util.List;

import com.and9.tckms.entity.Favorites;

public interface FavoritesDao {

	/**
	 * 插入
	 * */
	public int input(Favorites favorites);

	/**
	 * 删除
	 */
	public int delete(Favorites favorites);
	/**
	 * 查找
	 * 根据用户id，和视频id查找
	 */
	public int get(long user_id,long video_id);
	/**
	 * 根据用户id获取收藏视频列表
	 */
	public List<Favorites> getFavoritesByUserId(long user_id,int begin,int size);
}
