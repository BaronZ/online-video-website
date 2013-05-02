<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style>
#myCollection img {
	width: 120px;
	height: 120px;
	border: 1px rgb(221, 221, 221) solid;
}

#myCollection em {
	margin-left: 20px;
	color: #666;
}

#myCollection {
	margin-top: 20px;
	margin-left: 10px;
	text-indent: 30px;
	line-height: 30px;
	min-height: 70px;
	border-bottom: 1px dashed #999;
	overflow: hidden;
}

#myCollection_h2 {
	margin-bottom: 30px;
	border: #CCC 1px solid;
	background: #CCC;
}
</style>
<div class="h1000">
	<div id="myCollection_h2" class="w900">
		<h2 class="t2">我收藏的</h2>
	</div>
 <div id="myCollection" class="w700">

		<div id="myCollection_item" class="w700">
			
		</div>
	</div>
</div>



