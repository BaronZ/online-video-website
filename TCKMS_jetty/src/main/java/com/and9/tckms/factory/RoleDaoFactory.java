package com.and9.tckms.factory;

import java.io.InputStream;
import java.util.Properties;

import com.and9.tckms.dao.RoleDao;
import com.and9.tckms.dao.UserDao;


public class RoleDaoFactory {
	RoleDao roleDao = null;
	
	//ManagerDao mDao = null;
	//Teacher tDao = null;
	private static RoleDaoFactory instance = new RoleDaoFactory();
	
	private RoleDaoFactory(){
		try {
			Properties prop = new Properties();
			//InputStream inStream = new FileInputStream(new File("src/DaoConfig.properties"));
			//把上面的方法改成下面的方法，不要固定地址，但要把配置文件放在src目录下才能用下面方法
			InputStream inStream = RoleDaoFactory.class.getClassLoader()
				.getResourceAsStream("DaoConfig.properties");
			prop.load(inStream);
			String userDaoClass = prop.getProperty("RoleDaoClass");
			
			//到时若要修改数据库只需修改配置文件
			roleDao = (RoleDao) Class.forName(userDaoClass).newInstance();
			
		} catch (Exception e) {
			//初始化异常
			throw new ExceptionInInitializerError();
		}
	}
	
	public static RoleDaoFactory getInstance(){
		return instance;
	}
	public RoleDao getRoleDao(){
		
		return roleDao;
	}
//	public Teacher getTDao(){
//		return tDao;
//	}
}
