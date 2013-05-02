<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
<link href="css/menu.css" rel="stylesheet" type="text/css" />

<div id="nav">
<div class="l"></div>
<ul>
	<li><span class="v" onclick="javascript:window.location.href='Home_Init.action'">首页</span>
		<div>欢迎浏览</div>
    </li>
    
<!--    <li><span class="v">移动开发</span>
		<div><a href="#">安卓</a><a href="#">苹果</a></div>
    </li>-->
    
    
    <s:iterator value="#session.navbar" var="navbar">
    	<li>
        	<span class="v"><s:property value="#navbar.video_subject_name"/></span>        
            <div>  
            	<s:if test="#navbar.videoTypes.size==0">
                	暂无该种类
                </s:if>
                <s:else>
                	<s:iterator value="#navbar.videoTypes" var="subbar">
                    <s:url value="Home_VideoList.action" id="s_url">
                    	<s:param name="vtid" ><s:property value="#subbar.video_type_id"/></s:param>
                    </s:url>
                    <s:a 
                     href="%{s_url}" >
                     <!--<img src="images/sub_dot.gif" />-->
                     <s:property value="#subbar.video_type_name"/>
                    </s:a>
                    </s:iterator>
                 </s:else>
             </div>
        </li>
	</s:iterator>
</ul>

<div class="r"></div>
</div>




<script type="text/javascript">
var url=document.URL;
var vtid=<s:property value="#request.vtid_key"/>
////////////////judge函数
function judge(){
	if(url.indexOf("Home_Init.action")>1){
		$("#nav li").children(".v").css("background","url(images/bg.jpg) no-repeat");
		$("#nav ul div").hide();
		$("#nav li").eq(0).children(".v").css("background","url(images/main.jpg)");
		$("#nav li").eq(0).children("div").show();
	}
	else if (url.indexOf("vtid=2")>1||url.indexOf("vtid=10")>1||url.indexOf("vtid=11")>1){
		$("#nav li").children(".v").css("background","url(images/bg.jpg) no-repeat");
		$("#nav ul div").hide();
		$("#nav li").eq(1).children(".v").css("background","url(images/main.jpg)");
		$("#nav li").eq(1).children("div").show();
	}
	else if (vtid==1||vtid>2){
		$("#nav li").children(".v").css("background","url(images/bg.jpg) no-repeat");
		$("#nav ul div").hide();
		$("#nav li").eq(4).children(".v").css("background","url(images/main.jpg)");
		$("#nav li").eq(4).children("div").show();
	}	
	else{
		$("#nav li").children(".v").css("background","url(images/bg.jpg) no-repeat");
		$("#nav ul div").hide();
		$("#nav li").eq(0).children(".v").css("background","url(images/main.jpg)");
		$("#nav li").eq(0).children("div").show();		
	}
}
////////////////judge函数

////////////////judgeType函数
function judgeType(){
if(vtid==1)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(10).css({"background":"url(images/type_bg.jpg)"});
}
else if(vtid==2)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(0).css({"background":"url(images/type_bg.jpg)"});
}
else if(vtid==3)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(9).css({"background":"url(images/type_bg.jpg)"});
}
else if(vtid==4)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(8).css({"background":"url(images/type_bg.jpg)"});
}
else if(vtid==5)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(7).css({"background":"url(images/type_bg.jpg)"});
}
else if(vtid==6)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(6).css({"background":"url(images/type_bg.jpg)"});
}
else if(vtid==7)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(5).css({"background":"url(images/type_bg.jpg)"});
}
else if(vtid==8)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(4).css({"background":"url(images/type_bg.jpg)"});
}
else if(vtid==9)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(3).css({"background":"url(images/type_bg.jpg)"});
}
else if(vtid==10)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(1).css({"background":"url(images/type_bg.jpg)"});
}
else if(vtid==11)
{
	$("#nav li div a").css({"background":"#FFF"});
	$("#nav li div a").eq(2).css({"background":"url(images/type_bg.jpg)"});
}
else
{
		$("#nav li").children(".v").css("background","url(images/bg.jpg) no-repeat");
		$("#nav ul div").hide();
		$("#nav li").eq(0).children(".v").css("background","url(images/main.jpg)");
		$("#nav li").eq(0).children("div").show();		
}
}
////////////////judgeType函数




$(document).ready(function(){
	$("#nav li").eq(4).children("div").css({"margin-left":"-275px","width":"600px"});
	$("#nav li").eq(1).children("div").css({"margin-left":"-45px"});
	judgeType();
	judge();
	
});

$("#nav li").mouseover(
	function(){	
		$("#nav li").children(".v").css({"background":"url(images/bg.jpg) no-repeat"});
		$("#nav li").children("div").hide();
		$(this).children("div").show();
		$(this).children("span").css("background","url(images/main.jpg)");
		
		
	}

);
$("#nav li").mouseleave(
	function(){
		$("#nav li").children("span").css("background","url(images/bg.jpg) repeat-x");
		$(this).children("div").show();
		$(this).children("span").css("background","url(images/main.jpg)");
		judgeType();
		judge();


	}
)



</script>