package test;

import com.and9.tckms.entity.Authority;
import com.and9.tckms.entity.User;
import com.and9.tckms.service.UserService;

public class UserTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		UserService userService=new UserService();
		User user=userService.login("11111111", "000000");
		
		for(Authority authority:user.getAuthorities()){
			System.out.println(authority.getAuthority_name());
		}
		
	}

}
