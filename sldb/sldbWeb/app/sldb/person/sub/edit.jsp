<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改家庭成员信息</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function edit() {
		$('#editForm').submit();
	}
	
	function confirm() {
		$.messager.confirm('确认申报项', '确认申报该选项', function(result){
			if (result){
				window.location.href='<%=request.getContextPath()%>/app/sldb/personSab/confirm.action?ids=${personSab.id}';
			}
		});
		return false;
	}
	
	$(function() {
		$('#name').focus();
		
		$('#type').combobox({
			value : '${personSab.type}',
			onHidePanel : function() {
				$("#combo_type").focus();
			},
			width : 256
		});
		
		$('#gender').combobox({
			value : '${personSab.gender}',
			onHidePanel : function() {
				$("#combo_gender").focus();
			},
			width : 256
		});
		
		$('#hukou').combobox({
			value : '${personSab.hukou}',
			onHidePanel : function() {
				$("#combo_hukou").focus();
			},
			width : 256
		});
		
		$('#home').combobox({
			value : '${personSab.home}',
			onHidePanel : function() {
				$("#combo_home").focus();
			},
			width : 256
		});
		
		$('#marry').combobox({
			value : '${personSab.marry}',
			onHidePanel : function() {
				$("#combo_marry").focus();
			},
			width : 256
		});
		
		$('#workable').combobox({
			value : '${personSab.workable}',
			onHidePanel : function() {
				$("#combo_workable").focus();
			},
			width : 256
		});
		
		$('#idType').combobox({
			value : '${personSab.idType}',
			onHidePanel : function() {
				$("#combo_idType").focus();
			},
			width : 256
		});
		
		$('#first').combobox({
			value : '${personSab.first}',
			onHidePanel : function() {
				$("#combo_first").focus();
			},
			width : 256
		});
		
		$('#ill').combobox({
			value : '${personSab.ill}',
			onHidePanel : function() {
				$("#combo_ill").focus();
			},
			width : 256
		});
		
		$('#deformity').combobox({
			value : '${personSab.deformity}',
			onHidePanel : function() {
				$("#combo_deformity").focus();
			},
			width : 256
		});
		
		$('#deformityLevel').combobox({
			value : '${personSab.deformityLevel}',
			onHidePanel : function() {
				$("#combo_deformityLevel").focus();
			},
			width : 256
		});
		
		$('#companyType').combobox({
			value : '${personSab.companyType}',
			onHidePanel : function() {
				$("#combo_companyType").focus();
			},
			width : 256
		});
		
		$('#trade').combobox({
			value : '${personSab.trade}',
			onHidePanel : function() {
				$("#combo_trade").focus();
			},
			width : 256
		});
		
		$('#insurance').combobox({
			value : '${personSab.insurance}',
			onHidePanel : function() {
				$("#combo_insurance").focus();
			},
			width : 256
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改家庭成员信息"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/sldb/person/sub/update.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>类型:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.personSab.type" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_typeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>姓名:</td>
					<td><input id="name" name="name" type="text" value="${personSab.name}"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>性别:</td>
					<td><select id="gender" class="easyui-combobox"
								name="gender" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=gender" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_genderTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>身份证号:</td>
					<td><input id="identify" name="identify" type="text" value="${personSab.identify}"></input></td>
					<td><div id="identifyTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>与户主关系:</td>
					<td><input id="personRelation" name="personRelation" type="text" value="${personSab.personRelation}"></input></td>
					<td><div id="personRelationTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>民族:</td>
					<td><input id="race" name="race" type="text" value="${personSab.race}"></input></td>
					<td><div id="raceTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>户口类别:</td>
					<td><select id="hukou" class="easyui-combobox"
								name="hukou" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.hukou" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_hukouTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>婚姻状况:</td>
					<td><select id="marry" class="easyui-combobox"
								name="marry" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.marry" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_marryTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>劳动能力:</td>
					<td><select id="workable" class="easyui-combobox"
								name="workable" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.workable" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_workableTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>身份类别:</td>
					<td><select id="idType" class="easyui-combobox"
								name="idType" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.idType" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_idTypeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>是否优抚对象:</td>
					<td><select id="first" class="easyui-combobox"
								name="first" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=easyboolean" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_firstTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>患病种类:</td>
					<td><select id="ill" class="easyui-combobox"
								name="ill" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.ill" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_illTip"></div></td>
				</tr>				
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>残疾类型:</td>
					<td><select id="deformity" class="easyui-combobox"
								name="deformity" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.deformity" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_deformityTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>残疾等级:</td>
					<td><select id="deformityLevel" class="easyui-combobox"
								name="deformityLevel" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.deformityLevel" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_deformityLevelTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>企业类型:</td>
					<td><select id="companyType" class="easyui-combobox"
								name="companyType" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.companyType" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_companyTypeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>所属行业:</td>
					<td><select id="trade" class="easyui-combobox"
								name="trade" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.trade" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_tradeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>参加保险类别:</td>
					<td><select id="insurance" class="easyui-combobox"
								name="insurance" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.insurance" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="combo_insuranceTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>工作单位:</td>
					<td><input id="company" name="company" type="text" value="${personSab.company}"></input></td>
					<td><div id="companyTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>联系方式:</td>
					<td><input id="contact" name="contact" type="text" value="${personSab.contact}"></input></td>
					<td><div id="contactTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>所属街道:</td>
					<td><input id="street" name="street" type="text" value="${personSab.street}"></input></td>
					<td><div id="streetTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>地址:</td>
					<td><input id="address" name="address" type="text" value="${personSab.address}"></input></td>
					<td><div id="addressTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">备注:</td>
					<td><textarea id="desc" name="desc" rows="5" cols="50">${personSab.desc}</textarea></td>
					<td><div id="descTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" class="easyui-linkbutton" iconCls="icon-edit"
								onclick="edit()">确定</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a> 
						</div>
					</td>
				</tr>
			</table>
			<input id="id" name="id" type="hidden" value="${personSab.id}"></input>
			<input id="createTime" name="createTime" type="hidden" value="${personSab.createTime}"></input>
			<input id="createrName" name="createrName" type="hidden" value="${personSab.createrName}"></input>
			<input id="createrDepartment" name="createrDepartment"  type="hidden" value="${personSab.createrDepartment}"></input>
			<input id="creater" name="creater" type="hidden" value="${personSab.creater}"></input>
			<input id="state" name="state" type="hidden" value="${personSab.state}"></input>
			<input id="pid" name="pid" type="hidden" value="<%=request.getParameter("pid")%>">
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});

		$("#name").formValidator({
			onfocus : "姓名不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#race").formValidator({
			onfocus : "名称不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#comany").formValidator({
			onfocus : "不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#contact").formValidator({
			onfocus : "不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#street").formValidator({
			onfocus : "不能为空,不超过100个字符！"
		}).inputValidator({
			min : 1,
			max : 100,
			onerror : "不超过100字符"
		});
		
		$("#company").formValidator({
			onfocus : "不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#homeSum").formValidator({
			onfocus : "不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "不超过50字符"
		});
		
		$("#address").formValidator({
			onfocus : "不能为空,不超过300个字符！"
		}).inputValidator({
			min : 1,
			max : 300,
			onerror : "不超过300字符"
		});
		
		$("#desc").formValidator({
			onfocus : "不能为空,不超过400个字符！"
		}).inputValidator({
			min : 0,
			max : 400,
			onerror : "不超过400字符"
		});
		
		$("#identify").formValidator({
			onfocus : "身份证不能为空,不超过18个字符！"
		}).regexValidator({
			regexp : "idcard"
		}).inputValidator({
			min : 1,
			max : 18,
			onerror : "宽度不超过18字符"
		});
		
		$.data($("#gender")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_gender');
		$("#combo_gender").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#hukou")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_hukou');
		$("#combo_hukou").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#home")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_home');
		$("#combo_home").formValidator({
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#marry")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_marry');
		$("#combo_marry").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#workable")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_workable');
		$("#combo_workable").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#idType")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_idType');
		$("#combo_idType").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#first")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_first');
		$("#combo_first").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#ill")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_ill');
		$("#combo_ill").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#deformity")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_deformity');
		$("#combo_deformity").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#deformityLevel")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_deformityLevel');
		$("#combo_deformityLevel").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#companyType")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_companyType');
		$("#combo_companyType").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#trade")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_trade');
		$("#combo_trade").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
		
		$.data($("#insurance")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_insurance');
		$("#combo_insurance").formValidator({
		
			empty:false,
			onfocus :'请输入内容'
		}).inputValidator({
			min:1,
			max:50,
			onerror : "请选择内容"
		});
	});
</script>
</html>