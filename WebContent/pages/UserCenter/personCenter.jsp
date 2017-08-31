<%@ page contentType="text/html; charset=gb2312"%>
<%@ page session="true"%>
<%@ taglib uri="struts-html" prefix="html"%>
<%@ taglib uri="struts-bean" prefix="bean"%>
<%@ taglib uri="struts-logic" prefix="logic"%>


<html>
<head>
<title>������Ϣ</title>
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
					<td colspan="5" style="text-indent: 20">�� ������Ϣ</td>
				</tr>
				<tr height="50">
					<td align="right">�û�ͷ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><img src="images/face/user/${sessionScope.backUser.userFace}"
						style="border: 1 solid; border-color: #E0E0E0"></td>
				</tr>
				<tr height="45">
					<td align="right" width="35%">�� �� 
						����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userName}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userName" /></td>
				</tr>
				
				<tr height="45">
					<td align="right">�Ա�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userSex}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userSex" /></td>
				</tr>
				<tr height="50">
				<td align="right">�û�Ȩ�ޣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><logic:equal value="0" name="backUser"
						property="userAble">��ͨ�û�</logic:equal> <logic:equal value="1"
						name="backUser" property="userAble">����</logic:equal> <logic:equal
						value="2" name="backUser" property="userAble">����Ա</logic:equal>
				</td>
			</tr>
				<tr height="45">
					<td align="right">��ϵ�绰��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userPhone}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userPhone" /></td>
				</tr>

				<tr height="45">
					<td align="right">E-mail��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userEmail}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userEmail" /></td>
				</tr>
				
				<tr height="45">
					<td align="right">QQ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="left" width="35%"> ${sessionScope.backUser.userOICQ}</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><html:errors property="userOICQ" /></td>
				</tr>
				
				<tr height="45">
					<td align="right">���᣺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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