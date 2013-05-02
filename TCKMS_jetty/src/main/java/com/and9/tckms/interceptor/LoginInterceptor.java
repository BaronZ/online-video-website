package com.and9.tckms.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.and9.tckms.controller.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		if(invocation.getInvocationContext().getSession().get("user")==null){ //未登录  
			
            HttpServletRequest request=ServletActionContext.getRequest(); 
            String path = request.getServletPath();
            String queryString = request.getQueryString();
            path = path.substring(1,path.length());
            if(queryString==null){
            	queryString="";
            }else{
            	queryString="?"+queryString;
            }
            ActionContext.getContext().put("nextAction", path+queryString);//+"?"+request.getQueryString());   
            request.setAttribute("login_tip", "请先登录！！！");
            System.out.println("servletPath:"+request.getServletPath());
            System.out.println("getQueryString:"+request.getQueryString());
            return "reLogin";   
        }   
           
        return invocation.invoke();
	} 
	
	
}  
