<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="css/personal_main.css" rel="stylesheet" type="text/css" />
<link href="css/content.css" rel="stylesheet" type="text/css" />
<div id="main" class="fl w800 h600">
	<!--<div id="main_top" class="w700 ml10">
    	<h2>我收藏的</h2>
    </div>
             
    <jsp:include page="personInfoSet.jsp" flush="true" />-->
    
    <jsp:include page="myCollection.jsp" flush="true" />
</div>