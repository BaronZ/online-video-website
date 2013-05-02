<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link href="css/pagination.css" rel="stylesheet" type="text/css" />
<div class="pagination cb">
			<ul>
			<s:if test="#request.pagecount>1">
			<!-- 判断当前页是否为第一页 -->
			<s:if test="#request.curpage==1">
			<li class="disablepage">« 首页</li>
			</s:if>
			<s:else>
			<li class="prepage">
			<a href="${requestScope.alink}&page=1">« 首页</a>
			</li>
			</s:else>
			
			<!-- 判断是否为当前页 -->
			<s:iterator value="#request.btmpage"  var="ipage" >
			<s:if test="#ipage==#request.curpage">
			<li class="currentpage"><s:property value="#ipage"/></li>
			</s:if>
			<s:else>
				<li><a href="${requestScope.alink}&page=${ipage}"><s:property value="#ipage"/></a></li>
			</s:else>
			</s:iterator>
			
			<!-- 判断是否为最后一页 -->
			<s:if test="#request.curpage==#request.pagecount">
				<li class="disablepage">尾页 »</li>
			</s:if>
			<s:else>
				<li class="nextpage"><a href="${requestScope.alink}&page=${requestScope.pagecount}">尾页 »</a></li>
			</s:else>
			</s:if>
			</ul>
		</div>