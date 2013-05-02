package test;

import java.util.List;

import com.and9.tckms.dao.AuthorityDao;
import com.and9.tckms.entity.Authority;
import com.and9.tckms.factory.AuthorityDaoFactory;

public class AuthorityTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AuthorityDao authorityDao=AuthorityDaoFactory.getInstance().getAuthorityDao();
		
		List<Authority> authorities=authorityDao.getAuthoritiesByRoleId(1);
		System.out.println(authorities.size());
	}

}
