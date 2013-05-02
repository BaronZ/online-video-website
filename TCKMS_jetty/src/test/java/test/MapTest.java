package test;

import java.util.ArrayList;
import java.util.List;

import javassist.runtime.Inner;


class A{
	int x;
	int y;
}

public class MapTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		fun();
	}
	
	
	static void fun(){
		A a=new A();
		A[] as=new A[1];
		List<A> aList=new ArrayList<A>();
		
		a.x=1;
		a.y=2;
		
		aList.add(a);
		as[0]=a;
		
		a.x=10;
		
		//System.out.println(as[0].x);
		
		for(A a2:aList){
			a2.x=100;
			System.out.println(a.x);
		}
	}
	
	
}
