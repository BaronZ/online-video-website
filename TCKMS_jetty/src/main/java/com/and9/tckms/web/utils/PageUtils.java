package com.and9.tckms.web.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.and9.tckms.db.JdbcUtils;
import com.and9.tckms.entity.Video;

/**
 * 主要根据sql语句来获取该sql结果的总页数和当前页所显示的内容
 * 先获取总页数再用当前页所显示的内容
 * @author MC
 *
 */
public class PageUtils {
	
	public static final int VIDEO_PAGE_SIZE=12;			//每页显示12个视频
	public static final int VIDEO_BOTTOM_PAGE_SIZE=7;	//页面底部显示的页码数为7个
	private static int pageAllCount=0;					//结果集分页后的总页数
	
	private PageUtils(){
		
	}
	
	
	/**
	 * 获取结果集的总页数
	 * sql语句返回结果必须为整型，否则出错
	 * @param sql
	 * @return
	 * @throws SQLException
	 */
	public static int getVideoPageCount(int vcount){
		pageAllCount=( vcount%VIDEO_PAGE_SIZE==0 ) ? 
				( vcount/VIDEO_PAGE_SIZE ) : ( vcount/VIDEO_PAGE_SIZE+1 );
		return pageAllCount;
	}
	
	/**
	 * 根据当前页的页数返回当前也的数据
	 * @param sql
	 * @param currentPage
	 * @return
	 * @throws SQLException
	 */
	public static List<Video> getCurrentPageVideos(String sql,int currentPage)throws SQLException{
		if(currentPage<0)
			currentPage=1;
		if(currentPage>pageAllCount)
			currentPage=pageAllCount;
		
		List<Video> videos=new ArrayList<Video>();
		sql+=" limit "+(currentPage-1)*VIDEO_PAGE_SIZE+","+(VIDEO_PAGE_SIZE);
		
		//封装对象
		
		return videos;
	}
	
	/**
	 * 返回视频页面底部的页码数
	 * allPageCount为总页数
	 * currentPage为当前页
	 * @param allPageCount
	 * @param currentPage
	 * @return
	 */
	public static int[] getVideoBottomPage(int allPageCount,int currentPage){

		int[] bottomPageSize;
		int f=0;
		
		if(allPageCount==0)
			allPageCount=1;
		
		if(allPageCount<=VIDEO_BOTTOM_PAGE_SIZE){
			bottomPageSize=new int[allPageCount];
			f=1;
		}
		else{
			if(currentPage<=VIDEO_BOTTOM_PAGE_SIZE/2+1){
				f=1;
			}
			else
			if((currentPage-(VIDEO_BOTTOM_PAGE_SIZE/2+1)>0)
					&&(currentPage+(VIDEO_BOTTOM_PAGE_SIZE/2+1)<=allPageCount)){
				f=currentPage-(VIDEO_BOTTOM_PAGE_SIZE/2);
			}
			else
			if(currentPage>allPageCount-(VIDEO_BOTTOM_PAGE_SIZE/2+1)){
				f=allPageCount-(VIDEO_BOTTOM_PAGE_SIZE-1);
			}
			bottomPageSize=new int[VIDEO_BOTTOM_PAGE_SIZE];
		}
		
		for(int i=0;i<bottomPageSize.length;i++){
			bottomPageSize[i]=f+i;
		}

		return bottomPageSize;
	}
}
