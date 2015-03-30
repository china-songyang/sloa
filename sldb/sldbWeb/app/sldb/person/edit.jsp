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
	input {
		height:30px;
		border:none;
	}
</style>
<script type="text/javascript">
	function submit() {
		$('#form1').submit();
	}
</script>
</head>
<body>
	<form id="form1" runat="server" action="<%=request.getContextPath()%>/app/sldb/society/update.action" method="post">
		<input type="hidden" id="id" name="id" value="${society.id }" />
		<input id="createTime" name="createTime" type="hidden" value="${society.createTime }"></input>
			<input id="creater" name="creater" type="hidden" value="${society.creater }"></input>
			<input id="createrName" name="createrName" type="hidden" value="${society.createrName }"></input>
			<input id="createrDepartment" name="createrDepartment"  type="hidden" value="${society.createrDepartment }"></input>
			<input id="state" name="state" type="hidden" value="${society.state }"></input>
			<input id="type" name="type" type="hidden" value="${society.type }"></input>
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
		<!-- <a href="#" onclick="Button1_onclick()" class="easyui-linkbutton" id="Button1">读   卡</a> -->
		<a href="#" onclick="submit()" class="easyui-linkbutton" id="Button1">提   交</a>
		<a href="#" onclick="ClearForm()" class="easyui-linkbutton" id="Button2">清   空</a>
		<p>
		<table border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
		  <col width="93" />
		  <col width="72" span="3" />
		  <col width="93" />
		  <col width="72" span="2" />
		  <col width="95" />
		  <tr>
		    <td colspan="9"><div align="center" class="STYLE1"><h2>双辽市城乡居民临时救助申请审批表</h2></div></td>
		  </tr>
		  <tr height="26">
		  	 <td rowspan="6"><div align="center"><span class="STYLE4">户<br>主<br>信<br>息</span></div></td>
		    <td><div align="center"><span class="STYLE4">姓名</span></div></td>
		    <td><div align="center"><span class="STYLE4"><input id="name" type="text" name="name" value="${society.name }" /></span></div></td>
		    <td><div align="center"><span class="STYLE4">性别</span></div></td>
		    <td><div align="center"><span class="STYLE4"><input id="sex" type="text" name="sex" value="${society.sex }" /></span></div></td>
		    <td><div align="center"><span class="STYLE4">身份证号码</span></div></td>
		    <td colspan="2"><div align="center"><span class="STYLE4"><input id="identify" type="text" name="identify" value="${society.identify }" /></span></div></td>
		    <td rowspan="3" colspan="2"><div align="center"><span class="STYLE4"><img src="data:image/jpg;base64,${society.photo }" style="width: 91px; height: 108px" id="picture" name="picture" /></span></div></td>
		  </tr>
		   <tr height="26">
		    <td><div align="center"><span class="STYLE4">婚姻状况</span></div></td>
		    <td><div align="center"><span class="STYLE4"><input id="marry" type="text" name="marry" value="${society.marry }" /></span></div></td>
		    <td><div align="center"><span class="STYLE4">患病名称</span></div></td>
		    <td><div align="center"><span class="STYLE4"><input id="ill" type="text" name="ill" value="${society.ill }" /></span></div></td>
		    <td><div align="center"><span class="STYLE4">残疾类别<br>和等级</span></div></td>
		    <td colspan="2"><div align="center"><span class="STYLE4"><input id="disability" type="text" name="disability" value="${society.disability }" /></span></div></td>
		  </tr>
		  <tr height="26">
		    <td><div align="center"><span class="STYLE4">家庭人口</span></div></td>
		    <td><div align="center"><span class="STYLE4"><input id="family" type="text" name="family" value="${society.family }" /></span></div></td>
		    <td colspan="2"><div align="center"><span class="STYLE4">劳动能力</span></div></td>
		    <td><div align="center"><span class="STYLE4"><input id="labor" type="text" name="labor" value="${society.labor }" /></span></div></td>
		    <td width="8%"><div align="center"><span class="STYLE4">家庭类别</span></div></td>
		    <td><div align="center"><span class="STYLE4"><input id="familyClass" type="text" name="familyClass" value="${society.familyClass }" /></span></div></td>
		  </tr>
		  <tr height="26">
		    <td><div align="center"><span class="STYLE4">家庭总收入<br>（元/年）</span></div></td>
		    <td><div align="center"><span class="STYLE4"><input id="total" type="text" name="total" value="${society.total }" /></span></div></td>
		    <td><div align="center"><span class="STYLE4">收入来源</span></div></td>
		    <td colspan="5"><div align="center"><span class="STYLE4"><input id="income" type="text" name="income" value="${society.income }" /></span></div></td>
		  </tr>
		   <tr height="26">
		    <td><div align="center"><span class="STYLE4">家庭总支出<br>（元/年）</span></div></td>
		    <td><div align="center"><span class="STYLE4"><input id="spending" type="text" name="spending" value="${society.spending }" /></span></div></td>
		    <td><div align="center"><span class="STYLE4">支出用途</span></div></td>
		    <td colspan="5"><div align="center"><span class="STYLE4"><input id="purpose" type="text" name="purpose" value="${society.purpose }" /></span></div></td>
		  </tr>
		  <tr height="26">
		    <td><div align="center"><span class="STYLE4">户口类型</span></div></td>
		    <td><div align="center"><span class="STYLE4"><input id="accountType" type="text" name="accountType" value="${society.accountType }" /></span></div></td>
		    <td><div align="center"><span class="STYLE4">家庭住址</span></div></td>
		    <td colspan="5"><div align="center"><span class="STYLE4"><input id="address" type="text" name="address" value="${society.address }" /></span></div></td>
		  </tr>
		  <tr height="26">
		    <td rowspan=7 ><div align="center"><span class="STYLE4">同<br>住<br>其<br>他<br>成<br>员<br>情<br>况</span></div></td>
		    <td ><div align="center"><span class="STYLE4">姓名</span></div></td>
		    <td ><div align="center"><span class="STYLE4">性别</span></div></td>
		    <td ><div align="center"><span class="STYLE4">身份证号</span></div></td>
		 	<td ><div align="center"><span class="STYLE4">与户主关系</span></div></td>
		    <td ><div align="center"><span class="STYLE4">婚姻状况</span></div></td>
		    <td style="width:50px;"><div align="center"><span class="STYLE4">患病名称</span></div></td>
		    <td ><div align="center"><span class="STYLE4">残疾类别和等级</span></div></td>
		    <td ><div align="center"><span class="STYLE4">劳动能力</span></div></td>
		  </tr>
		   <tr height="26">
		    <td ><div align="center"><span class="STYLE4"><input id="c_name" type="text" name="c_name" value="${subs[0].name }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_sex" type="text" name="c_sex" value="${subs[0].sex }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_identify" type="text" name="c_identify" value="${subs[0].identify }" /></span></div></td>
		 	<td ><div align="center"><span class="STYLE4"><input id="c_relation" type="text" name="c_relation" value="${subs[0].relation }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_marry" type="text" name="c_marry" value="${subs[0].marry }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_ill" type="text" name="c_ill" value="${subs[0].ill }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_disability" type="text" name="c_disability" value="${subs[0].disability }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_labor" type="text" name="c_labor" value="${subs[0].labor }" /></span></div></td>
		  </tr>
		   <tr height="26">
		      <td ><div align="center"><span class="STYLE4"><input id="c_name" type="text" name="c_name" value="${subs[1].name }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_sex" type="text" name="c_sex" value="${subs[1].sex }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_identify" type="text" name="c_identify" value="${subs[1].identify }" /></span></div></td>
		 	<td ><div align="center"><span class="STYLE4"><input id="c_relation" type="text" name="c_relation" value="${subs[1].relation }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_marry" type="text" name="c_marry" value="${subs[1].marry }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_ill" type="text" name="c_ill" value="${subs[1].ill }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_disability" type="text" name="c_disability" value="${subs[1].disability }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_labor" type="text" name="c_labor" value="${subs[1].labor }" /></span></div></td>
		  </tr>
		   <tr height="26">
		      <td ><div align="center"><span class="STYLE4"><input id="c_name" type="text" name="c_name" value="${subs[2].name }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_sex" type="text" name="c_sex" value="${subs[2].sex }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_identify" type="text" name="c_identify" value="${subs[2].identify }" /></span></div></td>
		 	<td ><div align="center"><span class="STYLE4"><input id="c_relation" type="text" name="c_relation" value="${subs[2].relation }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_marry" type="text" name="c_marry" value="${subs[2].marry }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_ill" type="text" name="c_ill" value="${subs[2].ill }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_disability" type="text" name="c_disability" value="${subs[2].disability }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_labor" type="text" name="c_labor" value="${subs[2].labor }" /></span></div></td>
		  </tr>
		   <tr height="26">
		      <td ><div align="center"><span class="STYLE4"><input id="c_name" type="text" name="c_name" value="${subs[3].name }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_sex" type="text" name="c_sex" value="${subs[3].sex }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_identify" type="text" name="c_identify" value="${subs[3].identify }" /></span></div></td>
		 	<td ><div align="center"><span class="STYLE4"><input id="c_relation" type="text" name="c_relation" value="${subs[3].relation }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_marry" type="text" name="c_marry" value="${subs[3].marry }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_ill" type="text" name="c_ill" value="${subs[3].ill }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_disability" type="text" name="c_disability" value="${subs[3].disability }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_labor" type="text" name="c_labor" value="${subs[3].labor }" /></span></div></td>
		  </tr>
		   <tr height="26">
		      <td ><div align="center"><span class="STYLE4"><input id="c_name" type="text" name="c_name" value="${subs[4].name }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_sex" type="text" name="c_sex" value="${subs[4].sex }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_identify" type="text" name="c_identify" value="${subs[4].identify }" /></span></div></td>
		 	<td ><div align="center"><span class="STYLE4"><input id="c_relation" type="text" name="c_relation" value="${subs[4].relation }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_marry" type="text" name="c_marry" value="${subs[4].marry }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_ill" type="text" name="c_ill" value="${subs[4].ill }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_disability" type="text" name="c_disability" value="${subs[4].disability }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_labor" type="text" name="c_labor" value="${subs[4].labor }" /></span></div></td>
		  </tr>
		   <tr height="26">
		      <td ><div align="center"><span class="STYLE4"><input id="c_name" type="text" name="c_name" value="${subs[5].name }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_sex" type="text" name="c_sex" value="${subs[5].sex }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_identify" type="text" name="c_identify" value="${subs[5].identify }" /></span></div></td>
		 	<td ><div align="center"><span class="STYLE4"><input id="c_relation" type="text" name="c_relation" value="${subs[5].relation }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_marry" type="text" name="c_marry" value="${subs[5].marry }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_ill" type="text" name="c_ill" value="${subs[5].ill }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_disability" type="text" name="c_disability" value="${subs[5].disability }" /></span></div></td>
		    <td ><div align="center"><span class="STYLE4"><input id="c_labor" type="text" name="c_labor" value="${subs[5].labor }" /></span></div></td>
		  </tr>
		  <tr>
		    <td><div align="center"><span class="STYLE4">申请<br>承诺</span></div></td>
		  	<td colspan="9" height="90"><div align="left"><span class="STYLE4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本人因家庭生活困难，特申请临时救助。本人承诺在本表中所填列的全部内容及所提供的全部证明材料均真实、可靠、绝无虚假、欺骗和隐瞒。如经管理审批机关及其办事机构核查存在不实之外，愿承担一切后果并接受一切处罚。</span></div><br>
		  	<div style="margin-left:450px;">申请人（签字并按手印）： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;年  &nbsp;&nbsp;  &nbsp;&nbsp;月   &nbsp;&nbsp;&nbsp;&nbsp; 日</div></td>
		  </tr>
		 <tr>
		    <td><div align="center"><span class="STYLE4">申请<br>理由</span></div></td>
		  	<td colspan="9" height="160"><div align="center"><span class="STYLE4"><textarea id="cause" name="cause" style="overflow-x:hidden;overflow-y:hidden;border:none"/> ${society.cause }</textarea>　</span></div></td>
		  </tr>
		  <tr>
	    	<td rowspan=2><div align="center"><span class="STYLE4">审查<br>审批<br>意见</span></div></td>
		    <td colspan="2" height="235"><div align="center"><span class="STYLE4">乡镇（街）初审意见</span></div><br/><br/>
			   	 <div style="margin-left:30px;">
				   	 调查人：<br/><br/>
				               助理：<br/><br/>
				              主管领导：<br/><br/>
			    </div>
		  	<div style="margin-left:150px;">年 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;日</div>
		  	</td>
		  	<td colspan="3" height="235"><div align="center"><span class="STYLE4">社救中心复查及审批意见：</span></div><br/><br/>
			   	 <div style="margin-left:30px;">
				   	 复查人：<br/><br/><br/><br/>
				              审批人：<br/><br/>
			    </div>
		  	<div style="margin-left:150px;">年 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;日</div>
		  	</td>
		  	
		  	<td colspan="3" height="235"><div align="center"><span class="STYLE4">民政局主管领导审批意见：</span></div><br/><br/>
			   <br/><br/><br/><br/><br/><br/>
		  	<div style="margin-left:150px;">年 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;日</div>
		  	</td>
		  	
		 </tr>
	 	<tr height="40">
	 		<td colspan=8><div align="left"><span class="STYLE4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;救助金额:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="money" type="text" name="money" value="${society. money}" /></span></div></td>
	 	</tr>
  </table>
  </center>
  	<input type="hidden" id="photo" name="photo" value="${society. photo}"/>
 </form>
</body>
</html>
