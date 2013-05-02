package com.and9.tckms.web.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.and9.tckms.entity.MessageBoard;

public class CommentMappingUtils {
	public static MessageBoard commentMapping(ResultSet rs) {
		MessageBoard msgBoard = null;
		try {
			long msg_id = rs.getLong("msg_id");
			long video_id = rs.getLong("video_id");
			long user_id = rs.getLong("user_id");
			Timestamp time = rs.getTimestamp("time");
			String nickname = rs.getString("nickname");
			String content = rs.getString("content");
			msgBoard = new MessageBoard(video_id, user_id, time, content,
					nickname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return msgBoard;
	}

}
