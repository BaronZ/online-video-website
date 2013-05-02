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
<link href="css/base.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<title>公告页面</title>
<style type="text/css">
#anno_table th,#anno_table td {
	border:1px #CCC solid;
	text-align:center;
	height:40px;
}
#anno_table caption{
	font-size:24px;
	padding-bottom:12px;
}
#anno_table th{
	font-weight:600;
}
</style>
</head>

<body>
<div class="w1000 pt20 m0a">
	<a href="Home_Init.action">首页</a>
    <table class="w1000 m0a" id="anno_table">
    	<caption class="tc">公告栏</caption>
        <thead>
        	<tr><th width="60%">主题</th><th width="20%">作者</th><th>发表时间</th></tr>
        </thead>
        <tbody>
        	<s:iterator value="#request.newsList"  var="news" >
        	<tr>
            	<td><a href="news_detail.action?news_id=${news.news_id}"><s:property value="#news.news_title"/></a></td>
            	<td><a href="#"><s:property value="#news.nickname"/></a></td>
            	<td><s:property value="%{getText('{0,date,yyyy-MM-dd }',{#news.news_date})}"/></td>
            </tr>
            </s:iterator>
        </tbody>
    </table>
</div>
<script type="text/javascript">
$("td").mouseover(
	function(){	
		$(this).css("background","#CCC");	
	}
);
$("td").mouseleave(
	function(){	
		$(this).css("background","#fff");	
	}
);
</script>
</body>
</html>