<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html"%>
<%@ taglib uri="struts-bean" prefix="bean"%>
<%@ taglib uri="struts-logic" prefix="logic"%>

<html>
<head>
<title>好友列表</title>
</head>
<body>
	<center>
		<table border="1" width="100%" cellspacing="0" cellpadding="0"
			bordercolor="#E3E3E3" bordercolorlight="#E3E3E3"
			bordercolordark="white" rules="rows" style="margin-top: 8">
			
			<tr height="30">
				<td colspan="6" background="images/index/classT.png"
					style="text-indent: 5"><b><font color="white">■
							好友列表</font></b></td>
			</tr>
			
			<tr height="30" align="center" bgcolor="#F0F0F0">

				<td width="75%">好友名字</td>
				<td width="25%">操作</td>
			</tr>
			
			<logic:notPresent name="myFriendlist" scope="session">
				<tr height="180">
					<td bgcolor="#F9F9F9" align="center" colspan="6"><li>对不起，你没有好友</li></td>
				</tr>
			</logic:notPresent>
			
			<logic:present name="myFriendlist" scope="session">
			
				<logic:empty name="myFriendlist" scope="session">
					<tr height="180">
						<td bgcolor="#F9F9F9" align="center" colspan="6"><li>对不起，你没有好友</li></td>
					</tr>
				</logic:empty>
				
				<logic:notEmpty name="myFriendlist" scope="session">
					<tr>
						<td colspan="6">
							<table border="1" width="100%" cellspacing="0" cellpadding="0"
								bordercolor="#F0F0F0" bordercolorlight="#F0F0F0"
								bordercolordark="white" rules="all">
								<logic:iterate id="myFrienfSingle" name="myFriendlist">
								<td width="75%" align="center"><a
									href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${myFrienfSingle.friendname}">
									<b><bean:write name="myFrienfSingle" property="friendname" filter="false" /></b> <br>
								</a></td>		
								<td align="center"><a
									href="bbs/user/deleteFriend.do?method=deleteFriend&friendName=${myFrienfSingle.friendname}"
									onclick="javaScript:return confirm('确认要删除该信息?')">×删除</a></td>					
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
				<td colspan="6" background="images/index/boardE30.png"><jsp:include
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