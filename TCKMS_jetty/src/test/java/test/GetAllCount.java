package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.and9.tckms.db.JdbcUtils;
import com.sun.org.apache.regexp.internal.recompile;

public class GetAllCount{

	/**
	 * @param args
	 */
	public static void main(String[] args){
		Thread1[] t=new Thread1[100];
		for(int i=0;i<t.length;i++){
			createThread(t, i);
		}
	}

	private synchronized static void createThread(Thread1[] t, int i) {
		t[i]=new Thread1(i);
		t[i].start();
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		long start=System.currentTimeMillis();
		conn=JdbcUtils.getConnection();
		String sql="SELECT COUNT(tid) FROM testcount";
		try {
			ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		rs.next();
		//System.out.println("count="+rs.getLong(1));
		
		conn=JdbcUtils.getConnection();
		sql="SELECT * FROM testcount limit 0,20";
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			//System.out.println("tid="+rs.getLong("tid")+" name="+rs.getString("name"));
			Thread.sleep(10);
		}
		
		Date date2=new Date();
		long end=System.currentTimeMillis();
		System.out.println(i+":"+(end-start)+"ms");
		//alltime+=end-start;
		//System.out.println(Thread1.alltime*1.0/1000+"s");
		} catch (SQLException e) {
			
		} catch (InterruptedException e) {
		
		}
		finally{
			JdbcUtils.free(rs, ps, conn);//�ͷ���Դ
		}
	}

}
class Thread1 extends Thread{
	
	public static int count=0;
	
	 int i;
	
	public Thread1(int i){
		this.i=i;
	}
	public void  run() {
	}
}

