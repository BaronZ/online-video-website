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
 * ��Ҫ����sql�������ȡ��sql�������ҳ���͵�ǰҳ����ʾ������
 * �Ȼ�ȡ��ҳ�����õ�ǰҳ����ʾ������
 * @author MC
 *
 */
public class PageUtils {
	
	public static final int VIDEO_PAGE_SIZE=12;			//ÿҳ��ʾ12����Ƶ
	public static final int VIDEO_BOTTOM_PAGE_SIZE=7;	//ҳ��ײ���ʾ��ҳ����Ϊ7��
	private static int pageAllCount=0;					//�������ҳ�����ҳ��
	
	private PageUtils(){
		
	}
	
	
	/**
	 * ��ȡ���������ҳ��
	 * sql��䷵�ؽ������Ϊ���ͣ��������
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
	 * ���ݵ�ǰҳ��ҳ�����ص�ǰҲ������
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
		
		//��װ����
		
		return videos;
	}
	
	/**
	 * ������Ƶҳ��ײ���ҳ����
	 * allPageCountΪ��ҳ��
	 * currentPageΪ��ǰҳ
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
