<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>社会化救助信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '社会化救助信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/society/listSocietyByTotal.action',
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}, {
					field : 'id',
					title : '标识',
					width : 40,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'numberNO',
					title : '申报编号',
					width : 150,
					sortable : true
				}, {
					field : 'name',
					title : '姓名',
					width : 70,
					sortable : true
				},{
					field : 'identify',
					title : '身份证号',
					width : 120,
					sortable : true
				}, {
					field : 'createrDepartment',
					title : '乡镇街',
					width : 150,
					sortable : true
				}, {
					field : 'accountType',
					title : '户口类型',
					width : 70,
					sortable : true
				},{
					field : 'money',
					title : '救助金额',
					width : 70,
					sortable : true
				},{
					field : 'familyClass',
					title : '家庭类别',
					width : 150,
					sortable : true
				}, {
					field : 'createTime',
					title : '审批时间',
					width : 120,
					sortable : true
				},{
					field : 'state',
					title : '状态',
					width : 120,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="viewVO(\'' + rec.id + '\');">详情</a>' +
						'</span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [{
					id : 'btnprint',
					text : '导出Excel',
					iconCls : 'icon-redo',
					handler : function() {
						excelVO();
						return false;//解决IE6的不跳转的bug
					}
				}]
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					identify : $('#identify').val(),
					name : $('#name').val(),
					beginTime : $('#beginTime').datebox('getValue'),
					endTime : $('#endTime').datebox('getValue'),
					createrDepartment : $('#createrDepartment').combogrid('getValue'),
					accountType : $('#accountType').combogrid('getValue'),
					familyClass : $('#familyClass').combogrid('getValue'),
					money : $('#money').val(),
					state : $('#state').combogrid('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/society/delete.action?ids=' + id;
				}
			});
			return false;
		}
		function viewVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/society/query2.action?id='+ id+'&view=ok';
			return false;
		}
		
		function confirmVO(id){
			$.messager.confirm('确认审核', '确认审核该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/society/audit/pass.jsp?ids=' + id;
				}
			});
			return false;
		}
		function refuseVO(id){
			$.messager.confirm('确认驳回', '确认驳回该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/society/audit/refuse.jsp?ids=' + id;
				}
			});
			return false;
		}
		
		function applyVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/society/applySociety.action?id='+ id+'&type=1';
			return false;
		}
		function endVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/temp/endTemp.action?id=' + id +'&type=2';
			return false;
		}
		
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/society/query.action?id='+ id;
			return false;
		}
		
		function excelVO() {
			$('#queryForm').attr('action','<%=request.getContextPath()%>/app/sldb/society/listTempByTotalExcel.action');
			$('#queryForm').submit();
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<tr align="right">
					<td>开始时间:</td>
					<td><input id="beginTime" name="beginTime" type="text" class="easyui-datebox"></input></td>
					<td>结束时间:</td>
					<td><input id="endTime" name="endTime" type="text" class="easyui-datebox"></input></td>
				</tr><tr align="right">	
					<td>乡镇街(或全市):</td>
					<td><select id="createrDepartment" class="easyui-combobox"
								name="createrDepartment" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.address" valueField="id"
								textField="text" editable="false"></select></td>
					<td>临时救助类型:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.tmp.type" valueField="id"
								textField="text" editable="false"></select></td>
					<td>姓名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td>身份证:</td>
					<td><input id="identify" name="identify" type="text"></input></td>
				</tr><tr align="right">
					<td>户口类型:</td>
					<td><select id="accountType" class="easyui-combobox"
								name="accountType" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.hukou" valueField="id"
								textField="text" editable="false"></select></td>
					<td>家庭类别:</td>
					<td><select id="familyClass" class="easyui-combobox"
								name="familyClass" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.home" valueField="id"
								textField="text" editable="false"></select></td>
					<%-- <td>审批方式:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.tmp.type" valueField="id"
								textField="text" editable="false"></select></td> --%>
					<td>金额:</td>
					<td><input id="money" name="money" type="text"></input></td>
					<td>状态:</td>
					<td><select id="state" class="easyui-combobox"
								name="state" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.society.state" valueField="id"
								textField="text" editable="true"></select></td>
				</tr>
			</table>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="queryVO();" 
					iconCls="icon-ok">确定</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
	<table id="queryTable"></table>
</body>
</html>
