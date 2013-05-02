<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style type="text/css">
#personInfo_item {
	margin-left:20px;
	margin-right:30px;
	text-align:right;
	width:100px;
	line-height:2.5;
	display:inline-block;
}
</style>

<div class="fl">
  <div id="personInfo_item">
  	用户名：
  </div>
  <span>04090710</span><br />
    <div id="personInfo_item">
  	昵称：
  </div>
  <span>爱看视频的女孩</span><br />
    <div id="personInfo_item">
  	性别：
  </div>
  <span>男</span><br />
    <div id="personInfo_item">
  	生日：
  </div>
  <span>1990-01-10</span><br />
    <div id="personInfo_item">
  	个人简介：
  </div>
  <span>XXXXXXXXXXXXXXXXXXXXX</span><br />
</div>