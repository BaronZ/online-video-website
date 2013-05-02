package com.and9.tckms.factory;

import java.io.InputStream;
import java.util.Properties;

import com.and9.tckms.dao.CommentDao;

/**
 * 产生CommnetDao的工厂
 * */
public class CommentDaoFactory {
	private CommentDao commentDao = null;
	private static CommentDaoFactory instance = new CommentDaoFactory();
	
	private CommentDaoFactory(){
		
		Properties prop = new Properties();
		InputStream inStream = CommentDaoFactory.class.getClassLoader().getResourceAsStream("DaoConfig.properties");
		try {
			prop.load(inStream);
			//property 读取value
			String commentDaoClass = prop.getProperty("CommentDaoClass");
			
			commentDao = (CommentDao)Class.forName(commentDaoClass).newInstance();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static CommentDaoFactory getInstance(){
		return instance;
	}
	public CommentDao getCommentDao(){
		return commentDao;
	}
}
