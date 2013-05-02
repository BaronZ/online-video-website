package test;

import java.util.HashSet;
import java.util.Set;

import com.and9.tckms.entity.Authority;




public class SetTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Set<Authority> aset=new HashSet<Authority>();
		
		Authority a=new Authority();
		a.setAuthority_id(1);
		Authority b=new Authority();
		b.setAuthority_id(2);
		aset.add(a);
		aset.add(b);
		
		System.out.println(aset.size());
	}

}
