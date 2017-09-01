<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ taglib uri="struts-html" prefix="html"%>
<%@ taglib uri="struts-bean" prefix="bean"%>
<%@ taglib uri="struts-logic" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>公告</title>
</head>
<body>
	<center>
		<table border="1" width="100%" cellspacing="0" cellpadding="0"
			bordercolor="#E3E3E3" bordercolorlight="E3E3E3"
			bordercolordark="white" rules="rows" style="margin-top: 8">
			<tr height="30">
				<td colspan="5" style="text-indent: 5" background="images/index/classT.png"><b><font
						color="white">■ 公&nbsp;&nbsp;告</font></b></td>
			</tr>
			<tr height="30" align="center" bgcolor="#F0F0F0">
				<td width="25%">时间</td>
				<td width="75%">公告内容</td>
			</tr>
			<logic:notPresent name="broadcast" scope="session">
				<tr height="180">
					<td bgcolor="#F9F9F9" align="center" colspan="5"><li>暂时没有公告！</li></td>
				</tr>
			</logic:notPresent>
			<logic:present name="broadcast" scope="session">
				<logic:empty name="broadcast" scope="session">
					<tr height="180">
						<td bgcolor="#F9F9F9" align="center" colspan="5"><li>暂时没有公告！</li></td>
				</logic:empty>
				<logic:notEmpty name="broadcast" scope="session">
					<tr>
						<td colspan="5">
							<table border="1" width="100%" cellspacing="0" cellpadding="0"
								bordercolor="#F0F0F0" bordercolorlight="#F0F0F0"
								bordercolordark="white" rules="all" style="word-break:break-all">
								<logic:iterate id="broadcastSingle" name="broadcast">
									<tr height="100" bgcolor="#F9F9F9">
										<td width="25%" align="center"><bean:write
												name="broadcastSingle" property="broadcastTime" /></td>
										<td width="75%" style="style-indent: 10"><bean:write name="broadcastSingle" property="broadcastMessage" filter="false"/>
								</logic:iterate>
							</table>
						</td>
					</tr>
				</logic:notEmpty>
			</logic:present>
			<tr height="10">
				<td colspan="5"></td>
			</tr>
			<tr height="30">
				<td colspan="6" background="images/index/boardE.jpg"><jsp:include
						flush="true" page="/pages/page.jsp">
						<jsp:param name="gowhich"
							value="user/broadcastShow.do?method=broadcastListShow" />
					</jsp:include></td>
			</tr>
			<tr height="10">
				<td colspan="5"></td>
			</tr>
		</table>
	</center>
</body>
</html>