package com.and9.tckms.controller;

import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.and9.tckms.entity.User;
import com.and9.tckms.service.UserService;
import com.and9.tckms.service.VideoService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author TheRealBo,MC
 *
 */
public class LogAction extends BaseAction{

	private User user;
	private String login_tip;
	private String nextAction; //
	
	public LogAction(){
		System.out.println("调用logAction");
	}
	public String execute(){
		System.out.println("execute()");
		return SUCCESS;
	}
	
	/**@作用 用户登录
	 * @author TheRealBo,MC
	 * */
	public String login() {
		
		System.out.println("调用loginAction，进行登录");
		UserService userService =new UserService();
		User user = userService.login(getUser().getUsername()
				,getUser().getPassword());//传入工号与密码，进行登录验证
		if(user==null){
			Request.put("login_tip","用户名或密码错误！");
			return INPUT;
		}
		Session.put("user", user);
		if(getNextAction()==null||getNextAction().length()==0){
			setNextAction("Home_Init.action");
		}
		
		//设置重新登录后跳转的页面
		setNextAction(getNextAction().replace(".action", ""));
		System.out.println("next="+getNextAction());
		return SUCCESS;
		
	}
	
	/**@作用 退出登录
	 * @author TheRealBo
	 * */
	public String logout(){
		Session.clear();//TODO
		setNextAction("Home_Init.action");
		return SUCCESS;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getLogin_tip() {
		return login_tip;
	}
	public void setLogin_tip(String loginTip) {
		login_tip = loginTip;
	}
	public String getNextAction() {
		return nextAction;
	}
	public void setNextAction(String nextAction) {
		this.nextAction = nextAction;
	}
	
	public void validate(){//校验失败会转发到"input"视图
		System.out.println("validate");
	}

}
