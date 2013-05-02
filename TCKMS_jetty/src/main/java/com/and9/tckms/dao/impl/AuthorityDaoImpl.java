package com.and9.tckms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.and9.tckms.dao.AuthorityDao;
import com.and9.tckms.db.JdbcUtils;
import com.and9.tckms.entity.Authority;
import com.and9.tckms.web.utils.UserMappingUtils;

public class AuthorityDaoImpl implements AuthorityDao{

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	@Override
	public List<Authority> getAuthoritiesByRoleId(int role_id) {

		List<Authority> authorities=new ArrayList<Authority>();
		
		conn = JdbcUtils.getConnection();
		String sql = "SELECT * FROM role_authority_view WHERE role_id=? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, role_id);
			rs = ps.executeQuery();
			while(rs.next()){
				authorities.add(UserMappingUtils.authorityMapping(rs));
			}
		}catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}	
		return authorities;
	}

}
