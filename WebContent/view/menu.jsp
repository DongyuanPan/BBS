<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="struts-html" prefix="html"%>
<%@ taglib uri="struts-bean" prefix="bean"%>
<%@ taglib uri="struts-logic" prefix="logic"%>

<%
	String[] weekdays = {"", "��", "һ", "��", "��", "��", "��", "��"};
	String[] days = new String[42];
	for (int i = 0; i < 42; i++)
		days[i] = "";

	Date currentDay = new Date();
	int year = 1900 + currentDay.getYear();
	int month = currentDay.getMonth();
	int today = currentDay.getDate();
	int weekday = currentDay.getDay() + 1;

	String now = year + "��" + (month + 1) + "��" + today + "��" + " ����" + weekdays[weekday];
%>

<html>
<head>
<title>ҳü</title>
<script type="text/javascript">
	function showTime(showWhere) {
		var now = new Date();
		var hour = now.getHours();
		var minu = now.getMinutes();
		var sec = now.getSeconds();

		if (hour < 10)
			hour = "0" + hour;
		if (minu < 10)
			minu = "0" + minu;
		if (sec < 10)
			sec = "0" + sec;

		showWhere.value = hour + ":" + minu + ":" + sec;
		setTimeout("showTime(time)", 1000)
	}
</script>
</head>
<body onload="showTime(time)" bgcolor="#F7F7F7">
	<center>
		<table border="0" width="100%" cellspacing="0" cellpadding="0"
			style="margin-top: 1">
			<tr height="38">
				<td colspan="2" background="images/index/menu.png">
					<table border="0" width="100%" height="100%" cellspacing="0"
						cellpadding="0">
						<tr height="50%" style="font-size: 10pt">
							<td align="center"><%=now%> <input type="text"
								style="border: 0;" true"
								id="time" size="9"></td>
							<td align="center" width="8%" ><a href="goIndex.do" style="color: white">�� ҳ</a></td>
							<td align="center" width="8%"><a
								href="user/isUserLogin.do?method=isUserLogin" style="color: white">�� ¼</a></td>
							<td align="center" width="8%"><a
								href="user/broadcast.do?method=broadcastListShow&showpage=1" style="color: white">��
									��</a></td>
							<td align="center" width="8%"><a
								href="user/personCen.do?method=personCenter" style="color: white">��������</a></td>
							<td align="center" width="10%"><a
								href="user/goodListShow.do?method=goodListShow&showpage=1" style="color: white">��������</a></td>
							<td align="center" width="10%"><a
								href="user/isAdminLogin.do?method=isAdminLogin" style="color: white">�����̨</a></td>
							<td align="center" width="8%"><a
								href="user/reg.do?method=userReg" style="color: white">ע ��</a></td>
							<td align="center" width="8%"><a
								href="user/logout.do?method=logout" style="color: white">ע ��</a></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr height="40">
				<td width="529" align="center" background="images/index/indexP.png">
					<marquee onmouseover=this.stop() onmouseout=this.start()
						scrollamount="1" scrolldelay="10" direction="left" width="470">
						<img src="images/index/pcard.gif"> BBS�������ߣ�(520) 110
						E-mail�����ϴ�ѧ�������ѧ�빤��ѧԺ@seu.edu.com
					</marquee>
				</td>
				<td align="center" width="271"
					background="images/index/messages.png"><html:errors
						property="userOpR" /> <html:errors property="sqlvalue" /></td>
			</tr>
			<html:form action="/user/search.do" method="post">
				<input type="hidden" name="validate" value="yes">
				<tr height="38">
					<td colspan="2" background="images/index/indexS.jpg" align="center">
						<table border="0" width="98%">
							<tr>
								<td width="25%"><logic:notPresent name="logoner">
                        		�οͣ�����û�е�¼��
                        	</logic:notPresent> <logic:present name="logoner">
	                        	${sessionScope.logoner.userName}����ӭ��¼��
                        	</logic:present>
								</td>
								<td align="right">������ <html:select property="subsql">
										<html:options collection="searchSQL" property="value"
											labelProperty="label" />
									</html:select> �ؼ��֣� <html:text property="sqlvalue" size="30" /> <html:radio
										property="searchType" value="like">ģ��</html:radio> <html:radio
										property="searchType" value="all">��ȷ</html:radio> <html:submit
										value=" "
										style="background-image:url('images/index/bs.png');width:49;height:21;border:0" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</html:form>
		</table>
	</center>
</body>
</html>