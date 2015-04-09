<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.saturn.sldb.Society" %>
<%-- <%
	String id=request.getParameter("id");
Society society=new Society();
	if(id!=null&&!id.trim().equals("")){
		society=Society.get(id);
	}
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>双辽市临时应急救助申请审批表</title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "宋体";
	font-size: 18px;
}
.STYLE4 {font-family: "宋体"; font-size: 12px; }
-->
body{
	font-size: 12px;
}
</style>
<script> 
var hkey_root,hkey_path,hkey_key 
hkey_root="HKEY_CURRENT_USER" 
hkey_path="file://software//Microsoft//Internet Explorer\\PageSetup\\" 
//设置网页打印的页眉页脚为空 
function pagesetup_null(){ 
try{ 
var RegWsh = new ActiveXObject("WScript.Shell"); 
hkey_key="header";
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,""); 
hkey_key="footer";
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,""); 
}catch(e){} 
} 
//设置网页打印的页眉页脚为默认值 
function pagesetup_default(){ 
try{ 
var RegWsh = new ActiveXObject("WScript.Shell");
hkey_key="header" ;
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"&w&b页码，&p/&P"); 
hkey_key="footer" ;
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"&u&b&d"); 
}catch(e){} 
} 
function setdivhidden(id){//把指定id以外的层统统隐藏 
document.getElementById("div0").style.display="none"; 
}
function setdivvisible(id){//把指定id以外的层统统显示 
document.getElementsByTagName("div0").display="block"; 
} 
function printpr() //预览函数 
{ 
pagesetup_null();//预览之前去掉页眉，页脚 
setdivhidden("div1");//打印之前先隐藏不想打印输出的元素 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>'; 
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);//在body标签内加入html（WebBrowser activeX控件） 
WebBrowser1.ExecWB(7, 1);//打印预览 
WebBrowser1.outerHTML = "";//从代码中清除插入的html代码 
pagesetup_default();//预览结束后页眉页脚恢复默认值 
setdivvisible("div1");//预览结束后显示按钮 
} 
function print() //打印函数 
{ 
pagesetup_null();//打印之前去掉页眉，页脚 
setdivhidden("div1"); //打印之前先隐藏不想打印输出的元素 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>'; 
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);//在body标签内加入html（WebBrowser activeX控件） 
WebBrowser1.ExecWB(6, 1);//打印 
WebBrowser1.outerHTML = "";//从代码中清除插入的html代码 
pagesetup_default();//打印结束后页眉页脚恢复默认值 
setdivvisible("div1");//打印结束后显示按钮 
} 
</script> 
</head>

<body>
<center>
<div id="div0"> 
<input type="button" onclick="printpr();"  value="打印预览"> 
<input type="button" onClick="print();" value="打印"> <p>
</div> 
<div id="div1"> 
<table border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
		  <col width="93" />
		  <col width="72" span="3" />
		  <col width="93" />
		  <col width="72" span="2" />
		  <col width="95" />
		  <tr>
		    <td colspan="9"><div align="center" class="STYLE1"><h3>双辽市城乡居民临时救助申请审批表</h3></div>
		 	<div align="right">编号：${society.numberNO }</div></td>
		  </tr>
		  <tr height="26">
		  	 <td rowspan="6"><div align="center"><span class="STYLE4">户<br>主<br>信<br>息</span></div></td>
		    <td><div align="center" style="width:50px;"><span class="STYLE4">姓名</span></div></td>
		    <td><div align="center"><span class="STYLE4">${society.name }</span></div></td>
		    <td><div align="center"><span class="STYLE4">性别</span></div></td>
		    <td><div align="center"><span class="STYLE4">${society.sex }</span></div></td>
		    <td><div align="center" style="width:70px;"><span class="STYLE4">身份证号码</span></div></td>
		    <td colspan="2"><div align="center"><span class="STYLE4">${society.identify }</span></div></td>
		    <td rowspan="3"><div align="center"><span class="STYLE4"><img src="data:image/jpg;base64,${society.photo }" style="width: 65px; height: 75px" id="picture" name="picture" /></span></div></td>
		  </tr>
		   <tr height="26">
		    <td><div align="center"><span class="STYLE4">婚姻状况</span></div></td>
		    <td><div align="center"><span class="STYLE4">${society.marry }</span></div></td>
		    <td><div align="center"><span class="STYLE4">患病名称</span></div></td>
		    <td><div align="center"><span class="STYLE4">${society.ill }</span></div></td>
		    <td><div align="center"><span class="STYLE4">残疾类别<br>和等级</span></div></td>
		    <td colspan="2"><div align="center"><span class="STYLE4">${society.disability }</span></div></td>
		  </tr>
		  <tr height="26">
		    <td><div align="center"><span class="STYLE4">家庭人口</span></div></td>
		    <td><div align="center"><span class="STYLE4">${society.family }</span></div></td>
		    <td colspan="2"><div align="center"><span class="STYLE4">劳动能力</span></div></td>
		    <td><div align="center"><span class="STYLE4">${society.labor }</span></div></td>
		    <td><div align="center"><span class="STYLE4">家庭类别</span></div></td>
		    <td><div align="center"><span class="STYLE4">${society.familyClass }</span></div></td>
		  </tr>
		  <tr height="26">
		    <td><div align="center"><span class="STYLE4">家庭总收入<br>(元/年)</span></div></td>
		    <td><div align="center"><span class="STYLE4">${society.total }</span></div></td>
		    <td><div align="center"><span class="STYLE4">收入来源</span></div></td>
		    <td colspan="5"><div align="left"><span class="STYLE4">${society.income }</span></div></td>
		  </tr>
		   <tr height="26">
		    <td><div align="center"><span class="STYLE4">家庭总支出<br>(元/年)</span></div></td>
		    <td><div align="center"><span class="STYLE4">${society.spending }</span></div></td>
		    <td><div align="center"><span class="STYLE4">支出用途</span></div></td>
		    <td colspan="5"><div align="left"><span class="STYLE4">${society.purpose }</span></div></td>
		  </tr>
		  <tr height="26">
		    <td><div align="center"><span class="STYLE4">户口类型</span></div></td>
		    <td><div align="center"><span class="STYLE4">${society.accountType }</span></div></td>
		    <td><div align="center"><span class="STYLE4">家庭住址</span></div></td>
		    <td colspan="5"><div align="left"><span class="STYLE4">${society.address }</span></div></td>
		  </tr>
		  <tr height="26">
		    <td rowspan=7 ><div align="center"><span class="STYLE4">同<br>住<br>其<br>他<br>成<br>员<br>情<br>况</span></div></td>
		    <td ><div align="center"><span class="STYLE4">姓名</span></div></td>
		    <td ><div align="center"><span class="STYLE4">性别</span></div></td>
		    <td ><div align="center"><span class="STYLE4">身份证号</span></div></td>
		 	<td ><div align="center"><span class="STYLE4">与户主关系</span></div></td>
		    <td ><div align="center"><span class="STYLE4">婚姻状况</span></div></td>
		    <td ><div align="center"><span class="STYLE4">患病名称</span></div></td>
		    <td ><div align="center" style="width:50px"><span class="STYLE4">残疾类别和等级</span></div></td>
		    <td ><div align="center" style="width:80px"><span class="STYLE4">劳动能力</span></div></td>
		  </tr>
		  <tr height="26">
		    <td ><div align="center"><span class="STYLE4">${subs[0].name }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[0].sex }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[0].identify }</span></div></td>
		 	<td ><div align="center"><span class="STYLE4">${subs[0].relation }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[0].marry }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[0].ill }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[0].disability }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[0].labor }</span></div></td>
		  </tr>
		   <tr height="26">
		    <td ><div align="center"><span class="STYLE4">${subs[1].name }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[1].sex }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[1].identify }</span></div></td>
		 	<td ><div align="center"><span class="STYLE4">${subs[1].relation }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[1].marry }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[1].ill }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[1].disability }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[1].labor }</span></div></td>
		  </tr>
		   <tr height="26">
		     <td ><div align="center"><span class="STYLE4">${subs[2].name }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[2].sex }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[2].identify }</span></div></td>
		 	<td ><div align="center"><span class="STYLE4">${subs[2].relation }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[2].marry }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[2].ill }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[2].disability }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[2].labor }</span></div></td>
		  </tr>
		   <tr height="26">
		    <td ><div align="center"><span class="STYLE4">${subs[3].name }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[3].sex }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[3].identify }</span></div></td>
		 	<td ><div align="center"><span class="STYLE4">${subs[3].relation }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[3].marry }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[3].ill }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[3].disability }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[3].labor }</span></div></td>
		  </tr>
		   <tr height="26">
		    <td ><div align="center"><span class="STYLE4">${subs[4].name }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[4].sex }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[4].identify }</span></div></td>
		 	<td ><div align="center"><span class="STYLE4">${subs[4].relation }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[4].marry }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[4].ill }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[4].disability }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[4].labor }</span></div></td>
		  </tr>
		   <tr height="26">
		    <td ><div align="center"><span class="STYLE4">${subs[5].name }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[5].sex }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[5].identify }</span></div></td>
		 	<td ><div align="center"><span class="STYLE4">${subs[5].relation }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[5].marry }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[5].ill }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[5].disability }</span></div></td>
		    <td ><div align="center"><span class="STYLE4">${subs[5].labor }</span></div></td>
		  </tr>
		  <tr>
		    <td><div align="center"><span class="STYLE4">申请<br>承诺</span></div></td>
		  	<td colspan="9" height="90"><div align="left"><span class="STYLE4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本人因家庭生活困难，特申请临时救助。本人承诺在本表中所填列的全部内容及所提供的全部证明材料均真实、可靠、绝无虚假、欺骗和隐瞒。如经管理审批机关及其办事机构核查存在不实之外，愿承担一切后果并接受一切处罚。</span></div><br>
		  	<div style="margin-left:250px;">申请人（签字并按手印）： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;年  &nbsp;&nbsp;  &nbsp;&nbsp;月   &nbsp;&nbsp;&nbsp;&nbsp; 日</div></td>
		  </tr>
		 <tr>
		    <td><div align="center"><span class="STYLE4">申请<br>理由</span></div></td>
		  	<td colspan="9" height="130"><div align="center"><span class="STYLE4">${society.cause }　</span></div></td>
		  </tr>
		  <tr>
	    	<td rowspan=2><div align="center"><span class="STYLE4">审查<br>审批<br>意见</span></div></td>
		    <td colspan="3" height="235"><div align="center"><span class="STYLE4">乡镇（街）初审意见</span></div><br/><br/>
			   	 <div style="margin-left:20px;">
				   	 调查人：<br/><br/>
				               助理：<br/><br/>
				              主管领导：<br/><br/>
			    </div>
		  	<div style="margin-left:80px;">年 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;日</div>
		  	</td>
		  	<td colspan="3" height="235"><div align="center"><span class="STYLE4">社救中心复查及审批意见：</span></div><br/><br/>
			   	 <div style="margin-left:30px;">
				   	 复查人：<br/><br/><br/><br/>
				              审批人：<br/><br/>
			    </div>
		  	<div style="margin-left:80px;">年 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;日</div>
		  	</td>
		  	
		  	<td colspan="3" height="235"><div align="center"><span class="STYLE4">民政局主管领导审批意见：</span></div><br/><br/>
			   <br/><br/><br/><br/><br/><br/>
		  	<div style="margin-left:60px;">年 &nbsp;&nbsp;&nbsp;&nbsp;月 &nbsp;&nbsp;&nbsp;&nbsp;日</div>
		  	</td>
		  	
		 </tr>
	 	<tr height="40">
	 		<td colspan=8><div align="left"><span class="STYLE4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;救助金额:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${society. money}</span></div></td>
	 	</tr>
  </table>
</div>
</center>
</body>
</html>
