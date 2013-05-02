package com.and9.tckms.web.utils;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.and9.tckms.entity.Authority;
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
public class UserMappingUtils {
	
	public static User userMapping(ResultSet rs) {
		User user = new User();
		try {
			user.setUser_id(rs.getInt("user_id"));
			user.setUsername(rs.getString("username"));
			user.setNickname(rs.getString("nickname"));
			user.setPassword(rs.getString("password"));
			user.setRealname(rs.getString("realname"));
			user.setSex(rs.getString("sex"));
			user.setEmail(rs.getString("email"));
			user.setBirthday(rs.getDate("birthday"));
			user.setMajor_id(rs.getInt("major_id"));
			user.setEntrance_year(rs.getString("entrance_year"));
			user.setUser_type(rs.getString("user_type"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	public static Role roleMapping(ResultSet rs){
		Role role=new Role();
		try{
			role.setRole_id(rs.getInt("role_id"));
			role.setRole_name(rs.getString("role_name"));
			role.setRole_description(rs.getString("role_description"));
			role.setRole_type(rs.getString("role_type"));
		}catch(SQLException e){
			e.printStackTrace();
		}
		return role;
	}

	public static Authority authorityMapping(ResultSet rs) {
		// TODO Auto-generated method stub
		Authority authority=new Authority();
		try{
			authority.setAuthority_id(rs.getInt("authority_id"));
			authority.setAuthority_name(rs.getString("authority_name"));
			authority.setAuthority_description(rs.getString("authority_description"));
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return authority;
	}

}
