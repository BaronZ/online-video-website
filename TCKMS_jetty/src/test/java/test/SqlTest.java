package test;

import java.util.ArrayList;

import com.and9.tckms.dao.VideoDao;
import com.and9.tckms.dao.impl.VideoDaoImpl;

public class SqlTest {
	public static void main(String[] args) {
		VideoDao vdao = new VideoDaoImpl();
		ArrayList al = (ArrayList) vdao.getAllVideoList(0, 10);
		System.out.println(al.size());
	}
}
