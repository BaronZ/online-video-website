package com.and9.tckms.web.utils;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.and9.tckms.entity.Authority;
import com.and9.tckms.entity.News;
import com.and9.tckms.entity.Role;
import com.and9.tckms.entity.User;
import com.and9.tckms.entity.Video;
import com.and9.tckms.entity.VideoType;
import com.sun.crypto.provider.RSACipher;
import com.sun.org.apache.regexp.internal.recompile;

/**
 * @作用：封装用户对象
 * @author MC
 * */
public class NewsMappingUtils {
	
	public static News newsMapping(ResultSet rs){
		News news=new News();
		try {
			news.setNews_id(rs.getInt("news_id"));
			news.setNews_title(rs.getString("news_title"));
			news.setNews_info(rs.getString("news_info"));
			news.setNews_date(rs.getDate("news_date"));
			news.setUser_id(rs.getInt("user_id"));
			news.setNickname(rs.getString("nickname"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return news;
	}

}
