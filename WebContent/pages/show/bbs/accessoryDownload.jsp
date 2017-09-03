<%@ taglib uri="struts-html" prefix="html"%>
<%@ taglib uri="struts-bean" prefix="bean"%>
<%@ taglib uri="struts-logic" prefix="logic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<br> --------------直接下载------------ <br>
		<%
			List<String> fileNames = (List) session.getAttribute("listFileNames");
			for (String fileName : fileNames) {
		%>

		<html:form action="/needLogin/downloadAccessory.do" method="get">
			<input type="hidden" name="fileName" value="<%=fileName%>" />
			<input type="submit" value="<%=fileName%>" />
		</html:form>
		<%
			}
		%>
		<br> --------------直接打开---------
		<%
			for (String fileName : fileNames) {
		%>
		<html:form action="/needLogin/downloadAccessory.do" method="get">
			<input type="hidden" name="fileName" value="<%=fileName%>" />
			<input type="hidden" name="online" value="yes" />
			<input type="submit" value="<%=fileName%>" />
		</html:form>
		<%
			}
		%>
		</br>
	</center>
</body>
</html>
