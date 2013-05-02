package com.and9.tckms.factory;

import java.io.InputStream;
import java.util.Properties;

import com.and9.tckms.dao.FavoritesDao;

/**
 * 产生FavoritesDao的工厂
 * */
public class FavoritesDaoFactory {
	private  FavoritesDao favDao = null;
	private static FavoritesDaoFactory instance = new FavoritesDaoFactory();
	
	private FavoritesDaoFactory(){
		
		Properties prop = new Properties();
		InputStream inStream = FavoritesDaoFactory.class.getClassLoader().getResourceAsStream("DaoConfig.properties");
		try {
			prop.load(inStream);
			//property 读取value
			String favDaoClass = prop.getProperty("FavoritesDaoClass");
			favDao = ( FavoritesDao)Class.forName(favDaoClass).newInstance();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static FavoritesDaoFactory getInstance(){
		return instance;
	}
	public FavoritesDao getFavoritesDao(){
		return favDao;
	}
}
