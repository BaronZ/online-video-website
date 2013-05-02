package com.and9.tckms.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcUtils {
	private static Connection conn = null;
	private static String url = "jdbc:mysql://localhost:3306/tckms?useUnicode=true&characterEncoding=UTF-8";
	private static String user = "root";
	private static String password = "root";
	private JdbcUtils() {
	}

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void free(ResultSet rs, PreparedStatement ps, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (ps != null)
					try {
						ps.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						if (conn != null)
							try {
								conn.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
					}
			}
		}
	}
}
