package com.and9.tckms.dao;

import com.and9.tckms.entity.User;



public interface UserDao {
	
	//根据用户名查找数据库，根据boolean值判断是否登录
	public abstract User findByUsername(String username) ;
	//根据id查询学生信息
	public abstract User getUser(long id);
	//更新个人信息
	public abstract void update(User user);
	//删除
	public abstract void delete(User user);
}
