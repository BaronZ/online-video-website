package test;

import java.util.List;

import com.and9.tckms.dao.VideoDao;
import com.and9.tckms.dao.impl.VideoDaoImpl;
import com.and9.tckms.entity.Video;
import com.and9.tckms.service.UserService;
import com.and9.tckms.web.utils.CipherUtil;


class insect{
	int i=9;
	int j;
	insect(){
		prt("i= "+i+" j="+j);
		j=39;
	}
	static int x1=prt("static insect x1 initialized");
	//static int x2=prt("x2");
	static int prt(String s){
		System.out.println(s);
		return 47;
	}
}
public class Wps extends insect{
	int k=prt("wps be initialized");
	Wps(){
		prt("k="+k);
		prt("j="+j);
	}
	static int x2=prt("static wps x2 initialized");
	static int prt(String s){
		System.out.println(s);
		return 63;
	}	

	public static void main(String[] args){
    	//insect.prt("initialized constructor");
    	//Wps w=new Wps();
    }
}
interface test{
	
}
