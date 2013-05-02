package com.and9.tckms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.and9.tckms.dao.NewsDao;
import com.and9.tckms.db.JdbcUtils;
import com.and9.tckms.entity.News;
import com.and9.tckms.exception.DaoException;
import com.and9.tckms.web.utils.NewsMappingUtils;

public class NewsDaoImpl implements NewsDao{

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	@Override
	public List<News> getNewsList(int top, int size) {
		List<News> news=new ArrayList<News>();
		
		conn = JdbcUtils.getConnection();
		String sql="SELECT n.news_id,n.news_title,n.news_info,n.news_date,n.user_id,u.nickname FROM news_table n,user_table u " +
				" WHERE n.user_id=u.user_id ORDER BY n.news_id DESC LIMIT ?,?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, top);
			ps.setLong(2, size);
			rs = ps.executeQuery();
			while(rs.next()){
				news.add(NewsMappingUtils.newsMapping(rs));
			}
		} catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}	
		
		return news;
	}

	@Override
	public int getCountofAllNews() {
		int count=0;
		conn = JdbcUtils.getConnection();
		String sql = "SELECT COUNT(news_id) FROM news_table limit "+Integer.MAX_VALUE;
		try {
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				count=rs.getInt(1);
			}
		}catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			throw new DaoException(e.getMessage(),e);
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}
		return count;
	}

	@Override
	public News getNewsById(int news_id) {
		// TODO Auto-generated method stub
		News news=null;
		conn = JdbcUtils.getConnection();
		String sql = "SELECT n.news_id,n.news_title,n.news_info,n.news_date,n.user_id,u.nickname FROM news_table n,user_table u " +
				" WHERE n.user_id=u.user_id AND n.news_id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, news_id);
			rs=ps.executeQuery();
			while(rs.next()){
				news=NewsMappingUtils.newsMapping(rs);
			}
		}catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			throw new DaoException(e.getMessage(),e);
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}
		return news;
	}
}
