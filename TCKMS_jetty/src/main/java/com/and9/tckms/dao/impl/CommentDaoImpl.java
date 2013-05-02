package com.and9.tckms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.and9.tckms.dao.CommentDao;
import com.and9.tckms.db.JdbcUtils;
import com.and9.tckms.entity.MessageBoard;
import com.and9.tckms.web.utils.CommentMappingUtils;

/**
 * 留言dao实现类
 * 
 * @author zzb
 */
public class CommentDaoImpl implements CommentDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * 插入数据，判断数据库中是否有存在的id，若有，则是更新，若无，则是插入 目前此处只做插入
	 * */
	public int input(MessageBoard msgBoard) {
		conn = JdbcUtils.getConnection();
		int inserted = 0;
		String sql = "insert into table_msgboard(`video_id`,`user_id`,`time`,`content`,`nickname`)"
				+ "values(?,?,?,?,?)";
		try {

			ps = conn.prepareStatement(sql);
			// ps.setLong(1, msgBoard.getMsg_id());
			ps.setLong(1, msgBoard.getVideo_id());
			ps.setLong(2, msgBoard.getUser_id());
			ps.setTimestamp(3, msgBoard.getTime());
			ps.setString(4, msgBoard.getContent());
			ps.setString(5, msgBoard.getNickname());
			inserted = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return inserted;
	}

	/**
	 * 根据视频id，从指定位置begin，获取指定长度size的留言
	 * 
	 * @author zzb
	 * */
	@Override
	public List<MessageBoard> getCommentsBySizeNVid(long vid, int begin, int size) {
		Connection conn = JdbcUtils.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		System.out.println("vid:"+vid);
		String sql = "select msg_id,video_id,user_id,time,content,nickname from table_msgboard where video_id=?"
				+" order by time desc limit " + begin + "," + size;
		ArrayList<MessageBoard> al = new ArrayList();
		MessageBoard msgBoard = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, vid);
			rs = ps.executeQuery();
			while (rs.next()) {
				msgBoard = CommentMappingUtils.commentMapping(rs);
				al.add(msgBoard);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}

}
