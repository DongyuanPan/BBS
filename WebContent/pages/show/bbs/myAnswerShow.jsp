<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html"%>
<%@ taglib uri="struts-bean" prefix="bean"%>
<%@ taglib uri="struts-logic" prefix="logic"%>

<html>
<head>
<title>我的回复</title>
</head>
<body>
	<center>
		<table border="1" width="100%" cellspacing="0" cellpadding="0"
			bordercolor="#E3E3E3" bordercolorlight="#E3E3E3"
			bordercolordark="white" rules="rows" style="margin-top: 8">
			<tr height="30">
				<td colspan="6" background="images/index/classT.jpg"
					style="text-indent: 5"><b><font color="white">■
							我的回复</font></b></td>
			</tr>
			<tr height="30" align="center" bgcolor="#F0F0F0">

				<td width="33%">标题</td>
				<td width="33%">内容</td>
				<td width="33%">时间</td>
			</tr>
			<logic:notPresent name="myanswerlist" scope="session">
				<tr height="180">
					<td bgcolor="#F9F9F9" align="center" colspan="6"><li>对不起，你还没有回复</li></td>
				</tr>
			</logic:notPresent>
			<logic:present name="myanswerlist" scope="session">
				<logic:empty name="myanswerlist" scope="session">
					<tr height="180">
						<td bgcolor="#F9F9F9" align="center" colspan="6"><li>对不起，你还没有回复！</li></td>
					</tr>
				</logic:empty>
				<logic:notEmpty name="myanswerlist" scope="session">
					<tr>
						<td colspan="6">
							<table border="1" width="100%" cellspacing="0" cellpadding="0"
								bordercolor="#F0F0F0" bordercolorlight="#F0F0F0"
								bordercolordark="white" rules="all">
								<logic:iterate id="myanswerSingle" name="myanswerlist">
										<td width="32%" style="text-indent: 10"> <a
											href="user/openShow.do?method=openShow&bbsId=${myanswerSingle.bbsAnswerRootID}"><bean:write
													name="myanswerSingle" property="bbsAnswerTitle"
													filter="false" /></a></td>
										<td width="33%" align="center"><bean:write
												name="myanswerSingle" property="bbsAnswerContent" /></td>
										<td width="33%" align="center"><bean:write
												name="myanswerSingle" property="bbsAnswerSendTime" /></td>
							</tr>
								</logic:iterate>
							</table>
						</td>
					</tr>
				</logic:notEmpty>
			</logic:present>

			<tr height="10">
				<td colspan="6"></td>
			</tr>
			<tr height="30">
				<td colspan="6" background="images/index/boardE.jpg"><jsp:include
						flush="true" page="/pages/page.jsp">
						<jsp:param name="gowhich"
							value="needLogin/my/listShow.do?method=lookMyBbs" />
					</jsp:include></td>
			</tr>
			<tr height="10">
				<td colspan="6"></td>
			</tr>
		</table>
	</center>
</body>
</html>