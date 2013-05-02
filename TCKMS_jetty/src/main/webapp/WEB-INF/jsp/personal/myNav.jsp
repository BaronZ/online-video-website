<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 获取“收藏视频列表”js代码 -->
<script type='text/javascript' src="${pageContext.request.contextPath }/js/showUserFavs.js"></script>
<script type="text/javascript" src="js/jquery-1.7.2.minjs"></script>

<style type="text/css">
#myNav {
	background-color:#F9F9F9;
}
#myNav li{
	text-indent:40px;
	line-height:50px;
}
</style>
<div id="myNav" class="fl w200 h1000">
	<ul>
        <li><a href="javascript:void(0)" id='getFavs' onclick="getPersonalInfo(this);changeNav1();ale()" >我收藏的</a></li>
        <li><a href="javascript:void(0)" id='getFavs' onclick="getPersonalInfo(this);changeNav2();ale()">我上传的</a></li>
        <!-- <li><a href="personal_set.action">个人设置</a></li>
        <li><a href="personal_info.action">我的信息</a></li> -->
    </ul>
</div>
 <input type="hidden" id="uid" value="${user.user_id }"/>


 

