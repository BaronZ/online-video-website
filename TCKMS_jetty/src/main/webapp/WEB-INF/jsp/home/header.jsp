<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/header.css" rel="stylesheet" type="text/css" />
<div class="header">
	<!--用户还没登录时显示-->
	<s:if test="#session.user==null">
    	<h2 class="fr mr10">
    		<a href="${pageContext.request.contextPath }/login.jsp">
        		登录
        	</a>
        </h2>
	</s:if>
    <!---->
    <!--用户已经登录时显示-->
    <s:else>
        <!--用户名-->
        <h2 class="fr mr10">
        	<a href="personal.action"><s:property value="#session.user.nickname"/></a>
            <span></span>
        </h2>
        <!---->    
    	<h2 class="fr mr10 cb">
    		<a href="upload_toVideoAction.action">
        		视频上传  
        	</a>
        </h2>

        <h2 class="fr cb mr10">
        	<a href="l_logout.action">
        		退出
        	</a>
        </h2>
	</s:else>
    <!---->
    	<!--搜索栏表单-->
    	<form id="searchBox" action="Home_VideoListSearch.action" method="get" name="form"> 
			<input id="search_text" name="key" type="text" value="${requestScope.key}" onfocus="if(value=='请输入关键字'){value=''}"
             onblur="if(value==''){value='请输入关键字'}" />
            <input id="searchButton" type="submit" value="搜索" />
		</form>         
        <!----> 	
</div>

<script type="text/javascript">
$(document).ready(function(){
  //alert($("#search_text").html());
  $("#search_text").attr("value","请输入关键字")
});
</script>

