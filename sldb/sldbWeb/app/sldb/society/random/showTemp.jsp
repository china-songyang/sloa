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
				title : '社会化救助抽查信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/society/listSocietyTemp.action',
				queryParams : {
					state : '待抽查'
				},
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {
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
					field : 'cxTime',
					title : '抽取时间',
					width : 120,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="14" height="14" border="0" /></a>' +
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a>' +
						'&nbsp&nbsp<a href="#" onclick="viewVO(\'' + rec.id + '\');">预览</a>' +
						'</span>';
					}
				} ] ],
				pagination : false,
				rownumbers : true,
				toolbar : [{
					id : 'btnedit',
					text : '取消',
					iconCls : 'icon-edit',
					handler : function() {
						var rows = $('#queryTable').datagrid('getRows');
						if (rows.length == 0) {
							$.messager.alert('提示','无记录','info');
							return;
						} else {
							var time = rows[0].cxTime;
							window.location.href='<%=request.getContextPath()%>/app/sldb/society/resetListSocietyTemp.action?time='+ time;
						}
						return false;
					}
				}, 	{
					id : 'btnItem',
					text : '确定',
					iconCls : 'icon-ok',
					handler : function() {
						var rows = $('#queryTable').datagrid('getRows');
						if (rows.length == 0) {
							$.messager.alert('提示','无记录','info');
							return;
						} else {
							var time = rows[0].cxTime;
							window.location.href='<%=request.getContextPath()%>/app/sldb/society/okListSocietyTemp.action?time='+ time;
						}
						return false;
					}
				}]
			});
		});
		
	</script>
</head>
<body>
	<table id="queryTable"></table>
</body>
</html>
