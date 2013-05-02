package com.and9.tckms.factory;

import java.io.InputStream;
import java.util.Properties;

import com.and9.tckms.dao.AuthorityDao;
import com.and9.tckms.dao.CommentDao;

/**
 * 产生AuthorityDao的工厂
 * */
public class AuthorityDaoFactory {
	private AuthorityDao authorityDao = null;
	private static AuthorityDaoFactory instance = new AuthorityDaoFactory();
	
	private AuthorityDaoFactory(){
		
		Properties prop = new Properties();
		InputStream inStream = AuthorityDaoFactory.class.getClassLoader().getResourceAsStream("DaoConfig.properties");
		try {
			prop.load(inStream);
			//property 读取value
			String authorityDaoClass = prop.getProperty("AuthorityDaoClass");
			
			authorityDao = (AuthorityDao)Class.forName(authorityDaoClass).newInstance();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static AuthorityDaoFactory getInstance(){
		return instance;
	}
	public AuthorityDao getAuthorityDao(){
		return authorityDao;
	}
}
