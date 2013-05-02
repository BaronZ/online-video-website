package com.and9.tckms.entity;

import java.util.Date;
import java.util.Set;
/**
 *用户实体 
 */
public class User {
	
	private int user_id;			//用户的id
	private String username;		//用户名
	private String password;		//密码
	private String nickname;		//网络名
	private String realname;		//姓名
	private String sex;				//性别
	private String email;			//邮箱
	private Date birthday;			//生日
	private int major_id;			//专业id
	private String entrance_year;	//入学年份
	private String user_type;		//用户类型
	private Set<Role> roles;		//角色集合
	private Set<Authority> authorities;	//权限集合
	private Set<String> authority_nameSet;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEntrance_year() {
		return entrance_year;
	}
	public void setEntrance_year(String entranceYear) {
		entrance_year = entranceYear;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String userType) {
		user_type = userType;
	}
	public int getMajor_id() {
		return major_id;
	}
	public void setMajor_id(int majorId) {
		major_id = majorId;
	}
	
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public Set<Authority> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(Set<Authority> authorities) {
		this.authorities = authorities;
	}
	public Set<String> getAuthority_nameSet() {
		return authority_nameSet;
	}
	public void setAuthority_nameSet(Set<String> authority_nameSet) {
		this.authority_nameSet = authority_nameSet;
	}
	

	
//	private long uid;             // 数据库中用户的主键
//	private String username;      //b4:id 学号或者工号，用来做登录名  
//	private String password;	  //b4 psw
//	private String nickname;      //昵称
//	private String realname;      //b4 name 学生，老师真实姓名  
//	private String role;          //身份：学生，老师，管理员
//	private String sex;           //性别
//	private String email;         //邮件
//	private Date bday;			  //生日
//	private String sdept;         //系别
//	private String major;		  //专业
//	public long getUid() {
//		return uid;
//	}
//	public void setUid(long uid) {
//		this.uid = uid;
//	}
//	public String getUsername() {
//		return username;
//	}
//	public void setUsername(String username) {
//		this.username = username;
//	}
//	public String getPassword() {
//		return password;
//	}
//	public void setPassword(String password) {
//		this.password = password;
//	}
//	public String getNickname() {
//		return nickname;
//	}
//	public void setNickname(String nickname) {
//		this.nickname = nickname;
//	}
//	public String getRealname() {
//		return realname;
//	}
//	public void setRealname(String realname) {
//		this.realname = realname;
//	}
//	public String getRole() {
//		return role;
//	}
//	public void setRole(String role) {
//		this.role = role;
//	}
//	public String getSex() {
//		return sex;
//	}
//	public void setSex(String sex) {
//		this.sex = sex;
//	}
//	public String getEmail() {
//		return email;
//	}
//	public void setEmail(String email) {
//		this.email = email;
//	}
//	public Date getBday() {
//		return bday;
//	}
//	public void setBday(Date bday) {
//		this.bday = bday;
//	}
//	public String getSdept() {
//		return sdept;
//	}
//	public void setSdept(String sdept) {
//		this.sdept = sdept;
//	}
//	public String getMajor() {
//		return major;
//	}
//	public void setMajor(String major) {
//		this.major = major;
//	}
//	
//	
//	

}
