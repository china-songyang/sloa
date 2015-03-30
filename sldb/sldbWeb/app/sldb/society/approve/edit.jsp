<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.auth.User"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.auth.Organization"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加临时救助信息</title>
<%@ include file="/app/includes/header.jsp"%>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 24px;
	font-weight: bold;
}
-->
input {
		border:none;
	}
	table tr td{border-right:1px solid black;border-bottom:1px solid black;}
</style>
<script type="text/javascript">
function showPhoto(){
	var p = '${society.files}';
	var str= new Array();   
	str=p.split(";"); 
	var files = $("#files").html();
	for (i=0;i<str.length ;i++ )   
	{   
		if(str[i]!=null&&str[i]!="")
		files+="<a href=\""+str[i]+"\" target=\"_blank\"><img src=\""+str[i]+"\" width=100px; height=100px;/></a>&nbsp;";
	}   
	$("#files").html(files);
}
$(function() {
	showPhoto();
	$('#creater').combobox({
		value : '${society.creater }',
		onSelect:function(record){
			$('#creater').val(record.text);
	    }
	});
});

function submit(){ 
	if(form1.money.value==""){ 
	alert("审批金额不能为空！"); 
	}else if($('#creater').combogrid('getValue')==""){ 
	alert("审批人不能为空！"); 
	} else{
		$('#form1').submit();
	}
	}
</script>
</head>
<body>
	<form id="form1" runat="server"  method="post" action="<%=request.getContextPath()%>/app/sldb/society/UpdateSocietyByApprove.action">
		<input type="hidden" id="id" name="id" value="${society.id }" />
		<OBJECT classid="clsid:10946843-7507-44FE-ACE8-2B3483D179B7"
			id="CVR_IDCard" name="CVR_IDCard" width="0" height="0"> </OBJECT>

		<script language="javascript" type="text/javascript">
				function ClearForm() {
					document.getElementById('name').value = "";
                    document.getElementById('sex').value = "";
                    document.getElementById('identify').value =  "";
                    document.getElementById('permanent').value = ""; 
                    document.getElementById('picture').src = "";
                     /*  document.all['name'].value = ""; 
                      document.all['sex'].value = ""; 
                      document.all['race'].value = ""; 
                     // document.all['Born'].value = ""; 
                      document.all['address'].value = ""; 
                      document.all['identify'].value = "";  */
                      /* document.all['IssuedAt'].value = ""; 
                      document.all['EffectedDate'].value = ""; 
                      document.all['ExpiredDate'].value = ""; 
                      document.all['SAMID'].value = ""; 
                      document.all['pic'].src = ""; 
                      document.all['Picture'].value = "";  
                      document.all['PictureLen'].value = "";     */ 
                      return true;
				}
				function Button1_onclick() {
                   	var CVR_IDCard = document.getElementById("CVR_IDCard");					
					var strReadResult = CVR_IDCard.ReadCard();
					if(strReadResult == "0")
					{
						ClearForm();
					    /* document.all['name'].value = CVR_IDCard.Name;  
                        document.all['sex'].value = CVR_IDCard.Sex;    
                        document.all['race'].value = CVR_IDCard.Nation; 
                        //document.all['Born'].value = CVR_IDCard.Born;  //出生日期    
                        document.all['address'].value = CVR_IDCard.Address; 
                        document.all['identify'].value = CVR_IDCard.CardNo;  */
                        document.getElementById('name').value =  CVR_IDCard.Name;
                        document.getElementById('sex').value =  CVR_IDCard.Sex;
                        document.getElementById('identify').value =  CVR_IDCard.CardNo;
                        document.getElementById('permanent').value = CVR_IDCard.Address; 
                        document.getElementById('picture').src = "data:image/jpg;base64,"+CVR_IDCard.Picture;
                        document.getElementById('photo').value = CVR_IDCard.Picture;
                      /*   document.all['IssuedAt'].value = CVR_IDCard.IssuedAt; //签发机关
                        document.all['EffectedDate'].value = CVR_IDCard.EffectedDate;  //有效期限
                        document.all['ExpiredDate'].value = CVR_IDCard.ExpiredDate; //有效期限
                        document.all['SAMID'].value = CVR_IDCard.SAMID; //模块号码
                        //document.all['pic'].src = CVR_IDCard.Pic;
                        document.all['pic'].src = "data:image/jpg;base64,"+CVR_IDCard.Picture;
                        document.all['Picture'].value = CVR_IDCard.Picture; //照片编码
                        document.all['PictureLen'].value = CVR_IDCard.PictureLen; */ //编码长度
                   }else{
                        ClearForm();
                        alert(strReadResult);
                   }
				}

		</script>
		
		<center>
		<a href="#" onclick="submit()" class="easyui-linkbutton" id="Button1">提   交</a>
		<a href="#" onclick="window.location.href='<%=request.getContextPath()%>/app/sldb/society/approve/show.jsp'" class="easyui-linkbutton" id="Button2">返   回</a>
		<p>
		<!-- <a href="#" onclick="Button1_onclick()" class="easyui-linkbutton" id="Button1">读   卡</a>
		<a href="#" onclick="submit()" class="easyui-linkbutton" id="Button1">提   交</a>
		<a href="#" onclick="ClearForm()" class="easyui-linkbutton" id="Button2">清   空</a> -->
		
<table width="927" style="border-left:1px solid black; border-top:1px solid black;" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <tr>
    <td height="60" colspan="10" bgcolor="#CCCCCC"><div align="center" class="STYLE1">双辽市城乡居民临时救助申请审批表</div>      
    <div align="right">编号：<input id="numberNO" name="numberNO" style="width: 200px;border: none; background-color:#CCCCCC" value="${society.numberNO }" readonly="readonly"/></div></td>
  </tr>
  
  <tr>
    <td width="39" rowspan="6" align="center" valign="middle" nowrap="nowrap" bgcolor="#CCCCCC"><p>户</p>
    <p>主</p>
    <p>信</p>
    <p>息</p></td>
    <td width="84" height="33" align="center" nowrap="nowrap" bgcolor="#FFFFFF">姓名</td>
    <td width="110" height="33" nowrap="nowrap">${society.name }</td>
    <td width="144" height="33" align="center" nowrap="nowrap" bgcolor="#FFFFFF">性别</td>
    <td width="78" height="33" nowrap="nowrap">${society.sex }</td>
    <td width="115" height="33" align="center" nowrap="nowrap" >身份证号</td>
    <td height="33" colspan="2" nowrap="nowrap">${society.identify }</td>
    <td colspan="2" rowspan="3" align="center" nowrap="nowrap"><img src="data:image/jpg;base64,${society.photo }"  style="width: 80px; height: 90px" id="picture" name="picture" readonly="readonly"/></td>
  </tr>
  <tr>
    <td width="84" height="26" align="center" nowrap="nowrap" bgcolor="#FFFFFF">婚姻<br>
    状况</td>
    <td width="110" height="26" nowrap="nowrap">${society.marry }</td>
    <td width="144" height="26" align="center" nowrap="nowrap" bgcolor="#FFFFFF">患病<br>
    名称</td>
    <td width="78" height="26" nowrap="nowrap">${society.ill }</td>
    <td width="115" height="26" align="center" nowrap="nowrap" bgcolor="#FFFFFF">残疾类别<br>
    和等级</td>
    <td height="26" colspan="2" nowrap="nowrap">${society.disability }</td>
  </tr>
  <tr>
    <td width="84" height="33" align="center" nowrap="nowrap" bgcolor="#FFFFFF">家庭人口</td>
    <td width="110" height="33" nowrap="nowrap">${society.family }</td>
    <td height="33" colspan="2" align="center" nowrap="nowrap" bgcolor="#FFFFFF">劳动能力</td>
    <td width="115" height="33" nowrap="nowrap">${society.labor }</td>
    <td width="92" height="33" align="center" nowrap="nowrap" bgcolor="#FFFFFF">家庭类别</td>
    <td width="108" height="33" nowrap="nowrap">${society.familyClass }</td>
  </tr>
  <tr>
    <td width="84" height="26" align="center" nowrap="nowrap" bgcolor="#FFFFFF">家庭总收入<br>
    (元/年)</td>
    <td width="110" height="26" nowrap="nowrap">${society.total }</td>
    <td height="26" colspan="2" align="center" nowrap="nowrap" bgcolor="#FFFFFF">收入来源</td>
    <td height="26" colspan="5" nowrap="nowrap">${society.income }</td>
  </tr>
  <tr>
    <td width="84" height="26" align="center" nowrap="nowrap" bgcolor="#FFFFFF">家庭总支出<br>
    (元/年)</td>
    <td width="110" height="26" nowrap="nowrap">${society.spending }</td>
    <td height="26" colspan="2" align="center" nowrap="nowrap" bgcolor="#FFFFFF">支出用途</td>
    <td height="26" colspan="5" nowrap="nowrap">${society.purpose }</td>
  </tr>
  <tr>
    <td width="84" height="30" align="center" nowrap="nowrap" bgcolor="#FFFFFF">户口类型</td>
    <td width="110" height="30" nowrap="nowrap">${society.accountType }</td>
    <td width="144" height="30" align="center" nowrap="nowrap" bgcolor="#FFFFFF">家庭住址</td>
    <td height="30" colspan="6" nowrap="nowrap">${society.address }</td>
  </tr>
  <tr>
    <td width="39" rowspan="7" align="center" nowrap="nowrap" bgcolor="#CCCCCC">同<br>
    住<br>其<br>他<br>成<br>员<br>情<br>况    </td>
    <td width="84" height="42" align="center" nowrap="nowrap" bgcolor="#CCCCCC">姓名</td>
    <td width="110" height="42" align="center" nowrap="nowrap" bgcolor="#CCCCCC">性别</td>
    <td width="144" height="42" align="center" nowrap="nowrap" bgcolor="#CCCCCC">身份证号</td>
    <td width="78" height="42" align="center" nowrap="nowrap" bgcolor="#CCCCCC">与户主关系</td>
    <td width="115" height="42" align="center" nowrap="nowrap" bgcolor="#CCCCCC">婚姻状况</td>
    <td width="92" height="42" align="center" nowrap="nowrap" bgcolor="#CCCCCC">患病名称</td>
    <td width="108" height="42" align="center" nowrap="nowrap" bgcolor="#CCCCCC">残疾类别和等级</td>
    <td width="80" height="42" align="center" nowrap="nowrap" bgcolor="#CCCCCC">劳动能力</td>
    <td width="55" align="center" nowrap="nowrap" bgcolor="#CCCCCC">录入方式</td>
  </tr>
  <tr>
    <td width="84" height="31" nowrap="nowrap">${subs[0].name }</td>
    <td width="110" height="31" nowrap="nowrap">${subs[0].sex }</td>
    <td width="144" height="31" nowrap="nowrap">${subs[0].identify }</td>
    <td width="78" height="31" nowrap="nowrap">${subs[0].relation }</td>
    <td width="115" height="31" nowrap="nowrap">${subs[0].marry }</td>
    <td width="92" height="31" nowrap="nowrap">${subs[0].ill }</td>
    <td width="108" height="31" nowrap="nowrap">${subs[0].disability }</td>
    <td width="80" height="31" nowrap="nowrap">${subs[0].labor }</td>
    <td width="55" height="31" nowrap="nowrap">${subs[0].inputType }</td>
  </tr>
   <tr>
    <td width="84" height="31" nowrap="nowrap">${subs[1].name }</td>
    <td width="110" height="31" nowrap="nowrap">${subs[1].sex }</td>
    <td width="144" height="31" nowrap="nowrap">${subs[1].identify }</td>
    <td width="78" height="31" nowrap="nowrap">${subs[1].relation }</td>
    <td width="115" height="31" nowrap="nowrap">${subs[1].marry }</td>
    <td width="92" height="31" nowrap="nowrap">${subs[1].ill }</td>
    <td width="108" height="31" nowrap="nowrap">${subs[1].disability }</td>
    <td width="80" height="31" nowrap="nowrap">${subs[1].labor }</td>
    <td width="55" height="31" nowrap="nowrap">${subs[1].inputType }</td>
  </tr>
   <tr>
    <td width="84" height="31" nowrap="nowrap">${subs[2].name }</td>
    <td width="110" height="31" nowrap="nowrap">${subs[2].sex }</td>
    <td width="144" height="31" nowrap="nowrap">${subs[2].identify }</td>
    <td width="78" height="31" nowrap="nowrap">${subs[2].relation }</td>
    <td width="115" height="31" nowrap="nowrap">${subs[2].marry }</td>
    <td width="92" height="31" nowrap="nowrap">${subs[2].ill }</td>
    <td width="108" height="31" nowrap="nowrap">${subs[2].disability }</td>
    <td width="80" height="31" nowrap="nowrap">${subs[2].labor }</td>
    <td width="55" height="31" nowrap="nowrap">${subs[2].inputType }</td>
  </tr>
   <tr>
    <td width="84" height="31" nowrap="nowrap">${subs[3].name }</td>
    <td width="110" height="31" nowrap="nowrap">${subs[3].sex }</td>
    <td width="144" height="31" nowrap="nowrap">${subs[3].identify }</td>
    <td width="78" height="31" nowrap="nowrap">${subs[3].relation }</td>
    <td width="115" height="31" nowrap="nowrap">${subs[3].marry }</td>
    <td width="92" height="31" nowrap="nowrap">${subs[3].ill }</td>
    <td width="108" height="31" nowrap="nowrap">${subs[3].disability }</td>
    <td width="80" height="31" nowrap="nowrap">${subs[3].labor }</td>
    <td width="55" height="31" nowrap="nowrap">${subs[3].inputType }</td>
  </tr>
   <tr>
    <td width="84" height="31" nowrap="nowrap">${subs[4].name }</td>
    <td width="110" height="31" nowrap="nowrap">${subs[4].sex }</td>
    <td width="144" height="31" nowrap="nowrap">${subs[4].identify }</td>
    <td width="78" height="31" nowrap="nowrap">${subs[4].relation }</td>
    <td width="115" height="31" nowrap="nowrap">${subs[4].marry }</td>
    <td width="92" height="31" nowrap="nowrap">${subs[4].ill }</td>
    <td width="108" height="31" nowrap="nowrap">${subs[4].disability }</td>
    <td width="80" height="31" nowrap="nowrap">${subs[4].labor }</td>
    <td width="55" height="31" nowrap="nowrap">${subs[4].inputType }</td>
  </tr>
   <tr>
    <td width="84" height="31" nowrap="nowrap">${subs[5].name }</td>
    <td width="110" height="31" nowrap="nowrap">${subs[5].sex }</td>
    <td width="144" height="31" nowrap="nowrap">${subs[5].identify }</td>
    <td width="78" height="31" nowrap="nowrap">${subs[5].relation }</td>
    <td width="115" height="31" nowrap="nowrap">${subs[5].marry }</td>
    <td width="92" height="31" nowrap="nowrap">${subs[5].ill }</td>
    <td width="108" height="31" nowrap="nowrap">${subs[5].disability }</td>
    <td width="80" height="31" nowrap="nowrap">${subs[5].labor }</td>
    <td width="55" height="31" nowrap="nowrap">${subs[5].inputType }</td>
  </tr>
  <tr>
    <td width="39" rowspan="2" align="center" nowrap="nowrap" bgcolor="#CCCCCC"><p>申请</p>
    <p>承诺</p></td>
    <td height="26" colspan="9" nowrap="nowrap" style="border-bottom: none;">&nbsp;&nbsp;本人因家庭生活困难，特申请临时救助。本人承诺在本表中所填列的全部内容及所提供的全部证明材料均真实、可靠、绝无<br>虚假、欺骗和隐瞒。如经管理审批机关及其办事机构核查存在不实之外，愿承担一切后果并接受一切处罚。</td>
  </tr>
  <tr>
    <td height="26" colspan="9" nowrap="nowrap" style="border-top: none;"> <div align="right" style="margin-right:200px;"> 申请人（签字并按手印）：       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      年&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    日 </div></td>
  </tr>
  <tr>
    <td width="39" height="143" align="center" nowrap="nowrap" bgcolor="#CCCCCC"><p>申请</p>
    <p>理由</p></td>
    <td height="143" colspan="9" nowrap="nowrap">${society.cause }</td>
  </tr>
  <tr>
    <td width="39" rowspan="3" align="center" nowrap="nowrap" bgcolor="#CCCCCC"><p>审查</p>
    <p>审批</p>
    <p>意见</p></td>
    <td colspan="3" nowrap="nowrap" style="border-bottom: none;">乡镇（街）初审意见：
      <p>调查人：</p>
    <p>助理：</p>      <p>主管领导：</p></td>
    <td colspan="3" valign="top" nowrap="nowrap" style="border-bottom: none;">社救中心复查及审批意见：
    <p>复查人：</p>      <p>审批人：</p></td>
    <td colspan="4" valign="top" nowrap="nowrap" style="border-bottom: none;">民政局主管领导审批意见：</td>
  </tr>
  
  
  <tr>
    <td height="26" colspan="3" nowrap="nowrap" style="border-top: none;"><div align="right"style="margin-right: 50px;">&nbsp;&nbsp;年 &nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp; &nbsp;&nbsp; 日 </div></td>
    <td height="26" colspan="3" nowrap="nowrap" style="border-top: none;"><div align="right" style="margin-right: 50px;">&nbsp;&nbsp;年 &nbsp;&nbsp;&nbsp;&nbsp; 月 &nbsp;&nbsp;&nbsp;&nbsp; 日</div></td>
    <td height="26" colspan="3" nowrap="nowrap" style="border-top: none;"><div align="right" style="margin-right: 50px;">&nbsp;&nbsp;年 &nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp; &nbsp;&nbsp; 日</div></td>
  </tr>
  <tr>
    <td height="26" colspan="3" nowrap="nowrap">&nbsp;&nbsp;救助金额：<input id="money" type="text" name="money" value="${society. money}"/></td>
    <td height="26" colspan="7" nowrap="nowrap">&nbsp;&nbsp;审批人：
    <select id="creater" class="easyui-combobox" 
								name="creater" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.audit" valueField="id"
								textField="text" editable="false" >${society. creater}</select></td>
  </tr>
  <tr>
    <td height="26" colspan="10" nowrap="nowrap" bgcolor="#CCCCCC">附件信息：</td>
  </tr>
  <tr>
	<td height="100" colspan=10><div align="left"  id="files"></div></td>
  </tr>
</table>
  </center>
  	<input type="hidden" id="photo" name="photo" value="${society. photo}"/>
  	
 </form>
 <script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "form1"
		});

		//金额
		$("#money").formValidator({
			onfocus : "请输入金额"
		}).regexValidator({
			regexp : "number",
			onerror : "请输入数字"
		});
		});
</script>
</body>
</html>
