package com.and9.tckms.dao;

import java.util.List;

import com.and9.tckms.entity.Authority;

public interface AuthorityDao {
	
	public List<Authority> getAuthoritiesByRoleId(int role_id);
	
}
