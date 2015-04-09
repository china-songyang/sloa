<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.auth.User"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.auth.Organization"%>
<%@page import="java.util.List"%>
<%
	User user = (User) session.getAttribute("authUser");
	String userId = user.getId();
	Organization organizationUser = Organization
			.getOneOrganizationByUser(userId);
	String name = organizationUser.getName();
	List<Organization> organizations = Organization.getOrganizationByUser(user
			.getId());
	String department = "";
	if (organizations != null && !organizations.isEmpty()) {
		department = ((Organization) organizations.get(0)).getName();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加临时救助人员信息</title>
<%@ include file="/app/includes/header.jsp"%>
<style type="text/css">
.table_1 {
	border-right: 1px solid black;
	border-top: 1px solid black
}

.table_1 td {
	border-left: 1px solid black;
	border-bottom: 1px solid black;
}

body {
	font-size: 12px;
}
</style>
<script> 
function submit(){ 
/* var causeStr = addForm.cause.value;
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
} */
	$('#addForm').submit();
} 
</script>

<%
	String date = DateUtils.getSystemDate();
	User user1 = (User) request.getSession().getAttribute("authUser");
	String number = user1.getNumber();
	int random = (int) (Math.random() * 9000 + 1000);
	String numberNO = date + "-" + number + "-"
			+ Integer.toString(random);
%>
</head>
<body>
	<form id="addForm" name="addForm"
		action="<%=request.getContextPath()%>/app/sldb/general/add.action"
		method="post">
		<input type="hidden" name="type1" value="auto" /> <input
			id="createTime" name="createTime" type="hidden"
			value="<%=DateUtils.getSystemTime()%>"></input> <input id="creater"
			name="creater" type="hidden" value="<%=user.getId()%>"></input> <input
			id="createrName" name="createrName" type="hidden"
			value="<%=user.getName()%>"></input> <input id="createrDepartment"
			name="createrDepartment" type="hidden" value="<%=department%>"></input>
		<input id="state" name="state" type="hidden" value="创建"></input> <input
			id="type" name="type" type="hidden" value="自动"></input>
		<OBJECT classid="clsid:10946843-7507-44FE-ACE8-2B3483D179B7"
			id="CVR_IDCard" name="CVR_IDCard" width="0" height="0"> </OBJECT>

		<script language="javascript" type="text/javascript">
				function ClearForm() {
					$(':input','#addForm')
					 .not(':button, :submit, :reset, :hidden')
					 .val('')
					 .removeAttr('checked')
					 .removeAttr('selected');
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
                        <%-- window.open ('<%=request.getContextPath()%>/app/sldb/general/apply/statistics.jsp?cardNo='
											+ CVR_IDCard.CardNo,
									'打印页面',
									'height=300,width=300,top=50,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no'); --%>
				} else {
					ClearForm();
					alert(strReadResult);
				}
			}
			function Button2_onclick() {
				var CVR_IDCard = document.getElementById("CVR_IDCard");
				var strReadResult = CVR_IDCard.ReadCard();
				if (strReadResult == "0") {
					if (document.getElementById('c_identify0').value == "") {
						document.getElementById('c_name0').value = CVR_IDCard.Name;
						document.getElementById('c_sex0').value = CVR_IDCard.Sex;
						document.getElementById('c_identify0').value = CVR_IDCard.CardNo;
						document.getElementById('c_inputType0').value = "自动";
					} else if (document.getElementById('c_identify1').value == "") {
						document.getElementById('c_name1').value = CVR_IDCard.Name;
						document.getElementById('c_sex1').value = CVR_IDCard.Sex;
						document.getElementById('c_identify1').value = CVR_IDCard.CardNo;
						document.getElementById('c_inputType1').value = "自动";
					} else if (document.getElementById('c_identify2').value == "") {
						document.getElementById('c_name2').value = CVR_IDCard.Name;
						document.getElementById('c_sex2').value = CVR_IDCard.Sex;
						document.getElementById('c_identify2').value = CVR_IDCard.CardNo;
						document.getElementById('c_inputType2').value = "自动";
					} else if (document.getElementById('c_identify3').value == "") {
						document.getElementById('c_name3').value = CVR_IDCard.Name;
						document.getElementById('c_sex3').value = CVR_IDCard.Sex;
						document.getElementById('c_identify3').value = CVR_IDCard.CardNo;
						document.getElementById('c_inputType3').value = "自动";
					} else if (document.getElementById('c_identify4').value == "") {
						document.getElementById('c_name4').value = CVR_IDCard.Name;
						document.getElementById('c_sex4').value = CVR_IDCard.Sex;
						document.getElementById('c_identify4').value = CVR_IDCard.CardNo;
						document.getElementById('c_inputType4').value = "自动";
					} else if (document.getElementById('c_identify5').value == "") {
						document.getElementById('c_name5').value = CVR_IDCard.Name;
						document.getElementById('c_sex5').value = CVR_IDCard.Sex;
						document.getElementById('c_identify5').value = CVR_IDCard.CardNo;
						document.getElementById('c_inputType5').value = "自动";
					}

				} else {
					alert(strReadResult);
				}
			}
		</script>
		<center>
			<a href="#" onclick="Button1_onclick()" class="easyui-linkbutton"
				id="Button1">户 主</a> <a href="#" onclick="Button2_onclick()"
				class="easyui-linkbutton" id="Button1">同 户</a> <a href="#"
				onclick="submit()" class="easyui-linkbutton" id="Button1">提 交</a> <a
				href="#" onclick="ClearForm()" class="easyui-linkbutton"
				id="Button2">清 空</a>
			<p>
				<label style="font-size: 24px">申请临时救助家庭基本情况登记表</label> <br> <br>
			<table width="60%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="table_1">
				<tr>
					<td height="30" colspan="9">&nbsp;救助类别： <input type="checkbox"
						value="急难型">急难型<input type="checkbox" value="急难型">困境低保<input
						type="checkbox" value="急难型">支出型<input type="checkbox"
						value="急难型">其他 <span
						style="float: right; margin-right: 10px;">编号： <input
							type="text" id="number" name="number"
							style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></span></td>
				</tr>
				<tr>
					<td height="20" colspan="9" bgcolor="#BFBFBF"><strong>申请人基本情况：</strong></td>
				</tr>
				<tr>
					<td width="73" height="31"><div align="center">户主或本人姓名</div></td>
					<td width="67">&nbsp;<input type="text" id="name" name="name"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td width="64"><div align="center">性别</div></td>
					<td width="83">&nbsp; <select id="sex" name="sex">
							<option value="man">男</option>
							<option value="women">女</option>
					</select>
					</td>
					<td width="92"><div align="center">身份证号</div></td>
					<td colspan="2">&nbsp;<input type="text" id="identify"
						name="identify"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td colspan="2" rowspan="7">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上传照片</td>
				</tr>
				<tr>
					<td height="33"><div align="center">联系电话</div></td>
					<td>&nbsp;<input type="text" id="contact" name="contact"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><div align="center">家庭人口</div></td>
					<td>&nbsp;<input type="text" id="home" name="home"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><div align="center">暂住证或居住证号</div></td>
					<td colspan="2">&nbsp;<input type="text" id="tempNumber"
						name="tempNumber"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
				</tr>
				<tr>
					<td height="27"><div align="center">确诊机构</div></td>
					<td>&nbsp;<input type="text" id="diagnosisOrg"
						name="diagnosisOrg"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><div align="center">病种</div></td>
					<td>&nbsp;<input type="text" id="diseaseKind"
						name="diseaseKind"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><div align="center">医保类型</div></td>
					<td colspan="2">&nbsp;<input type="text" id="healthCareType"
						name="healthCareType"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
				</tr>
				<tr>
					<td height="26"><div align="center">对象类别</div></td>
					<td colspan="6">&nbsp;<input type="text" id="peopleType"
						name="peopleType"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
				</tr>
				<tr>
					<td height="26"><div align="center">申请事由</div></td>
					<td colspan="6">&nbsp;<input type="text" id="cause"
						name="cause"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
				</tr>
				<tr>
					<td height="26"><div align="center">户籍地址</div></td>
					<td colspan="6">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;县（市、区）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乡（镇、街）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;村（社区）</td>
				</tr>
				<tr>
					<td height="26"><div align="center">居住地址</div></td>
					<td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;县（市、区）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乡（镇、街）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;村（社区）</td>
				</tr>
				<tr>
					<td height="20" colspan="9" bgcolor="#BFBFBF"><strong>共同生活家庭成员情况：</strong></td>
				</tr>
				<tr>
					<td height="33"><div align="center">姓名</div></td>
					<td><div align="center">性别</div></td>
					<td><div align="center">与户主关系</div></td>
					<td><div align="center">身份证号</div></td>
					<td><div align="center">暂住证或居住证号</div></td>
					<td width="68"><div align="center">病种</div></td>
					<td width="70"><div align="center">确诊机构</div></td>
					<td width="63"><div align="center">医保类型</div></td>
					<td width="74"><div align="center">联系电话</div></td>
				</tr>
				<tr>
					<td height="20"><input id="c_name0" type="text" name="c_name"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><select id="c_sex0" name="c_sex">
							<option value="man">男</option>
							<option value="women">女</option>
					</select></td>
					<td><select id="c_personRelation0" class="easyui-combobox"
						name="c_personRelation"
						url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation"
						valueField="id" textField="text" editable="false" panelHeight="70"></select>
					</td>
					<td><input id="c_identity0" type="text" name="c_identity"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_tempNumber0" type="text" name="c_tempNumber"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_diseaseKind0" type="text"
						name="c_diseaseKind"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_diagnosisOrg0" type="text"
						name="c_diagnosisOrg"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_healthCareType0" type="text"
						name="c_healthCareType"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_contact0" type="text" name="c_contact"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
				</tr>
				<tr>
					<td height="20"><input id="c_name1" type="text" name="c_name"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><select id="c_sex1" name="c_sex">
							<option value="man">男</option>
							<option value="women">女</option>
					</select></td>
					<td><select id="c_personRelation1" class="easyui-combobox"
						name="c_personRelation"
						url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation"
						valueField="id" textField="text" editable="false" panelHeight="70"></select>
					</td>
					<td><input id="c_identity1" type="text" name="c_identity"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_tempNumber1" type="text" name="c_tempNumber"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_diseaseKind1" type="text"
						name="c_diseaseKind"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_diagnosisOrg1" type="text"
						name="c_diagnosisOrg"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_healthCareType1" type="text"
						name="c_healthCareType"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_contact1" type="text" name="c_contact"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
				</tr>
				<tr>
					<td height="20"><input id="c_name2" type="text" name="c_name"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><select id="c_sex2" name="c_sex">
							<option value="man">男</option>
							<option value="women">女</option>
					</select></td>
					<td><select id="c_personRelation2" class="easyui-combobox"
						name="c_personRelation"
						url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation"
						valueField="id" textField="text" editable="false" panelHeight="70"></select>
					</td>
					<td><input id="c_identity2" type="text" name="c_identity"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_tempNumber2" type="text" name="c_tempNumber"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_diseaseKind2" type="text"
						name="c_diseaseKind"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_diagnosisOrg2" type="text"
						name="c_diagnosisOrg"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_healthCareType2" type="text"
						name="c_healthCareType"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_contact2" type="text" name="c_contact"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
				</tr>
				<tr>
					<td height="20"><input id="c_name3" type="text" name="c_name"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><select id="c_sex3" name="c_sex">
							<option value="man">男</option>
							<option value="women">女</option>
					</select></td>
					<td><select id="c_personRelation3" class="easyui-combobox"
						name="c_personRelation"
						url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation"
						valueField="id" textField="text" editable="false" panelHeight="70"></select>
					</td>
					<td><input id="c_identity3" type="text" name="c_identity"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_tempNumber3" type="text" name="c_tempNumber"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_diseaseKind3" type="text"
						name="c_diseaseKind"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_diagnosisOrg3" type="text"
						name="c_diagnosisOrg"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_healthCareType3" type="text"
						name="c_healthCareType"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_contact3" type="text" name="c_contact"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
				</tr>
				<tr>
					<td height="20"><input id="c_name4" type="text" name="c_name"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><select id="c_sex4" name="c_sex">
							<option value="man">男</option>
							<option value="women">女</option>
					</select></td>
					<td><select id="c_personRelation4" class="easyui-combobox"
						name="c_personRelation"
						url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.relation"
						valueField="id" textField="text" editable="false" panelHeight="70"></select>
					</td>
					<td><input id="c_identity4" type="text" name="c_identity"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_tempNumber4" type="text" name="c_tempNumber"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_diseaseKind4" type="text"
						name="c_diseaseKind"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_diagnosisOrg4" type="text"
						name="c_diagnosisOrg"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_healthCareType4" type="text"
						name="c_healthCareType"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
					<td><input id="c_contact4" type="text" name="c_contact"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
				</tr>
				<tr>
					<td height="20"><div align="center">审批人</div></td>
					<td colspan="3">&nbsp; <input type="text" id="audit"
						name="audit"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" />
					</td>
					<td><div align="center">审批金额</div></td>
					<td colspan="4">&nbsp;<input type="text" id="money"
						name="money"
						style="border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;" /></td>
				</tr>
				<tr>
					<td height="20" colspan="9" bgcolor="#BFBFBF"><strong>附件：</strong></td>
				</tr>
				<tr>
					<td height="99" colspan="9">&nbsp;&nbsp;&nbsp;&nbsp;暂无附件</td>
				</tr>
			</table>
		</center>
		<input type="hidden" id="photo" name="photo" value="" />
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
