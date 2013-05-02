package com.and9.tckms.entity;

public class Authority {
	
	private int authority_id;
	private String authority_name;
	private String authority_description="暂无介绍";
	
	public int getAuthority_id() {
		return authority_id;
	}
	public void setAuthority_id(int authority_id) {
		this.authority_id = authority_id;
	}
	public String getAuthority_name() {
		return authority_name;
	}
	public void setAuthority_name(String authority_name) {
		this.authority_name = authority_name;
	}
	public String getAuthority_description() {
		return authority_description;
	}
	public void setAuthority_description(String authority_description) {
		this.authority_description = authority_description;
	}
	
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return authority_id;
	}
	
	
}
