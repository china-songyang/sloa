<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>一般救助审核</title>
	<%@ include file="/app/includes/header.jsp"%>
	<script type="text/javascript">
	function baofei() {
		$('#baofei').submit();
	}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="审批一般救助理由"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">
		
		<form id="baofei" name="baofei" method="post" action="<%=request.getContextPath()%>/app/sldb/shenpiManage/baofeiShenpiManage.action?type=2">
		<input type="hidden" id="id" name="id" value="<%=request.getParameter("ids")%>">
			<table>
				<tr align="right">
					<td>原因:</td>
					<td><textarea id="note" name="note" style="width:500px;height:100px;"></textarea></td>
				</tr>
			</table>
			<div style="padding: 40px;" >
				<a href="#" class="easyui-linkbutton" onclick="baofei();" 
					iconCls="icon-ok">报废</a>
				<a href="javascript:history.back(-1)" class="easyui-linkbutton"" 
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
</body>
</html>
