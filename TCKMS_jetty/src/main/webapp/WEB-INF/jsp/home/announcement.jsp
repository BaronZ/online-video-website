<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="css/announcement.css" rel="stylesheet" type="text/css" />
<div class="fl w700" id="announcement">
	<dl>
    	<a  href="#" class="fr mt20">更多&gt;&gt;</a>
    	<dt id="announcement_title">最新公告</dt>
		<%  for(int i=0;i<7;i++) {  %>
        <dd><a href="#searchBox">关于近期，项目驱动教学平台的进度！！！！</a></dd>
        <% } %>
        
    </dl>
</div>