package com.and9.tckms.factory;

import java.io.InputStream;
import java.util.Properties;

import com.and9.tckms.dao.CommentDao;
import com.and9.tckms.dao.NewsDao;

/**
 * 产生CommnetDao的工厂
 * */
public class NewsDaoFactory {
	private NewsDao newsDao = null;
	private static NewsDaoFactory instance = new NewsDaoFactory();
	
	private NewsDaoFactory(){
		
		Properties prop = new Properties();
		InputStream inStream = NewsDaoFactory.class.getClassLoader().getResourceAsStream("DaoConfig.properties");
		try {
			prop.load(inStream);
			//property 读取value
			String newsDaoClass = prop.getProperty("NewsDaoClass");
			
			newsDao = (NewsDao)Class.forName(newsDaoClass).newInstance();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static NewsDaoFactory getInstance(){
		return instance;
	}
	public NewsDao getNewsDao(){
		return newsDao;
	}
}
