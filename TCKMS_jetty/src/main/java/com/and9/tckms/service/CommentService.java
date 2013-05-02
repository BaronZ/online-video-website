package com.and9.tckms.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.and9.tckms.dao.CommentDao;
import com.and9.tckms.entity.MessageBoard;
import com.and9.tckms.factory.CommentDaoFactory;

public class CommentService {
	
	private CommentDao commentDao = CommentDaoFactory.getInstance().getCommentDao();
	
	/**
	 * 留言
	 * @author zzb
	 */
	public int comment(MessageBoard msgBoard){
		return commentDao.input(msgBoard);
	}
	/**
	 * 获得留言
	 * @author zzb
	 * */
	public List<MessageBoard> getComments(long vid,int begin,int size){
		return commentDao.getCommentsBySizeNVid(vid, begin, size);
	}
	
	/**
	 * 根据视频的id,把视频的留言打印到网页上
	 *@author zzb
	 * */
	public void showComments(long vid) throws IOException {
		ArrayList al = (ArrayList) getComments(vid, 0, 10);
		ServletActionContext.getResponse().setContentType(  
                "text/html;charset=utf-8");  
//		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		//        ServletActionContext.getResponse().setHeader("Cache-Control",  
//                "no-cache");  
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		Iterator<MessageBoard> it = al.iterator();
		MessageBoard msgb = null;
		while(it.hasNext()){
			msgb=it.next();
			
            out.write("<div class='border-bottom mt20 clearfix' id='comment_userComment'>");
            out.write("<img class='fl mr30' src='images/myIcon.gif' />");
            out.write("<p class='fb'>"+msgb.getNickname()+"<span class='ml50 fn grey'>发表于："+msgb.getTime()+"</span></p>"); 	
            out.write("<div class='w600 mt20 mb10' id='comment_userComment_detail'>");    
            out.write("<span class='fl mt-50'>");
            out.write(msgb.getContent());
            out.write("</span></div></div>");
                
			
			out.flush();
		}
	}
}
