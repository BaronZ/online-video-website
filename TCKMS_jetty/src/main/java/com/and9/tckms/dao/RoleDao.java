package com.and9.tckms.dao;

import java.util.List;

import com.and9.tckms.entity.Authority;
import com.and9.tckms.entity.Role;

public interface RoleDao {
	
	public List<Role> getRolesByUserId(int user_id);
	
}
