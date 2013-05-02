<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	UUID uuid=UUID.randomUUID();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <s:fielderror />
    <base href="<%=basePath%>">
    
   <title>视频上传</title>

<!--装载文件-->
<link href="css/uploadify.css" rel="stylesheet" type="text/css" />
<link href="css/base.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/swfobject.js"></script>
<script type="text/javascript" src="js/jquery.uploadify.v2.1.4.min.js"></script>
<!--ready事件-->

<script type="text/javascript">
	$(document).ready(function() {
		$("#uploadify").uploadify({
			'uploader' : '<%=path%>/js/uploadify.swf?ver=<%=uuid%>',
			'method':'get',
			'script' : '<%=path%>/upload_upLoadVideoAction.action;jsessionid=<%=session.getId()%>',//后台处理的请求
			'scriptData':{'uuid':'<%=uuid%>'},
			'cancelImg' : '<%=path%>/images/upload/cancel.png',
			'folder' : 'uploads',//您想将文件保存到的路径
			'fileDataName'   : 'doc', 
			'queueID' : 'fileQueue',//与下面的id对应
			'sizeLimit': 1024 * 1024 * 500, //500M
			'fileDesc' : 'flv文件或mp4文件',
			'displayData' : 'percentage',
			'fileExt' : '*.flv;*.mp4', //控制可上传文件的扩展名，启用本项时需同时声明fileDesc
			'auto' : true,
			'multi' : false,
			'queueSizeLimit':1,
			'simUploadLimit' : 1,
			'buttonText' : 'open file',
			'onCheck'        :  function(event,checkScript,fileQueue,folder,single){  
         		var aa =checkScript;  
            	alert(checkScript);  
            	return false;  
         },
         'onProgress':function(event,queueId,fileObj,data){
        	 document.getElementById("biaodan").style.display='block';
        	 document.getElementById("cancellink").style.display='block';
        	 document.getElementById("msg").innerHTML="速度："+changeTwoDecimal(data.speed/1024)+"MB/s";
         },
		 'onComplete' :function (event, queueID, fileObj, response, data){
			 //alert('<%=uuid %>'+fileObj.type);
			 document.getElementById("video_size").value=fileObj.size;
			 document.getElementById("video_name").value='<%=uuid %>'+fileObj.type;
			 //document.getElementById("video_name").value='<%=uuid %>'+fileObj.type;

		},
		'onAllComplete' :function (event,data){
			document.getElementById("openfile").style.display='none';
			//document.getElementById("uplink").style.display='none';
			document.getElementById("cancellink").style.display='none';
			document.getElementById("msg").innerHTML="上传完成。";
			document.getElementById("fileQueue").style.display='none';
			document.getElementById("up_btn").style.display='block';
		}
		});
	});
	
	
	  //保留后两位小数 
     function changeTwoDecimal(x)
	{
		var f_x = parseFloat(x);
		if (isNaN(f_x))
		{
			alert('function:changeTwoDecimal->parameter error');
			return false;
		}
		var f_x = Math.round(x*100)/100;
		var s_x = f_x.toString();
		var pos_decimal = s_x.indexOf('.');
		if (pos_decimal < 0)
		{
			pos_decimal = s_x.length;
			s_x += '.';
		}
		while (s_x.length <= pos_decimal + 2)
		{
			s_x += '0';
		}
		return s_x;
	}
	
	
	  
     function checkTag(){
 		var selectorInput="#video_tags";
 		var selectorErrorOut="#video_tags_error";
 		var errorText='';
 		var text=$.trim($(selectorInput).val());
 		if(text=='')return true;
 		text=text.replace(/，/ig,',');
 		var Tags=text.split(',');
 		if(Tags.length>5){
 			errorText='标签个数不能大于5';			
 		}else if(!checkTagLength(Tags)){
 			errorText='每个标签长度最长为10';
 		}
 		$(selectorErrorOut).html(errorText);
 		$(selectorInput).val(Tags.join(','));
 		return errorText==''?true:false;

 	}
 	function checkTagLength(Tags){
 		for(var i=0;i<Tags.length;i++){
 			Tags[i]=$.trim(Tags[i]);
 			if(Tags[i].length>10)return false;
 		}
 		return true;
 	}
 	
 	function checkTitle(){
 		
 		var selectorInput="#video_title";
 		var selectorErrorOut="#video_title_error";
 		var errorText='';
 		var text=$.trim($(selectorInput).val());
 		
 		if(text!=null&&text.length>=5&&text.length<=50)return true;
 		
 		if(text==null||text==''){
 			errorText='标题不能为空';
 		}
 		else if(text.length<5||text.length>50){
 			errorText='标题长度为5-50';
 		}
 		$(selectorErrorOut).html(errorText);
 		
 		return errorText==''?true:false;
 	}
 	
 	function checkInfo(){
 		
 		var selectorInput="#video_info";
 		var selectorErrorOut="#video_info_error";
 		var errorText='';
 		var text=$.trim($(selectorInput).val());
 		
 		
 		if(text!=null&&text.length>500){
 			errorText='视频信息最大长度为500';
 		}
 		
 		$(selectorErrorOut).html(errorText);
 		
 		return errorText==''?true:false;
 	}
 	
 	function check(){
 		
 		if(checkTag()&&
 		checkTitle()&&
 		checkInfo())
 		return true;
 		else
 		return false;
 	}
	
 	function clearError(error_text){
		$(error_text).html('');
	}
 	
</script>


<style>
#slabel,#slabel2{
	font-size:12px; color:#999; display:block; margin-left:100px;
}

#video_info{
	resize:none;
}
.submitButton{
	background:url("images/button/ok.gif") no-repeat 8px center;
	background-color:#f9f9f9;
	outline:none;	
}
.resetButton{
	background:url("images/button/reset.gif") no-repeat 8px center;
	background-color:#f9f9f9;
	outline:none;
}
.pbtn1
{	
	border:solid 2px #dcdcdc;
	padding:4px 14px 4px 34px;
	color:#959595;
}
</style>
</head>

<body class="w1000 m0a">

	<div class="w700 m0a">

    	<div id="uploadTop">
			<div id="fileQueue"></div>
			<div id="msg" style="display: block;"><h2>目前仅支持flv/mp4这两种格式，视频大小必须在500M以下。</h2></div>
    		<div id="openfile"><input type="file" name="uploadify" id="uploadify"  /></div>
  			<div id="cancellink" style="display:none;"><a href="javascript:jQuery('#uploadify').uploadifyClearQueue()">取消上传</a></div>
   		</div>
       
        <!--表单-->
         <div id="biaodan" style="display: none">
        <s:form cssClass="mt30" action="upload_toSaveVideoAction" method="post" theme="simple" onsubmit="return check()">
        	<input type="hidden" value="<%=uuid %>" name="uuid"/>
            <s:hidden name="video.video_name" value="null" id="video_name"/>
            <s:hidden name="video.video_size" value="10" id="video_size"/>
            <div class="mt20">
            	<div class="fl w100">标题*：</div>
            	<div>
            		<s:textfield name="video.video_title" id="video_title" size="30" maxlength="50" onblur="clearError('#video_title_error')"/>
            		<span id="video_title_error"></span><br/>
                	<s:label id="slabel" value="请输入您的所上传视频的标题，长度为5—50" />
            	</div>
            </div>
            <div class="mt20">
            	<div class="fl w100">上传者：</div>
            	<div>
                	<s:property value="#session.user.nickname" />
            	</div>
            </div>
            <div class="mt20">
            	<div class="fl  w100">视频简介：</div>
            	<div>
                	<s:textarea cssClass="w500 h100" name="video.video_info" id="video_info" onblur="clearError('#video_info_error')"/>
                	<span id="video_info_error"></span><br/>
                	<s:label id="slabel" value="视频内容最多为500字" />
            	</div>
            </div>
            <div class="mt20">
            	<div class="fl  w100">标签：</div>
            	<div>
                	<s:textfield name="video_tags" id="video_tags" size="30" maxLength="50"  onblur="clearError('#video_tags_error')" />
                	<span id="video_tags_error"></span><br/>
                    <s:label id="slabel2" value="'多个标签用逗号','隔开'" />
            	</div>
            </div>
            <div class="mt20">
            	<div class="fl  w100">视频类型：</div>
            	<div class="w200 fl">
                	<s:doubleselect list="videoSubjectList" listKey="video_subject_id" 
		listValue="video_subject_name"  doubleList="videoTypeMap.get(top.video_subject_id)" doubleListKey="video_type_id" doubleListValue="video_type_name"   doubleName="video.video_type_id" theme="simple"/>
            	</div>
            </div>
            <div class="cl pt50 ml100">
            	<s:submit
				 onmouseover="this.style.borderColor='#75cd02'" onmouseout="this.style.borderColor='#dcdcdc'"
				  cssClass="mr50 submitButton pbtn1" value="提交"/>
            	<s:reset
				 onmouseover="this.style.borderColor='#86c6f7'" onmouseout="this.style.borderColor='#dcdcdc'"
				 cssClass="resetButton pbtn1" value="重置"/>
            </div>

            
        </s:form>
        </div>
    </div>
</body>


</html>