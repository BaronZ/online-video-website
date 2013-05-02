package com.and9.tckms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.and9.tckms.dao.VideoDao;
import com.and9.tckms.db.JdbcUtils;
import com.and9.tckms.entity.Video;
import com.and9.tckms.exception.DaoException;
import com.and9.tckms.web.utils.VideoMappingUtils;

public class VideoDaoImpl implements VideoDao{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/**
	 * 根据视频类型的id获取视频列表返回给首页
	 * @param vtid
	 * @return
	 * @author MC,TheRealBo
	 */
	public List<Video> getVideoListByVTId(int vtid, long top, int size) {
		
		if(vtid==0||top==0||size==0)
			return null;
		List<Video> videoList=new ArrayList<Video>();
		
		conn = JdbcUtils.getConnection();
		String sql = "SELECT video_id,video_title,video_type_name,user_id,nickname," +
				"video_clicks,video_link,video_img_url,video_udate FROM video_user_view " +
				"WHERE video_type_id=? ORDER BY video_id DESC limit ?,?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vtid);
			ps.setLong(2, top);
			ps.setInt(3, size);
			rs = ps.executeQuery();
			while(rs.next()){
				videoList.add(VideoMappingUtils.videoMapping2Index(rs,null));
			}
		}catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}	
		return videoList;
	}
	/**
	 * 返回前size个所有类型的视频列表
	 * @author MC
	 */
	public List<Video> getAllVideoList(long top, int size) {
		List<Video> videoList=new ArrayList<Video>();
		conn = JdbcUtils.getConnection();
		String sql = "SELECT video_id,video_title,video_type_name,user_id,nickname," +
				"video_clicks,video_link,video_img_url,video_udate FROM video_user_view " +
				" ORDER BY video_id DESC limit ?,?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, top);
			ps.setInt(2, size);
			rs = ps.executeQuery();
			while(rs.next()){
				videoList.add(VideoMappingUtils.videoMapping2Index(rs,null));
			}
		}catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			throw new DaoException(e.getMessage(),e);
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}	
		return videoList;
	}
	/**
	 * 返回所有类型的视频总个数
	 */
	public int getAllCountofVideoList() {
		int count=0;
		conn = JdbcUtils.getConnection();
		String sql = "SELECT COUNT(video_id) FROM video_user_view ORDER BY video_id DESC "
			+" limit "+Integer.MAX_VALUE;
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


	/**
	 * 返回某个类型的视频总个数
	 */
	public int getCountofVideoListByVTId(int vtid) {
		int count=0;
		conn = JdbcUtils.getConnection();
		String sql = "SELECT COUNT(video_id) FROM video_user_view WHERE video_type_id=? " +
				"ORDER BY video_id DESC limit "+Integer.MAX_VALUE;
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, vtid);
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


	/**
	 * 根据点击数返回某类型前十个视频
	 */
	public List<Video> getVideoListByClicks(int vtid) {
		// TODO Auto-generated method stub
		conn=JdbcUtils.getConnection();
		List<Video> hotVideoList=new ArrayList<Video>();
		String sql="SELECT  video_id,video_title,video_clicks,video_link from video_user_view " +
				"WHERE video_type_id=? ORDER BY video_clicks DESC  LIMIT 10";
		try{
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vtid);
			rs=ps.executeQuery();
			while(rs.next()){
				hotVideoList.add(VideoMappingUtils.hotvideoMapping2Index(rs));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}	
		return hotVideoList;
	}


	/**
	 * 根据点击数返回所有类型的前十个视频
	 */
	public List<Video> getVideoListByClicks() {
		// TODO Auto-generated method stub
		conn=JdbcUtils.getConnection();
		List<Video> hotVideoList=new ArrayList<Video>();
		String sql="select video_id,video_title,video_clicks,video_link from video_user_view " +
				"ORDER BY video_clicks DESC  LIMIT 10";
		try{
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				hotVideoList.add(VideoMappingUtils.hotvideoMapping2Index(rs));
			}
		}catch (Exception e) {
			// TODO: handle exception
			throw new DaoException(e.getMessage(),e);
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}	
		return hotVideoList;
	}


	/**
	 * 根据关键字key，获取其包含关键字的视频总数
	 * 目前仅搜索标题
	 */
	public int getCountofVideoListByKey(String key) {
		int count=0;
		conn = JdbcUtils.getConnection();
		String sql = "SELECT COUNT(video_id) FROM video_user_view WHERE UPPER(video_title) LIKE " +
				"UPPER('%"+key+"%') ORDER BY video_id DESC limit "+Integer.MAX_VALUE;
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


	/**
	 * 根据关键字key，获取其包含关键字的视频列表
	 * 目前仅搜索标题
	 */
	public List<Video> getVideoListByKey(String key, long top, int size) {
		// TODO Auto-generated method stub
		conn=JdbcUtils.getConnection();
		List<Video> videoList=new ArrayList<Video>();
		String sql = "SELECT video_id,video_title,video_type_name,user_id,nickname,video_clicks,video_link," +
				"video_img_url,video_udate FROM video_user_view " +
				"WHERE UPPER(video_title) LIKE UPPER('%"+key+"%') ORDER BY video_id DESC limit ?,?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, top);
			ps.setInt(2, size);
			rs = ps.executeQuery();
			while(rs.next()){
				videoList.add(VideoMappingUtils.videoMapping2Index(rs,key));
			}
		}catch (SQLException e) {
			//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}	
		return videoList;
	}
	
	/**
	 * 更新视频点击数
	 * */
	public int updateClicks(long vid){
		conn=JdbcUtils.getConnection();
		String sql = "update video_table set video_clicks=video_clicks+1 where video_id = ?";
		int changed=0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, vid);
			changed = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return changed;
	}

	/**
	 * 根据视频id获取视频信息
	 */
	public Video getVideoByVid(long vid) {
		conn=JdbcUtils.getConnection();
		//vduration
		String sql = "select video_id,video_title,nickname,video_udate,video_clicks,video_type_name," +
				"video_link,video_info,video_duration,video_tags,video_img_url from video_user_view where video_id=? ";
		Video video = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, vid);
			rs = ps.executeQuery();
			while(rs.next()){
				 video = VideoMappingUtils.playVideoMapping(rs);//播放页面视频信息封装	
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return video;
	}
	/**
	 * 保存视频信息
	 */
	@Override
	public int saveUploadVideo(Video video) {
		// TODO Auto-generated method stub
		conn=JdbcUtils.getConnection();
		StringBuilder sql = new StringBuilder(
				"insert into video_table(video_name,video_title,video_info,");
		sql.append(
				"video_link,video_udate,video_tags,video_size,video_img_url,video_type_id,user_id)");
			sql.append(" values(?,?,?,?,?,?,?,?,?,?);");
		int changed=0;
		try {
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, video.getVideo_name());
			ps.setString(2, video.getVideo_title());
			ps.setString(3, video.getVideo_info());
			ps.setString(4, video.getVideo_link());
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			ps.setString(5,df.format(video.getVideo_udate()));
			
			StringBuilder video_tags=new StringBuilder();
			for(String s:video.getVideo_tag()){
				video_tags.append(s);
				video_tags.append(",");
			}
			video_tags.substring(0, video_tags.length()-1);
			ps.setString(6, video_tags.toString());
			
			ps.setInt(7, video.getVideo_size());
			ps.setString(8, video.getVideo_img_url());
			ps.setInt(9, video.getVideo_type_id());
			ps.setInt(10, video.getUser_id());
			
			changed = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return changed;
	}
	@Override
	public int saveUploadVideoName(Video video) {
		conn=JdbcUtils.getConnection();
		StringBuilder sql = new StringBuilder(
				"insert into video_table(video_name,video_link,video_udate,video_size,video_img_url,video_type_id,user_id)");
			sql.append(" values(?,?,?,?,?,?,?,?,?,?);");
		return 0;
	}
	
	
	
	@Override
	public List<Video> getRecommendedVideos(long top,int size) {
		// TODO Auto-generated method stub
		List<Video> recommendVideos=new ArrayList<Video>();
		
		conn=JdbcUtils.getConnection();
		String sql="SELECT video_id,video_title,video_type_name,user_id,nickname," +
					"video_clicks,video_link,video_img_url,video_udate FROM video_recommend_view " +
					" ORDER BY video_recommend_id DESC limit ?,?";
		
		try{
			ps = conn.prepareStatement(sql);
			ps.setLong(1, top);
			ps.setInt(2, size);
			rs = ps.executeQuery();
			while(rs.next()){
				recommendVideos.add(VideoMappingUtils.videoMapping2Index(rs,null));
		}
		}catch (SQLException e) {
		//出错不能处理，直接抛出一个runtime异常，让程序结束，不能把隐藏
			e.printStackTrace();
		}finally{
			JdbcUtils.free(rs, ps, conn);//释放资源
		}	
		return recommendVideos;
	}
	
	@Override
	public int getCountofRecommendedVideos() {
		int count=0;
		conn = JdbcUtils.getConnection();
		String sql = "SELECT COUNT(video_recommend_id) FROM video_recommend_view ORDER BY video_recommend_id DESC "
			+" limit "+Integer.MAX_VALUE;
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
	
	/**
	 * 根据用户id(user_id)获取视频列表
	 */
	@Override
	public List getVideosByUid(long uid,int begin,int size) {
		conn = JdbcUtils.getConnection();
		
		String sql = "select video_id,video_title,nickname,video_udate,video_clicks,video_type_name," +
				"video_link,video_duration,video_img_url from video_user_view where user_id=? "+
				"ORDER BY video_id DESC limit ?,?";
		List<Video> videos = new ArrayList<Video>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, uid);
			ps.setInt(2, begin);
			ps.setInt(3, size);
			rs = ps.executeQuery();
			Video video = null;
			while(rs.next()){
				 video = VideoMappingUtils.videoMapping2Uploads(rs);//视频信息封装	
				 videos.add(video);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return videos;
	}
	
	
}


