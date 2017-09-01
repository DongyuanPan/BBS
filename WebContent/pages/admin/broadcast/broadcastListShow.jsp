<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html"%>
<%@ taglib uri="struts-bean" prefix="bean"%>
<%@ taglib uri="struts-logic" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>列表查看论坛公告</title>
</head>
<body>
	<center>
		<br>
		<table border="1" width="580" cellspacing="0" cellpadding="0"
			bordercolor="#E3E3E3" bordercolorlight="#E3E3E3"
			bordercolordark="white" rules="rows">
			<tr height="29">
				<td background="images/admin/backLT.png" colspan="4"
					style="text-indent: 5"><b><font color="white">■
							查看论坛类别</font></b></td>
			</tr>
			<tr height="30" bgcolor="#F0F0F0">
				<td width="25%" align="center">发布时间</td>
				<td width="60%" style="text-indent: 15">公告内容</td>
				<td align="center" colspan="2">操作</td>
			</tr>
			<logic:notPresent name="backBroadcastList">
				<tr height="80" bgcolor="#FBFBFB">
					<td align="center" colspan="4"><li>公告不存在！</li></td>
				</tr>
			</logic:notPresent>
			<logic:present name="backBroadcastList">
				<logic:empty name="backBroadcastList">
					<tr height="80" bgcolor="#FBFBFB">
						<td align="center" colspan="4"><li>没有类别可显示！</li></td>
					</tr>
				</logic:empty>
				<logic:notEmpty name="backBroadcastList">
					<tr>
						<td colspan="4">
							<table border="1" width="100%" cellspacing="0" cellpadding="0"
								bordercolor="#F0F0F0" bordercolorlight="#F0F0F0"
								bordercolordark="white" rules="rows">
								<logic:iterate id="backBroadcastSingle" name="backBroadcastList">
									<tr height="30" bgcolor="#FBFBFB">
										<td width="25%" align="center"><bean:write
												name="backBroadcastSingle" property="broadcastTime" /></td>
										<td width="55%" style="text-indent: 15"><bean:write
												name="backBroadcastSingle" property="subBroadcastMessage[18]"
												filter="false" /></a></td>
										<td align="center"><a
											href="needLogin/admin/modifyBroadcast.do?method=modifyBroadcast&broadcastId=${backBroadcastSingle.broadcastId}">√修改</a></td>
										<td align="center"><a
											href="needLogin/admin/deleteBroadcast.do?method=deleteBroadcast&broadcastId=${backBroadcastSingle.broadcastId}"
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
				<td colspan="4"></td>
			</tr>
		</table>
	</center>
</body>
</html>