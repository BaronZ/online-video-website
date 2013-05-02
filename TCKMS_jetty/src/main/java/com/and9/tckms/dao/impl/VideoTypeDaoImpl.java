package com.and9.tckms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.and9.tckms.dao.VideoTypeDao;
import com.and9.tckms.db.JdbcUtils;
import com.and9.tckms.entity.VideoSubject;
import com.and9.tckms.entity.VideoType;
import com.and9.tckms.exception.DaoException;
import com.and9.tckms.web.utils.VideoMappingUtils;



public class VideoTypeDaoImpl implements VideoTypeDao{
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * 返回所有视频类型对象
	 */
	public List<VideoType> getAllVideoType() {
		// TODO Auto-generated method stub
		conn = JdbcUtils.getConnection();
		List<VideoType> list = new ArrayList();
		String sql = "select * from " +
				"video_type_table where video_type_id!=1";
try {
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				list.add(VideoMappingUtils.videoTypeMapping(rs));
			}
			
			//System.out.println("视频个数:"+ps.executeUpdate());
			
		} catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			throw new DaoException(e.getMessage(),e);
			
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}		
		return list;
		
	}

	public VideoType getVideoTypeByID(int vtid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<VideoSubject> getAllVideoSubject() {
		// TODO Auto-generated method stub
		conn=JdbcUtils.getConnection();
		List<VideoSubject> videoSubjects=new ArrayList<VideoSubject>();
		String sql="SELECT * FROM video_subject_table ORDER BY video_subject_order ASC";
		try{
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				videoSubjects.add(VideoMappingUtils.videoSubjectMapping(rs));
			}
		} catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			throw new DaoException(e.getMessage(),e);
			
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}		
		
		return videoSubjects;
	}

	@Override
	public List<VideoType> getVideoTypesByVideoSbujectId(int video_subject_id) {
		// TODO Auto-generated method stub
		conn=JdbcUtils.getConnection();
		List<VideoType> videoTypes=new ArrayList<VideoType>();
		String sql="SELECT * FROM video_type_table WHERE video_subject_id=? ORDER BY video_type_order DESC";
		try{
			ps = conn.prepareStatement(sql);
			ps.setInt(1, video_subject_id);
			rs = ps.executeQuery();
			while(rs.next()){
				videoTypes.add(VideoMappingUtils.videoTypeMapping(rs));
			}
		}catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			throw new DaoException(e.getMessage(),e);
			
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}		
		return videoTypes;
	}
}
