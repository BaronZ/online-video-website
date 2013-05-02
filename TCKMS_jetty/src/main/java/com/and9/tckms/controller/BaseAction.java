package com.and9.tckms.controller;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements SessionAware,RequestAware,
		ApplicationAware,ServletContextAware{

	protected Map<String, Object> Session;
	protected Map<String, Object> Request;
	protected Map<String, Object> Application;
	protected ServletContext context;


	public Map<String, Object> getApplication() {
		return Application;
	}

	public Map<String, Object> getRequest() {
		return Request;
	}

	public Map<String, Object> getSession() {
		return Session;
	}

	public void setApplication(Map<String, Object> Application) {
		// TODO Auto-generated method stub
		this.Application=Application;
	}

	public void setRequest(Map<String, Object> Request) {
		// TODO Auto-generated method stub
		this.Request=Request;
	}

	public void setSession(Map<String, Object> Session) {
		// TODO Auto-generated method stub
		this.Session=Session;
	}

	public static HttpServletRequest getServletRequest(){
		return ServletActionContext.getRequest();
	}

	public void setServletContext(ServletContext context) {
		// TODO Auto-generated method stub
		this.context=context;
	}

}
