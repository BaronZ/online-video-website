package com.and9.tckms.interceptor;

import com.and9.tckms.entity.Authority;
import com.and9.tckms.entity.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class VideoUploadInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		
		
		User user=(User)invocation.getInvocationContext().getSession().get("user");
		if(user!=null){
			
			
				if(user.getAuthority_nameSet().contains("add_video"))
					return invocation.invoke();
			
		}
		return "noAuthority";
	}

}
