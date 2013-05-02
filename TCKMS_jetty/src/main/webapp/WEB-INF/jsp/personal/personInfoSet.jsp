<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="css/personInfoSet.css" rel="stylesheet" type="text/css" />

<form class="fl" id="personInfoSet" action="">
	<label>用户名：</label><span>04090710</span><br />
    <label>昵称：</label><input type="text" value="爱看视频的女孩"/><br />
    <label>性别：</label>
    
    <input type="radio"  name="userSex"/>男<input type="radio" name="userSex" />女<br />
    <label>生日：</label>
    <select name="userBirthdayYear">
    	<option>1990</option>
        <option>1991</option>
        <option>1989</option>
    </select>
    <select name="userBirthdayMonth">
    	<option>01</option>
        <option>02</option>
        <option>03</option>
    </select>
    <select name="userBirthdayDay">
    	<option>20</option>
        <option>21</option>
        <option>22</option>
    </select><br />
    <label>个人简介：</label><textarea class="mt10"></textarea><br />
    <input class="fr mr50 mt10" type="submit" value="保存" />
        
</form>