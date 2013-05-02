<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.zxx_text_overflow_1{width:27em;}
.zxx_text_overflow_2{width:400px;}
</style>
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="js/jquery.ellipsis.js"></script>
<script type="text/javascript">
function RegSearch(value,repValue){
     var RegStr,RegSpace,igStr;
     var igKey = true;//大小写
     if(igKey){
         RegStr = /<[^>]+>/gi;
         RegSpace = /&nbsp;|&quot;|&amp;|&lt;|&gt;|&copy;|&ldquo;|&rdquo;/gi;
         igStr = "gi";
     }else{
         RegStr = /<[^>]+>/g;
         RegSpace = /&nbsp;|&quot;|&amp;|&lt;|&gt;|&copy;|&ldquo;|&rdquo;/g;
         igStr = "g";
     }
     var Reg = new RegExp(repValue,igStr);
     var RegBox = new Array();
     var S = repValue.split(",");
     var SBox = new Array();
     for(var i=0;i<S.length-1;i++){
         for(var j=i+1;j<S.length;j++){
             if(S[j]!=S[i]){
                 SBox.push(S[i]);
             }
             if(i==S.length-2)
             {
                 SBox.push(S[i+1]);
             }
         }
     }
     for(var i=0;i<SBox.length;i++){
         RegBox.push(new RegExp(SBox[i],igStr));
     }    
    var outPut="";
     var arr = value.split(RegStr);
     var matchs = value.match(RegStr);
     for(var i=0;i<arr.length;i++)
     {
         var m = "";
         try{
             if(typeof matchs[i] != "undefined")
             {
                 m = matchs[i];
             }
         }catch(e){}
         var space = arr[i].split(RegSpace);
         var spaceMatchs = arr[i].match(RegSpace);
         for(var j=0;j<space.length;j++)
         {
             var m2 = "";
             try{
                 if(typeof spaceMatchs[j] != "undefined")
                 {
                     m2 = spaceMatchs[j];
                 }
             }catch(e){}
             if(RegBox.length!=0){
                 for(var k=0;k<RegBox.length;k++){
                     if(SBox[k]!=""){
                         space[j] = space[j].replace(RegBox[k],"<font color='#ff0000'>" + SBox[k] + "</font>");
                     }
                 }
             }else{
                 space[j] = space[j].replace(Reg,"<font color='#ff0000'>" + repValue + "</font>");
             }
             outPut += space[j] + m2;
         }
         outPut += m;
     }
     return outPut;
 }
var a="ssssssssssdasfsdfsdfsdf";
var b="sSd";
a=RegSearch(a,b);
alert(a);
</script>
  </head>
  
  <body>
   <div class="zxx_text_overflow_3">这是一段测试文字，主要是用来测试文字溢出后是否会用省略号显示。</div>
  </body>
</html>
