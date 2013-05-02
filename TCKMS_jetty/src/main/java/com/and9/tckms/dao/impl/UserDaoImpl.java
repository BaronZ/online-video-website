package com.and9.tckms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.and9.tckms.dao.UserDao;
import com.and9.tckms.db.JdbcUtils;
import com.and9.tckms.entity.User;
import com.and9.tckms.exception.DaoException;
import com.and9.tckms.web.utils.UserMappingUtils;




/**
 * 用户类的封装
 * @author MC
 *
 */
public class UserDaoImpl implements UserDao{
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public void delete(User user) {
		// TODO Auto-generated method stub
		
	}

	//登录 :ID与psw登录
	public User findByUsername(String username) {
		
		conn = JdbcUtils.getConnection();
		User user = null;
		String sql = "select * from user_table where username=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,username);
			rs = ps.executeQuery();
			while(rs.next()){
				user = UserMappingUtils.userMapping(rs);
			}
		} catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			throw new DaoException(e.getMessage(),e);
			
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}
		
		return user;
	}


	public void update(User user) {
		// TODO Auto-generated method stub
		
	}
	

	public User getUser(long id) {
		// TODO Auto-generated method stub
		return null;
	}

}
