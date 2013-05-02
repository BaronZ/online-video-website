package test;

import java.util.HashSet;
import java.util.Set;

public class SmaeTag {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String str="aaaaa,bbb,ccc,aa,cc";
		String[] strs=str.split(",");
		System.out.println(hasSameType(strs));

	}

	
	private static boolean hasSameType(String[] tags){
		Set<String> set=new HashSet<String>();
		for(String s:tags){
			set.add(s);
		}
		if(set.size()==tags.length)
			return false;
		return true;
	}
	
}
