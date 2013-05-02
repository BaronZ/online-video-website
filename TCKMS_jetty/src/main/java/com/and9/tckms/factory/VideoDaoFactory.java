package com.and9.tckms.factory;

import java.io.InputStream;
import java.util.Properties;

import com.and9.tckms.dao.VideoDao;


public class VideoDaoFactory {
	VideoDao vDao = null;
	private static VideoDaoFactory instance = new VideoDaoFactory();
	 
	private VideoDaoFactory(){
		try {
			
			Properties prop = new Properties();
			
			InputStream inStream = VideoDaoFactory.class.getClassLoader()
				.getResourceAsStream("DaoConfig.properties");
			
			prop.load(inStream);
			//System.out.println("--------flag3");
			String vDaoClass = prop.getProperty("VideoDaoClass");
			System.out.println(vDaoClass);
			
			vDao = (VideoDao) Class.forName(vDaoClass).newInstance();
		} catch (Exception e) {
			throw new ExceptionInInitializerError();
		}
		
	}
	
	public static  VideoDaoFactory getInstance(){
		
		return instance;
	}
	public VideoDao getVideoDao(){
		
		return vDao;
	}
	

}
