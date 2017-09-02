<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html"%>
<%@ taglib uri="struts-bean" prefix="bean"%>
<%@ taglib uri="struts-logic" prefix="logic"%>

<html>
<head>
<title>列表查看用户</title>
</head>
<body>
	<center>
		<br>
		<html:form action="needLogin/admin/getUserIP.do">
			<input type="hidden" name="method" value="getIPList">
			<input type="hidden" name="type" value="show">
		</html:form>

		<table border="1" width="580" cellspacing="0" cellpadding="0"
			bordercolor="#E3E3E3" bordercolorlight="#E3E3E3"
			bordercolordark="white" rules="rows">
			<tr height="29">
				<td background="images/admin/backLT.png" colspan="6"
					style="text-indent: 5"><b><font color="white">■
							查看禁止的IP</font></b></td>
			</tr>
			<tr height="30" bgcolor="#F0F0F0">
				<td width="50%" align="center">禁止IP</td>
				<td width="50%" align="center" colspan="3">操作</td>
			</tr>
			<logic:notPresent name="backIPList">
				<tr height="80" align="center">
					<td colspan=6"><li>没有用户IP可显示！</li></td>
				</tr>
			</logic:notPresent>
			<logic:present name="backIPList">
				<logic:empty name="backIPList">
					<tr height="80" align="center">
						<td colspan="6"><li>没有用户IP可显示！</li></td>
					</tr>
				</logic:empty>
				<logic:notEmpty name="backIPList">
					<tr>
						<td colspan="6">
							<table border="1" width="100%" cellspacing="0" cellpadding="0"
								bordercolor="#F0F0F0" bordercolorlight="#F0F0F0"
								bordercolordark="white" rules="rows">
								<logic:iterate id="backIPSingle" name="backIPList"
									indexId="ind">
									<tr height="35" bgcolor="#FBFBFB">
										<td width="50%" align="center">${backIPSingle.forbiddenIP}</td>
										
										<td align="center"><a
											href="needLogin/admin/deleteIP.do?method=deleteIP&IP=${backIPSingle.forbiddenIP}"
											onclick="javaScript:return confirm('确认要删除该信息?')">×删除</a></td>
									</tr>
								</logic:iterate>
							</table>
						</td>
					</tr>
				</logic:notEmpty>
			</logic:present>
			<tr height="19"
				style="background-image: url('images/admin/backLE.png')">
				<td colspan="6"></td>
			</tr>
		</table>
	</center>
</body>
</html>