<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.auth.User"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.auth.Organization"%>
<%@page import="java.util.List"%>
	<%
	User user = (User)session.getAttribute("authUser");
	String userId = user.getId();
	Organization organizationUser = Organization.getOneOrganizationByUser(userId);
	String name = organizationUser.getName();
	List organizations = Organization.getOrganizationByUser(user.getId());
	String department = "";
	if (organizations != null && !organizations.isEmpty()) {
		department = ((Organization)organizations.get(0)).getName();
	}
	%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加社会化救助信息</title>
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
<script> 
function submit(){ 
var causeStr = addForm.cause.value;
var causeLen = causeStr.length;
if(addForm.name.value==""){ 
alert("申请人姓名不能为空"); 
}else if(addForm.identify.value==""){ 
alert("身份证不能为空"); 
}else if($('#marry').combogrid('getValue')==""){ 
alert("婚姻状况不能为空"); 
}else if(addForm.ill.value==""){ 
alert("患病名称不能为空"); 
}else if(addForm.disability.value==""){ 
alert("残疾等级不能为空"); 
}else if(addForm.family.value==""){ 
alert("家庭人口不能为空"); 
}else if($('#labor').combogrid('getValue')==""){ 
alert("劳动能力不能为空"); 
}else if($('#familyClass').combogrid('getValue')==""){
alert("家庭类别不能为空"); 
}else if(addForm.total.value==""){ 
alert("家庭总收入不能为空"); 
}else if(addForm.income.value==""){ 
alert("收入来源不能为空"); 
}else if(addForm.spending.value==""){ 
alert("家庭总支出不能为空"); 
}else if(addForm.purpose.value==""){ 
alert("支出用途不能为空"); 
}else if($('#accountType').combogrid('getValue')==""){
alert("户口不能为空"); 
} else if(addForm.cause.value ==""){
alert("申报理由不能为空"); 
}else if(causeLen <30){
alert("申报理由不能少于30个字符"); 
}else{
	$('#addForm').submit();
}
} 
</script> 

<% 
	String date = DateUtils.getSystemDate();
	User user1 = (User)request.getSession().getAttribute("authUser");// TODO Auto-generated method stub
	String number = user1.getNumber();
	int random = (int) (Math.random()*9000+1000);
	String numberNO = date + "-" + number + "-"+Integer.toString(random);
%>
</head>
<body>
	<form id="addForm" name="addForm" action="<%=request.getContextPath()%>/app/sldb/society/add.action" method="post">
		<input type="hidden" name="type1" value="auto" />
		<input id="createTime" name="createTime" type="hidden" value="<%=DateUtils.getSystemTime()%>"></input>
			<input id="creater" name="creater" type="hidden" value="<%=user.getId()%>"></input>
			<input id="createrName" name="createrName" type="hidden" value="<%=user.getName()%>"></input>
			<input id="createrDepartment" name="createrDepartment"  type="hidden" value="<%=department%>"></input>
			<input id="state" name="state" type="hidden" value="创建"></input>
			<input id="type" name="type" type="hidden" value="自动"></input>
		<OBJECT classid="clsid:10946843-7507-44FE-ACE8-2B3483D179B7"
			id="CVR_IDCard" name="CVR_IDCard" width="0" height="0"> </OBJECT>

		<script language="javascript" type="text/javascript">
				function ClearForm() {
					document.getElementById('name').value = "";
                    document.getElementById('sex').value = "";
                    document.getElementById('identify').value =  "";
                    document.getElementById('address').value = "";
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
                      ClearForm2();
                      return true;
				}
				function ClearForm2() {
					var i=0;
					for(;i<6;i++){
						document.getElementById('c_name'+i).value = "";
	                    document.getElementById('c_sex'+i).value = "";
	                    document.getElementById('c_identify'+i).value = "";
	                    document.getElementById('c_relation'+i).value = "";
	                    document.getElementById('c_marry'+i).value = "";
	                    document.getElementById('c_ill'+i).value = "";
	                    document.getElementById('c_disability'+i).value = "";
	                    document.getElementById('c_labor'+i).value = "";
					}
					
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
                         document.getElementById('address').value = CVR_IDCard.Address;
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
                      	//当前申请人员保障信息统计
                        window.open ('<%=request.getContextPath()%>/app/sldb/society/apply/statistics.jsp?cardNo='+CVR_IDCard.CardNo,'打印页面','height=300,width=300,top=50,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no');
                   }else{
                        ClearForm();
                        alert(strReadResult);
                   }
				}
				function Button2_onclick() {
                   	var CVR_IDCard = document.getElementById("CVR_IDCard");					
					var strReadResult = CVR_IDCard.ReadCard();
					if(strReadResult == "0")
					{
						if(document.getElementById('c_identify0').value==""){
							document.getElementById('c_name0').value =  CVR_IDCard.Name;
	                        document.getElementById('c_sex0').value =  CVR_IDCard.Sex;
	                        document.getElementById('c_identify0').value =  CVR_IDCard.CardNo;
	                        document.getElementById('c_inputType0').value = "自动";
						}else if(document.getElementById('c_identify1').value==""){
							document.getElementById('c_name1').value =  CVR_IDCard.Name;
	                        document.getElementById('c_sex1').value =  CVR_IDCard.Sex;
	                        document.getElementById('c_identify1').value =  CVR_IDCard.CardNo;
	                        document.getElementById('c_inputType1').value = "自动";
						}else if(document.getElementById('c_identify2').value==""){
							document.getElementById('c_name2').value =  CVR_IDCard.Name;
	                        document.getElementById('c_sex2').value =  CVR_IDCard.Sex;
	                        document.getElementById('c_identify2').value =  CVR_IDCard.CardNo;
	                        document.getElementById('c_inputType2').value = "自动";
						}else if(document.getElementById('c_identify3').value==""){
							document.getElementById('c_name3').value =  CVR_IDCard.Name;
	                        document.getElementById('c_sex3').value =  CVR_IDCard.Sex;
	                        document.getElementById('c_identify3').value =  CVR_IDCard.CardNo;
	                        document.getElementById('c_inputType3').value = "自动";
						}else if(document.getElementById('c_identify4').value==""){
							document.getElementById('c_name4').value =  CVR_IDCard.Name;
	                        document.getElementById('c_sex4').value =  CVR_IDCard.Sex;
	                        document.getElementById('c_identify4').value =  CVR_IDCard.CardNo;
	                        document.getElementById('c_inputType4').value = "自动";
						}else if(document.getElementById('c_identify5').value==""){
							document.getElementById('c_name5').value =  CVR_IDCard.Name;
	                        document.getElementById('c_sex5').value =  CVR_IDCard.Sex;
	                        document.getElementById('c_identify5').value =  CVR_IDCard.CardNo;
	                        document.getElementById('c_inputType5').value = "自动";
						}
                        
                   }else{
                        alert(strReadResult);
                   }
				}
		</script>
		<center>
		<a href="#" onclick="Button1_onclick()" class="easyui-linkbutton" id="Button1">户   主</a>
		<a href="#" onclick="Button2_onclick()" class="easyui-linkbutton" id="Button1">同   户</a>
		<a href="#" onclick="submit()" class="easyui-linkbutton" id="Button1">提   交</a>
		<a href="#" onclick="ClearForm()" class="easyui-linkbutton" id="Button2">清   空</a>
		<p>
<table width="900" style="border-left:1px solid black; border-top:1px solid black;" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <tr>
    <td height="60" colspan="9" bgcolor="#CCCCCC"><div align="center" class="STYLE1">双辽市城乡居民临时救助申请审批表</div>      <div align="right" >编号：<input id="numberNO" name="numberNO" style="width: 200px;background-color:#CCCCCC" value="<%=numberNO %>" readonly="readonly" /></div></td>
  </tr>
  
  <tr>
    <td width="40" rowspan="6" align="center" valign="middle" nowrap="nowrap" bgcolor="#CCCCCC"><p>户</p>
    <p>主</p>
    <p>信</p>
    <p>息</p></td>
    <td width="85" height="33" align="center" nowrap="nowrap" ><span style="color: red">*</span>姓名</td>
    <td width="111" height="33" nowrap="nowrap"><input id="name" type="text" name="name" readonly="readonly"/></td>
    <td width="123" height="33" align="center" nowrap="nowrap" ><span style="color: red">*</span>性别</td>
    <td width="101" height="33" nowrap="nowrap"><input id="sex" type="text" name="sex"readonly="readonly" /></td>
    <td width="116" height="33" align="center" nowrap="nowrap" ><span style="color: red">*</span>身份证号</td>
    <td height="33" colspan="2" nowrap="nowrap"><input id="identify" type="text" name="identify"  readonly="readonly"/></td>
    <td width="102" rowspan="3" align="center" nowrap="nowrap"><img src="" style="width: 80px; height: 90px" id="picture" name="picture" /></td>
  </tr>
  <tr>
    <td width="85" height="26" align="center" nowrap="nowrap" ><span style="color: red">*</span>婚姻<br>
    状况</td>
    <td width="111" height="26" nowrap="nowrap"><select id="marry" class="easyui-combobox" 
								name="marry" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.marry" valueField="id"
								textField="text" editable="false" panelHeight="90"></select></td>
    <td width="123" height="26" align="center" nowrap="nowrap" ><span style="color: red">*</span>患病<br>
    名称</td>
    <td width="101" height="26" nowrap="nowrap"><input id="ill" type="text" name="ill" /></td>
    <td width="116" height="26" align="center" nowrap="nowrap" ><span style="color: red">*</span>残疾类别<br>
    和等级</td>
    <td height="26" colspan="2" nowrap="nowrap"><input id="disability" type="text" name="disability"/></td>
  </tr>
  <tr>
    <td width="85" height="33" align="center" nowrap="nowrap" ><span style="color: red">*</span>家庭人口</td>
    <td width="111" height="33" nowrap="nowrap"><input id="family" type="text" name="family" /></td>
    <td height="33" colspan="2" align="center" nowrap="nowrap" ><span style="color: red">*</span>劳动能力</td>
    <td width="116" height="33" nowrap="nowrap"><select id="labor" class="easyui-combobox" 
								name="labor" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.workable" valueField="id"
								textField="text" editable="false" panelHeight="70"></select></td>
    <td width="93" height="33" align="center" nowrap="nowrap" ><span style="color: red">*</span>家庭类别</td>
    <td width="109" height="33" nowrap="nowrap"><select id="familyClass" class="easyui-combobox" 
								name="familyClass" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.home" valueField="id"
								textField="text" editable="false"></select></td>
  </tr>
  <tr>
    <td width="85" height="26" align="center" nowrap="nowrap" ><span style="color: red">*</span>家庭总收入<br>
    (元/年)</td>
    <td width="111" height="26" nowrap="nowrap"><input id="total" type="text" name="total" /></td>
    <td height="26" colspan="2" align="center" nowrap="nowrap" ><span style="color: red">*</span>收入来源</td>
    <td height="26" colspan="4" nowrap="nowrap"><input id="income" type="text" name="income" /></td>
  </tr>
  <tr>
    <td width="85" height="26" align="center" nowrap="nowrap" ><span style="color: red">*</span>家庭总支出<br>
    (元/年)</td>
    <td width="111" height="26" nowrap="nowrap"><input id="spending" type="text" name="spending" /></td>
    <td height="26" colspan="2" align="center" nowrap="nowrap" ><span style="color: red">*</span>支出用途</td>
    <td height="26" colspan="4" nowrap="nowrap"><input id="purpose" type="text" name="purpose"/></td>
  </tr>
  <tr>
    <td width="85" height="30" align="center" nowrap="nowrap" ><span style="color: red">*</span>户口类型</td>
    <td width="111" height="30" nowrap="nowrap"><select id="accountType" class="easyui-combobox" 
								name="accountType" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.hukou" valueField="id"
								textField="text" editable="false" panelHeight="50"></select></td>
    <td width="123" height="30" align="center" nowrap="nowrap" ><span style="color: red">*</span>家庭住址</td>
    <td height="30" colspan="5" nowrap="nowrap"><input id="address" type="text" name="address" size="100" readonly="readonly"/></td>
  </tr>
  <tr>
    <td width="40" rowspan="7" align="center" nowrap="nowrap" bgcolor="#CCCCCC">同<br>
    住<br>其<br>他<br>成<br>员<br>情<br>况    </td>
    <td width="85" height="34" align="center" nowrap="nowrap" >姓名</td>
    <td width="111" height="34" align="center" nowrap="nowrap" >性别</td>
    <td width="123" height="34" align="center" nowrap="nowrap" >身份证号</td>
    <td width="101" height="34" align="center" nowrap="nowrap" >与户主关系</td>
    <td width="116" height="34" align="center" nowrap="nowrap" >婚姻状况</td>
    <td width="93" height="34" align="center" nowrap="nowrap" >患病名称</td>
    <td width="109" height="34" align="center" nowrap="nowrap" >残疾类别和等级</td>
    <td width="102" height="34" align="center" nowrap="nowrap" >劳动能力</td>
  </tr>
  <tr>
    <td width="85" height="31" nowrap="nowrap"><input id="c_name0" type="text" name="c_name" size="12" /></td>
    <td width="111" height="31" nowrap="nowrap"><input id="c_sex0" type="text" name="c_sex" size="15"/></td>
    <td width="123" height="31" nowrap="nowrap"><input id="c_identify0" type="text" name="c_identify" size="20"/></td>
    <td width="101" height="31" nowrap="nowrap"><select id="c_relation0" class="easyui-combobox"
								name="c_relation" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation" valueField="id"
								textField="text" editable="false" panelHeight="70"></select></td>
    <td width="116" height="31" nowrap="nowrap"><select id="c_marry0" class="easyui-combobox" name="c_marry" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.marry" 
		    valueField="id" textField="text" editable="true" panelHeight="90"></select></td>
    <td width="93" height="31" nowrap="nowrap"><input id="c_ill0" type="text" name="c_ill" size="15" /></td>
    <td width="109" height="31" nowrap="nowrap"><input id="c_disability0" type="text" name="c_disability" size="15" /></td>
    <td width="102" height="31" nowrap="nowrap"><select id="c_labor0" class="easyui-combobox" name="c_labor" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.workable" 
		    valueField="id" textField="text" editable="true" panelHeight="70"></select></td>
	<td ><input id="c_inputType0" type="hidden" name="c_inputType" value=""/></td>	    
  </tr>
  <tr>
    <td width="85" height="31" nowrap="nowrap"><input id="c_name1" type="text" name="c_name" size="12" /></td>
    <td width="111" height="31" nowrap="nowrap"><input id="c_sex1" type="text" name="c_sex" size="15"/></td>
    <td width="123" height="31" nowrap="nowrap"><input id="c_identify1" type="text" name="c_identify" size="20"/></td>
    <td width="101" height="31" nowrap="nowrap"><select id="c_relation1" class="easyui-combobox"
								name="c_relation" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation" valueField="id"
								textField="text" editable="false" panelHeight="70"></select></td>
    <td width="116" height="31" nowrap="nowrap"><select id="c_marry1" class="easyui-combobox" name="c_marry" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.marry" 
		    valueField="id" textField="text" editable="true" panelHeight="90"></select></td>
    <td width="93" height="31" nowrap="nowrap"><input id="c_ill1" type="text" name="c_ill" size="15" /></td>
    <td width="109" height="31" nowrap="nowrap"><input id="c_disability1" type="text" name="c_disability" size="15" /></td>
    <td width="102" height="31" nowrap="nowrap"><select id="c_labor1" class="easyui-combobox" name="c_labor" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.workable" 
		    valueField="id" textField="text" editable="true" panelHeight="70"></select></td>
	<td ><input id="c_inputType1" type="hidden" name="c_inputType" value=""/></td>
  </tr>
  <tr>
    <td width="85" height="31" nowrap="nowrap"><input id="c_name2" type="text" name="c_name" size="12" /></td>
    <td width="111" height="31" nowrap="nowrap"><input id="c_sex2" type="text" name="c_sex" size="15"/></td>
    <td width="123" height="31" nowrap="nowrap"><input id="c_identify2" type="text" name="c_identify" size="20"/></td>
    <td width="101" height="31" nowrap="nowrap"><select id="c_relation2" class="easyui-combobox"
								name="c_relation" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation" valueField="id"
								textField="text" editable="false" panelHeight="70"></select></td>
    <td width="116" height="31" nowrap="nowrap"><select id="c_marry2" class="easyui-combobox" name="c_marry" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.marry" 
		    valueField="id" textField="text" editable="true" panelHeight="90"></select></td>
    <td width="93" height="31" nowrap="nowrap"><input id="c_ill2" type="text" name="c_ill" size="15" /></td>
    <td width="109" height="31" nowrap="nowrap"><input id="c_disability2" type="text" name="c_disability" size="15" /></td>
    <td width="102" height="31" nowrap="nowrap"><select id="c_labor2" class="easyui-combobox" name="c_labor" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.workable" 
		    valueField="id" textField="text" editable="true" panelHeight="70"></select></td>
	<td ><input id="c_inputType2" type="hidden" name="c_inputType" value=""/></td>
  </tr>
  <tr>
    <td width="85" height="31" nowrap="nowrap"><input id="c_name3" type="text" name="c_name" size="12" /></td>
    <td width="111" height="31" nowrap="nowrap"><input id="c_sex3" type="text" name="c_sex" size="15"/></td>
    <td width="123" height="31" nowrap="nowrap"><input id="c_identify3" type="text" name="c_identify" size="20"/></td>
    <td width="101" height="31" nowrap="nowrap"><select id="c_relation3" class="easyui-combobox"
								name="c_relation" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation" valueField="id"
								textField="text" editable="false" panelHeight="70"></select></td>
    <td width="116" height="31" nowrap="nowrap"><select id="c_marry3" class="easyui-combobox" name="c_marry" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.marry" 
		    valueField="id" textField="text" editable="true" panelHeight="90"></select></td>
    <td width="93" height="31" nowrap="nowrap"><input id="c_ill3" type="text" name="c_ill" size="15" /></td>
    <td width="109" height="31" nowrap="nowrap"><input id="c_disability3" type="text" name="c_disability" size="15" /></td>
    <td width="102" height="31" nowrap="nowrap"><select id="c_labor3" class="easyui-combobox" name="c_labor" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.workable" 
		    valueField="id" textField="text" editable="true" panelHeight="70"></select></td>
	<td ><input id="c_inputType3" type="hidden" name="c_inputType" value=""/></td>
  </tr>
  <tr>
    <td width="85" height="31" nowrap="nowrap"><input id="c_name4" type="text" name="c_name" size="12" /></td>
    <td width="111" height="31" nowrap="nowrap"><input id="c_sex4" type="text" name="c_sex" size="15"/></td>
    <td width="123" height="31" nowrap="nowrap"><input id="c_identify4" type="text" name="c_identify" size="20"/></td>
    <td width="101" height="31" nowrap="nowrap"><select id="c_relation4" class="easyui-combobox"
								name="c_relation" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation" valueField="id"
								textField="text" editable="false" panelHeight="70"></select></td>
    <td width="116" height="31" nowrap="nowrap"><select id="c_marry4" class="easyui-combobox" name="c_marry" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.marry" 
		    valueField="id" textField="text" editable="true" panelHeight="90"></select></td>
    <td width="93" height="31" nowrap="nowrap"><input id="c_ill4" type="text" name="c_ill" size="15" /></td>
    <td width="109" height="31" nowrap="nowrap"><input id="c_disability4" type="text" name="c_disability" size="15" /></td>
    <td width="102" height="31" nowrap="nowrap"><select id="c_labor4" class="easyui-combobox" name="c_labor" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.workable" 
		    valueField="id" textField="text" editable="true" panelHeight="70"></select></td>
	<td ><input id="c_inputType4" type="hidden" name="c_inputType" value=""/></td>
  </tr>
  <tr>
    <td width="85" height="31" nowrap="nowrap"><input id="c_name5" type="text" name="c_name" size="12" /></td>
    <td width="111" height="31" nowrap="nowrap"><input id="c_sex5" type="text" name="c_sex" size="15"/></td>
    <td width="123" height="31" nowrap="nowrap"><input id="c_identify5" type="text" name="c_identify" size="20"/></td>
    <td width="101" height="31" nowrap="nowrap"><select id="c_relation5" class="easyui-combobox"
								name="c_relation" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation" valueField="id"
								textField="text" editable="false" panelHeight="70"></select></td>
    <td width="116" height="31" nowrap="nowrap"><select id="c_marry5" class="easyui-combobox" name="c_marry" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.marry" 
		    valueField="id" textField="text" editable="true" panelHeight="90"></select></td>
    <td width="93" height="31" nowrap="nowrap"><input id="c_ill5" type="text" name="c_ill" size="15" /></td>
    <td width="109" height="31" nowrap="nowrap"><input id="c_disability5" type="text" name="c_disability" size="15" /></td>
    <td width="102" height="31" nowrap="nowrap"><select id="c_labor5" class="easyui-combobox" name="c_labor" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.workable" 
		    valueField="id" textField="text" editable="true" panelHeight="70"></select></td>
	<td ><input id="c_inputType5" type="hidden" name="c_inputType" value=""/></td>
  </tr>
  <tr>
    <td width="40" rowspan="2" align="center" nowrap="nowrap" bgcolor="#CCCCCC"><p>申请</p>
    <p>承诺</p></td>
    <td height="26" colspan="8" nowrap="nowrap" style="border-bottom: none;">&nbsp;&nbsp;本人因家庭生活困难，特申请临时救助。本人承诺在本表中所填列的全部内容及所提供的全部证明<br>材料均真实、可靠、绝无虚假、欺骗和隐瞒。如经管理审批机关及其办事机构核查存在不实之外，愿承担一切后果<br>并接受一切处罚。</td>
  </tr>
  <tr>
    <td height="26" colspan="8" nowrap="nowrap" style="border-top: none;"> <div align="right"> 申请人（签字并按手印）：             年    月    日 </div></td>
  </tr>
  <tr>
    <td width="40" height="143" align="center" nowrap="nowrap" bgcolor="#CCCCCC"><p>申请</p>
    <p>理由</p></td>
    <td height="143" colspan="8" nowrap="nowrap"><textarea id="cause" name="cause" style="overflow-x:hidden;overflow-y:hidden;border:none; width:1000px; height:160px;margin:5px 0px 0px 5px"/></textarea></td>
  </tr>
  <tr>
    <td width="40" rowspan="3" align="center" nowrap="nowrap" bgcolor="#CCCCCC"><p>审查</p>
    <p>审批</p>
    <p>意见</p></td>
    <td colspan="2" nowrap="nowrap" style="border-bottom: none;">乡镇（街）初审意见：
      <p>调查人：</p>
    <p>助理：</p>      <p>主管领导：</p></td>
    <td colspan="3" valign="top" nowrap="nowrap" style="border-bottom: none;">社救中心复查及审批意见：
    <p>复查人：</p>      <p>审批人：</p></td>
    <td colspan="3" valign="top" nowrap="nowrap" style="border-bottom: none;">民政局主管领导审批意见：</td>
  </tr>
  
  
  <tr>
    <td height="26" colspan="2" nowrap="nowrap" style="border-top: none;"><div align="center">年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp; &nbsp;&nbsp;日 </div></td>
    <td height="26" colspan="3" nowrap="nowrap" style="border-top: none;"><div align="center">年&nbsp;&nbsp; &nbsp;&nbsp;月&nbsp;&nbsp; &nbsp;&nbsp;日</div></td>
    <td height="26" colspan="3" nowrap="nowrap" style="border-top: none;"><div align="center">年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp; &nbsp;&nbsp;日</div></td>
  </tr>
  <tr>
    <td height="26" colspan="8" nowrap="nowrap">&nbsp;&nbsp;救助金额：<input id="money" type="text" name="money" value="" readonly="readonly"/></td>
  </tr>
</table>
</center>
<input type="hidden" id="photo" name="photo" value=""/>
</form>
<!--  <script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});

		//金额
		$("#money").formValidator({
			onfocus : "请输入金额"
		}).regexValidator({
			regexp : "number",
			onerror : "请输入数字"
		});
		});
</script> -->
</body>
</html>
