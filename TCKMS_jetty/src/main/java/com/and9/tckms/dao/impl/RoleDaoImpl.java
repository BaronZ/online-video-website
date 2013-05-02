package com.and9.tckms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.and9.tckms.dao.RoleDao;
import com.and9.tckms.db.JdbcUtils;
import com.and9.tckms.entity.Role;
import com.and9.tckms.entity.Video;
import com.and9.tckms.web.utils.UserMappingUtils;
import com.and9.tckms.web.utils.VideoMappingUtils;

public class RoleDaoImpl implements RoleDao{

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public List<Role> getRolesByUserId(int user_id) {
		
		List<Role> roles=new ArrayList<Role>();
		
		conn = JdbcUtils.getConnection();
		String sql = "SELECT * FROM user_role_view WHERE user_id=? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			rs = ps.executeQuery();
			while(rs.next()){
				roles.add(UserMappingUtils.roleMapping(rs));
			}
		}catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}	
		return roles;
		
	}
	
}
