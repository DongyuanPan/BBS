<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-bean" prefix="bean"%>

<html>
<head>
<title>��ҳ������</title>
</head>
<body>
	<table border="0" width="100%" cellspacing="0" style="font-size: small">
		<tr >
			<td width="45%" align="center" ><bean:write name="page"
					property="pageInfo" filter="false" /></td>
			<td align="center" width="30%"><bean:write name="page"
					property="pageLink" filter="false" /></td>
			<form action="${param['gowhich']}" method="post">
				<td width="26%">ת���� <input type="text" name="showpage" size="7">
					<input type="submit" value="��תҳ��">
				</td>
			</form>
		</tr>
	</table>
</body>
</html>