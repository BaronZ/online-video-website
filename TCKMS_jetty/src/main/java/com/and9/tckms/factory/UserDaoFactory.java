package com.and9.tckms.factory;

import java.io.InputStream;
import java.util.Properties;

import com.and9.tckms.dao.UserDao;


public class UserDaoFactory {
	UserDao userDao = null;
	
	//ManagerDao mDao = null;
	//Teacher tDao = null;
	private static UserDaoFactory instance = new UserDaoFactory();
	
	private UserDaoFactory(){
		try {
			Properties prop = new Properties();
			//InputStream inStream = new FileInputStream(new File("src/DaoConfig.properties"));
			//把上面的方法改成下面的方法，不要固定地址，但要把配置文件放在src目录下才能用下面方法
			InputStream inStream = UserDaoFactory.class.getClassLoader()
				.getResourceAsStream("DaoConfig.properties");
			prop.load(inStream);
			String userDaoClass = prop.getProperty("UserDaoClass");
			
			//到时若要修改数据库只需修改配置文件
			userDao = (UserDao) Class.forName(userDaoClass).newInstance();
			
		} catch (Exception e) {
			//初始化异常
			throw new ExceptionInInitializerError();
		}
	}
	
	public static UserDaoFactory getInstance(){
		return instance;
	}
	public UserDao getUserDao(){
		
		return userDao;
	}
//	public Teacher getTDao(){
//		return tDao;
//	}
}
