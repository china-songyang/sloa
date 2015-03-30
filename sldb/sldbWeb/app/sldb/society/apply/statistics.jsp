<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.saturn.sldb.Society" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>当前申报人员信息统计</title>
</head>
<%
	String cardNo = request.getParameter("cardNo");
	Society temp = new Society();
	temp.setIdentify(cardNo);
	//temp.setIdentify("220323198811011618");
	List<Society> lists = Society.getAllPersonByIdcard(temp.getIdentify());
	String name = "";
	String idCard = "";
	int counts = 0;
	int yearcounts = 0;
	int year = 0;
	double money = 0;
	counts = lists.size();
	for(Society list:lists){
		name = list.getName();
		idCard = list.getIdentify();
		if(list.getMoney()==null || "".equals(list.getMoney())){
			list.setMoney("0");
		}
		money += Double.parseDouble(list.getMoney());
		
		Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
		year = c.get(Calendar.YEAR);
		if(String.valueOf(year).equals(list.getCreateTime().substring(0, 4))){
			yearcounts++;
		}
	}
%>
<body>
	<table>
		<tr>
			<td>姓名：</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>身份证号：</td>
			<td><%=idCard %></td>
		</tr>
		<tr>
			<td>申报年份：</td>
			<td><%=year %>年</td>
		</tr>
		<tr>
			<td>申报次数：</td>
			<td><%=yearcounts %>次</td>
		</tr>
		<tr>
			<td>申报总金额：</td>
			<td><%=money %>元</td>
		</tr>
	</table>
</body>
</html>