package com.and9.tckms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.and9.tckms.dao.FavoritesDao;
import com.and9.tckms.db.JdbcUtils;
import com.and9.tckms.entity.Favorites;

public class FavoritesDaoImpl implements FavoritesDao {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * 插入
	 */
	@Override
	public int input(Favorites favorites) {
		conn = JdbcUtils.getConnection();
		String sql = "insert into table_favorites(`video_id`,`user_id`,`time`)values(?,?,?)";
		int inserted = 0;
		try {
			ps = conn.prepareStatement(sql);
			// ps.setLong(1, favorites.getFavorites_id());
			ps.setLong(1, favorites.getVideo_id());
			ps.setLong(2, favorites.getUser_id());
			ps.setTimestamp(3, favorites.getTime());
			inserted = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return inserted;
	}

	/**
	 * 删除
	 */
	@Override
	public int delete(Favorites favorites) {
		conn = JdbcUtils.getConnection();
		String sql = "delete from table_favorites where user_id=? and video_id=?";
		int deleted = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, favorites.getUser_id());
			ps.setLong(2, favorites.getVideo_id());
			deleted = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return deleted;
	}

	/**
	 * 查找 根据用户id，和视频id查找
	 * 
	 * @return 返回符合条件的记录的条数
	 */
	@Override
	public int get(long user_id, long video_id) {
		conn = JdbcUtils.getConnection();
		String sql = "select count(*) from table_favorites where user_id=? and video_id=?";
		int count = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, user_id);
			ps.setLong(2, video_id);
			rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	/**
	 * 根据用户id获取收藏视频列表
	 */
	@Override
	public List<Favorites> getFavoritesByUserId(long user_id,int begin,int size) {
		conn = JdbcUtils.getConnection();
		ArrayList<Favorites> al = new ArrayList<Favorites>();
		Favorites fav = null;
		String sql = "select favorites_id,video_id,user_id,time from table_favorites where user_id=?"
				+" order by time desc limit " + begin + "," + size;;
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, user_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				fav = new Favorites(rs.getLong("favorites_id"),
						rs.getLong("video_id"), rs.getLong("user_id"),
						rs.getTimestamp("time"));
				al.add(fav);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
}
