package com.and9.tckms.interceptor;

import java.util.Map;

import com.and9.tckms.entity.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


/**
 * @作用 权限拦截器
 * @author TheRealBo
 * */
public class AuthorityInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		User user = (User)session.get("user");
		if(user != null){
			return invocation.invoke();
		}
		//没有登录，将服务器设置成一个HttpServletRequest属性
		ctx.put("login_tip", "您还未登录，无权限访问指定页面，请先登录");
	
		return Action.LOGIN;
	}

}
