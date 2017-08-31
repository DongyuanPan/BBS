<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html"%>
<%@ taglib uri="struts-bean" prefix="bean"%>
<%@ taglib uri="struts-logic" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改公告</title>
</head>
<body>
<center>
		<br>
		<table border="0" width="95%" height="250" cellspacing="0"
			cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey"
			bordercolordark="white" rules="all">
			<html:form action="needLogin/admin/modifyBroadcast.do"
				focus="broadcastMessage">
				<input type="hidden" name="method" value="modifyBroadcast">
				<input type="hidden" name="validate" value="yes">
				<tr>
					<td width="80%" bgcolor="#F9F9F9" align="center" valign="top">
						<table border="1" width="100%" cellspacing="0" cellpadding="0"
							bordercolor="#E3E3E3" bordercolorlight="#E3E3E3"
							bordercolordark="white" rules="rows">
							<tr height="30">
								<td align="center">公告内容</td><html:hidden property="broadcastId"/>
								<td align="center"><%@ include file="font.jsp"%></td>
							</tr>
							<tr height="30" bgcolor="#F9F9F9">
								<td colspan="2" align="right" valign="bottom"><%@ include
										file="count.jsp"%></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><html:textarea
										property="broadcastMessage" rows="15" cols="79"
										styleId="content" 
										onkeydown="check(content,ContentUse,ContentRem,233)"
										onkeyup="check(content,ContentUse,ContentRem,233)"
										onchange="check(content,ContentUse,ContentRem,233)" /></td>
							</tr>
							<tr height="30" align="center">
								<td colspan="2"><html:submit value="发布公告" /> <html:reset
										value="重新填写" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</html:form>
		</table>

	</center>
</body>
</html>