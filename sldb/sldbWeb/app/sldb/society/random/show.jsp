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
				url : '<%=request.getContextPath()%>/app/sldb/society/listSociety.action',
				queryParams : {
					state : '待抽查'
				},
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
					field : 'name',
					title : '姓名',
					width : 100,
					sortable : true
				},{
					field : 'identify',
					title : '身份证号',
					width : 120,
					sortable : true
				}, {
					field : 'sex',
					title : '性别',
					width : 50,
					sortable : true
				},{
					field : 'money',
					title : '救助金额',
					width : 70,
					sortable : true
				},{
					field : 'marry',
					title : '婚姻状况',
					width : 70,
					sortable : true
				}, {
					field : 'accountType',
					title : '户口类型',
					width : 80,
					sortable : true
				}, {
					field : 'creater',
					title : '创建人',
					width : 80,
					sortable : true
				}, {
					field : 'createrName',
					title : '创建人',
					width : 80,
					sortable : true
				},{
					field : 'createrDepartment',
					title : '创建单位',
					width : 80,
					sortable : true
				},{
					field : 'state',
					title : '状态',
					width : 70,
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 120,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="viewVO(\'' + rec.id + '\');">预览</a>' +
						'</span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [{
					id : 'btnedit',
					text : '查看',
					iconCls : 'icon-edit',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择修改项','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						window.location.href='<%=request.getContextPath()%>/app/sldb/society/query2.action?id='+ rows[0].id +'&view=ok';
						return false;
					}
				}, 	{
					id : 'btnItem',
					text : '抽查',
					iconCls : 'icon-ok',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择操作项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id);
						}

						confirmVO(ids.join('__'));
					}
				}, 	{
					id : 'btnItem',
					text : '驳回',
					iconCls : 'icon-undo',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择操作项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id);
						}

						refuseVO(ids.join('__'));
					}
				}, 	{
					id : 'btnItem',
					text : '随机抽查',
					iconCls : 'icon-redo',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/sldb/society/random/showTemp.jsp';
						return false;
					}
				}]
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					identify : $('#identify').val(),
					name : $('#name').val(),
					state : $('#state').val()
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
			$.messager.confirm('确认抽查', '确认抽查该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/society/random/pass.jsp?ids=' + id;
				}
			});
			return false;
		}
		
		function refuseVO(id){
			$.messager.confirm('确认驳回', '确认驳回该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/society/audit/refuse.jsp?ids=' + id +'&type=4';
				}
			});
			return false;
		}
		
		function randomVO(id){
			$.messager.confirm('确认抽查', '随机抽查操作不可重复,确认随机抽查？', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/society/random/random.jsp?ids=' + id;
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
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<tr align="right">
					<%-- <td>保障类型:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.tmp.type" valueField="id"
								textField="text" editable="false"></select></td> --%>
					<td>申请人姓名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td>身份证:</td>
					<td><input id="identify" name="identify" type="text"></input></td>
					<td><input id="state" name="state" type="hidden" value="待抽查"></input></td>
				</tr><tr>
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
