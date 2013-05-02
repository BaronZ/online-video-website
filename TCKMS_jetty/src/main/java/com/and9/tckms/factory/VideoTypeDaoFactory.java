package com.and9.tckms.factory;

import java.io.InputStream;
import java.util.Properties;

import com.and9.tckms.dao.VideoTypeDao;

import sun.security.jca.GetInstance;


public class VideoTypeDaoFactory {
	
	VideoTypeDao vtDao = null;
	private static VideoTypeDaoFactory instance = new VideoTypeDaoFactory();
	
	private VideoTypeDaoFactory(){
		try{
			Properties prop = new Properties();
		
			InputStream inStream = VideoTypeDaoFactory.class.getClassLoader()
			.getResourceAsStream("DaoConfig.properties");
			
			prop.load(inStream);
			String vtDaoClass = prop.getProperty("VideoTypeDaoClass");
			System.out.println(vtDaoClass);
			
			vtDao = (VideoTypeDao) Class.forName(vtDaoClass).newInstance();
		} catch (Exception e) {
				throw new ExceptionInInitializerError();
		}
	}
	
	public static VideoTypeDaoFactory getInstance(){
		return instance;
	}
	
	public  VideoTypeDao getVideoTypeDao(){
		return vtDao;
	}
}
