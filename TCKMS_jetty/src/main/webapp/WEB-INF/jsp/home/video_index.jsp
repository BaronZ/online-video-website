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
		<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
		<script type="text/javascript" src="js/jquery.ellipsis.js"></script>
	</head>
	<body>
		<div class="w1000 m0a">
        	<jsp:include page="header.jsp" flush="true" />
        	<jsp:include page="menu.jsp" flush="true" />
    		<jsp:include page="sidebar1.jsp" flush="true" />
        	<!--<jsp:include page="content.jsp" flush="true" />-->
            <jsp:include page="video_list.jsp" flush="true" />
            <jsp:include page="pagination.jsp" flush="true" />
         
        	<jsp:include page="footer.jsp" flush="true" />    
		</div>
	</body>
</html>
