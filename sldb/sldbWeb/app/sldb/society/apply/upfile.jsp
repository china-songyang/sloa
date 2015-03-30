<%@page import="com.saturn.app.utils.DateUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>摄像头拍照</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/easyui-lang-zh_CN.js"></script>
<link href="<%=request.getContextPath()%>/app/js/uploadify/jquery/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/uploadify/jquery/swfobject.js"></script>
<script type="text/javascript" src = "<%=request.getContextPath()%>/app/js/uploadify/jquery/jquery.uploadify.v2.1.0.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	$("#uploadify").uploadify({
		'uploader': 'uploadify.swf',
		//'script':'upload!doUpload.action?name=yangxiang',
		'script': '<%=request.getContextPath()%>/app/system/upload/batchupload.do?dir=image',
		//'script': 'servlet/Upload?name=yangxiang',
		'cancelImg': '<%=request.getContextPath()%>/app/js/uploadify/jquery/cancel.png',                  
		'queueID' : 'fileQueue', //和存放队列的DIV的id一致         
		//'fileDataName': 'fileupload', //必须，和以下input的name属性一致  
		'auto'  : true, //是否自动开始  
		'multi': true, //是否支持多文件上传  
		'buttonText': "upload", //按钮上的文字  
		'simUploadLimit' : 1, //一次同步上传的文件数目  
		'sizeLimit': 500000000, //设置单个文件大小限制，单位为byte 500M
		'queueSizeLimit' : 50, //队列中同时存在的文件个数限制  
		'fileDesc': '支持格式:jpg.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的
		'fileExt': '*.jpg',//允许的格式
		'onComplete': function (event, queueID, fileObj, response, data) {
			//alert(event+"--"+queueID+"--"+fileObj+"--"+response+"--"+data);
			var jsonObj = eval("("+response+")");
			if(jsonObj.error==0) {
				//alert("文件:" + fileObj.name + "上传成功");
				//$.messager.alert("操作提示","文件:" + fileObj.name + "上传成功");
				//$("#imgVeiw").html($("#imgVeiw").html()+"<img width=\"110\" height=\"150\" id=\"" + fileObj.name + "\" src=\"" + jsonObj.url + "\" alt=\"" + fileObj.name + "\" />");
				//$("#bacthtitle").val($("#bacthtitle").val()+fileObj.name + ";");
				$("#files").val($("#files").val()+jsonObj.url + ";");
				$("#fileNameQueue").html($("#fileNameQueue").html()+"<br/>"+fileObj.name);
			}else{
				//alert("文件:" + fileObj.name + "上传失败!\n原因:" + jsonObj.message);
				$.messager.alert("操作提示","文件:" + fileObj.name + "上传失败!\n原因:" + jsonObj.message,"info");
			}
		},
		'onError': function(event, queueID, fileObj) {  
			//alert("文件:" + fileObj.name + "上传失败"); 
			$.messager.alert("操作提示","文件:" + fileObj.name + "上传失败","info");
		},
		'onCancel': function(event, queueID, fileObj){
			/* alert("取消了" + fileObj.name);  */ 
		}
	});
});
</script>
</head>
<body>
<a href="javascript:start()">启动摄像头</a>&nbsp;&nbsp;<a href="javascript:save()">拍照</a>&nbsp;&nbsp;<a href="javascript:history.back(-1)">返回</a><br>
<div>
	<OBJECT id="camera" classid="clsid:792FD9B8-5917-45D2-889D-C49FD174D4E0" 
	codebase="capProj1.ocx#version=1,0,0,0"
  	width="400"
  	height="300"
  	align=""
  	hspace="0"
  	vspace="0"
	>
	</OBJECT>

	<script language="javascript" type="text/javascript">
	var camera=document.getElementById("camera");
	function start(){
		camera.start(700,600);
	}
	function save(){
		var myDate = new Date();    
		var mytime=myDate.getTime();     
		var user = "${temp.name}";
		camera.savefile("C:\\"+user+"_"+mytime+".jpg",700,600);
		alert("拍照成功,照片已保存在C盘根目录！");
		//document.all['pic'].src = "c:\\wu.jpg";
		//getPicBase64("C:\\wu.jpg");
	}
	
	function getPicBase64(photo){
		$.post("<%=request.getContextPath()%>/app/sldb/temp/picbase64.do", 
				{photo:photo}, 
				function(json) {
					document.all['pic'].src = "data:image/jpg;base64,"+json;
					//$("#pic").attr("src","data:image/jpg;base64,"+json);
					$("#files").val(json);
					//$("#aa").html($("#pic").attr("src"));
				},
		"txt");
	}

	</script>
	</div>
	<hr/>
	<div>
		<input type="file" name="uploadify" id="uploadify" />
		<!-- 
		<p>
			<a href="javascript:jQuery('#uploadify').uploadifyUpload()">开始上传</a>&nbsp;
			<a href="javascript:jQuery('#uploadify').uploadifyClearQueue()">取消上传</a>
		</p>
		 -->
		<div id="fileNameQueue" style="color: #15428B;"></div>
		<div id="fileQueue"></div>
	</div>
	<!-- <form action="<%=request.getContextPath()%>/app/photo/addpicbase64.do" method="post">  -->
	<form action="<%=request.getContextPath()%>/app/sldb/society/updatefiles.action" method="post">
		<input type="hidden" name="id" id="id" value="${temp.id }" />
		<br/>
		<input type="text" name="files" id="files" value="${temp.files }">
		<br/>
		<input type="submit" value="提交" />
	</form>
</body>
</html>