<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="s" uri="/struts-tags"  %>
<html>
	<head>
		<title>登录界面</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/login.css" type="text/css">


    <script type="text/javascript" src="${pageContext.request.contextPath }/js/login.js"></script>
    <link href="button.css" rel="stylesheet" type="text/css">
    <link href="mybutton.css" rel="stylesheet" type="text/css">
    <link href="divtips.css" rel="stylesheet" type="text/css">
    <link href="div_tip.css" rel="stylesheet" type="text/css">
</head>
<body>
 	<table width="900" border="0" align="center">
  	<tr>
    	<th width="376" height="75" scope="col"><img src="${pageContext.request.contextPath }/images/login/logo_school.png" width="335" height="60" alt="吉林大学珠海学院"></th>
<th width="396" align="left" valign="middle" class="top_title" scope="col">项目驱动教学平台</th>
        <th width="107" align="right" valign="top"><span class="brand_top">And_9开发工作室</span></th>
  </tr>
</table>
    
<table width="900" border="0">
  <tr>
    <td height="29">&nbsp;</td>
  </tr>
</table>
    <!-- 用户未登录 -->
    <form action="l_login.action"" method="post" onSubmit="return login_check()">
    <input type="hidden" name="nextAction" value="${nextAction}"/>
		<table width="900" border="0" align="center">
		  <tr>
		    <th width="613" bgcolor="#CCCCCC" scope="col"><img src="${pageContext.request.contextPath }/images/login/20100315040007001.jpg" width="623" height="253" ></th>
		    <th width="277" bgcolor="#CCCCCC" scope="col"><table width="280" height="213" border="0">
  <tr>
    <th width="265" height="45" align="left" scope="col"><span class="login_CN">用户登录</span><span class="login_US">/Login</span></th>
  </tr>
  <tr>
    <td height="23" class="error">${requestScope.login_tip}</td>
  </tr>
  <tr>
    <td height="52"><table width="300" border="0">
  <tr>
    <td width="85" height="26" align="right" class="user">用户名：</td>
    <td width="212" align="left" valign="middle"><input type="text" class="username" name="user.username" id="username" style="width:150px" onBlur="login_states('username')" /></td>
  </tr>
  <tr><td width="80" height="27"></td><td width="208"><div id="usernull" style="display:none; font-size: 10px; font-family: '微软雅黑'; color: #F00;">用户名不能为空！</div><div id="isNum" style="display:none; font-size: 10px; font-family: '微软雅黑'; color: #F00;">用户名只能由数字组成！</div></td></tr>
</table>
 </td>
  </tr>
  
  <tr>
    <td height="45"><table width="300" border="0">
  <tr>
    <td width="85" height="26" align="right" valign="middle" class="user">密&nbsp;&nbsp;码：</td>
    <td width="221"><input type="password" class="password" name="user.password" id="password"  style="width:150px " onBlur="login_states('password')"/></td>
  </tr>
  <tr><td width="80" height="18"></td><td width="208"><div id="pswnull" style="display:none; font-size: 10px; font-family: '微软雅黑'; color: #F00;">密码不能为空！</div></td></tr>
</table>
</td>
  </tr>
  <tr>
    <td height="29" align="right"><table width="300" height="27" border="0" align="right">
  <tr>
    <td width="256" align="right"><span class="mybutton">
      <input type="submit" value="登录" onMouseOver="this.style.borderColor='#75cd02'" 

onmouseout="this.style.borderColor='#dcdcdc'" class="btn1 pbtn1"/>
      &nbsp;<input type="reset" value="重置" onMouseOver="this.style.borderColor='#86c6f7'" 

onmouseout="this.style.borderColor='#dcdcdc'" class="btn3 pbtn1" />
    </span></td>
    <td width="34" height="23">&nbsp;</td>
  </tr>
</table>
</td>
  </tr>
</table>
</th>
	      </tr>
    </table><table width="900" border="0" align="center">
  <tr>
    <td align="center" valign="middle" class="banquan" >©2011-2015 And_9开发工作室 版权所有</td>
  </tr>
</table>
  </form>
    </body>
    </html>