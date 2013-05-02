<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>具体公告页面</title>
<link href="css/base.css" rel="stylesheet" type="text/css" />
</head>
<style>
#announcement_detail h2{
	height:100px;
	line-height:60px;
	font-size:24px;
}
</style>
<body>
<div class="w1000 m0a">

	<div class="w600 pt10 m0a" id="announcement_detail">
    	<a href="Home_Init.action">首页</a>>
        <a href="news_init.action">返回上一级</a>
    	<h2><s:property value="#request.news.news_title"/> </h2>
        <p>
       <s:property value="#request.news.news_info"/>
        </p>
        <p class="fr cb"><s:property value="#request.news.nickname"/></p>
        <p class="fr cb"><s:property value="%{getText('{0,date,yyyy-MM-dd }',{#request.news.news_date})}" /></p>
    </div>
</div>
</body>
</html>