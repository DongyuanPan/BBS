<%@ page contentType="text/html; charset=gb2312"%>
<%@ page session="true"%>
<%@ taglib uri="struts-html" prefix="html"%>
<%@ taglib uri="struts-bean" prefix="bean"%>
<%@ taglib uri="struts-logic" prefix="logic"%>


<html>
<head>
<title>个人信息</title>
</head>
<body>
	<center>
		<table border="1" width="80%" bgcolor="#F9F9F9" cellspacing="0"
			cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey"
			bordercolordark="white" rules="none" style="margin-top: 5">
			<html:form action="user/personCen.do">
				<input type="hidden" name="method" value="personCenter">
				<input type="hidden" name="validate" value="yes">
				<tr height="80">
					<td colspan="5" style="text-indent: 20">■ 个人信息</td>
				</tr>
				
				<tr height="45">
					<td align="right" width="35%">用 户 
						名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userName}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userName" /></td>
				</tr>
				
				<tr height="45">
					<td align="right">性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userSex}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userSex" /></td>
				</tr>
				
				<tr height="45">
					<td align="right">联系电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userPhone}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userPhone" /></td>
				</tr>

				<tr height="45">
					<td align="right">E-mail：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userEmail}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userEmail" /></td>
				</tr>
				
				<tr height="45">
					<td align="right">QQ：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userOICQ}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userOICQ" /></td>
				</tr>
				
				<tr height="45">
					<td align="right">籍贯：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userFrom}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userFrom" /></td>
				</tr>				

			</html:form>
		</table>
		<br>
	</center>
</body>
</html>