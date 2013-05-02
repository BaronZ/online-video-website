package test;

import java.util.List;

import com.and9.tckms.dao.RoleDao;
import com.and9.tckms.entity.Role;
import com.and9.tckms.factory.RoleDaoFactory;

public class RoleTest {
	
	public static void main(String[] args){
		RoleDao roleDao=RoleDaoFactory.getInstance().getRoleDao();
		
		List<Role> roles=roleDao.getRolesByUserId(1); 
		System.out.println(roles.get(0).getRole_name());
	}
}
