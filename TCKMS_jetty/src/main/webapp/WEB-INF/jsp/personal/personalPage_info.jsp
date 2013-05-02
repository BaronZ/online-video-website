<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>视频教学网</title>
        <link href="css/base.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="w1000 m0a">
        	<jsp:include page="../home/header.jsp" flush="true" />
        	<jsp:include page="../home/menu.jsp" flush="true" />    
            <jsp:include page="myNav.jsp" flush="true" />
            <jsp:include page="personInfo.jsp" flush="true" />
            <jsp:include page="../home/footer.jsp" flush="true" />        	    
		</div>
	</body>
</html>
