<%@page import="com.yxq.actionform.BbsForm"%>
<%@page import="com.yxq.action.VoteAction"%>
<%@page import="com.yxq.actionform.VoteForm"%>
<%@page import="com.yxq.dao.OpDB"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<jsp:useBean id="vote" scope="request" class="com.yxq.action.VoteAction" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int voteVal = Integer.parseInt(request.getParameter("sel"));
	VoteAction voteAction = new VoteAction();
	voteAction.setTotalSelNum((Integer) session.getAttribute("totalSelNum"));
	List<VoteForm> votes = (List<VoteForm>) session.getAttribute("votes");
	votes.get(voteVal).setVoteNum(votes.get(voteVal).getVoteNum() + 1);
	voteAction.setVotes(votes);
	session.setAttribute("totalVoteNum", (Integer) session.getAttribute("totalVoteNum") + 1);
	BbsForm bbsSingle = (BbsForm) session.getAttribute("bbsRootSingle");
	String bbsContent = "";
	bbsContent += (Integer) session.getAttribute("totalSelNum");
	bbsContent += "@";
	bbsContent += (Integer) session.getAttribute("totalVoteNum");
	bbsContent += ":";
	Iterator<VoteForm> itor = ((ArrayList<VoteForm>) session.getAttribute("votes")).iterator();
	while (itor.hasNext()) {
		VoteForm tempform = itor.next();
		bbsContent += tempform.getContent();
		bbsContent += "$";
		bbsContent += tempform.getVoteNum();
		bbsContent += ";";
	}
	bbsSingle.setBbsContent(bbsContent);
	Object[] params = {bbsContent, bbsSingle.getBbsId()};

	String sql = "update tb_bbs set bbs_content = ? where bbs_id = ?";
	OpDB mydb = new OpDB();
	int j = mydb.OpUpdate(sql, params);
	if (j == 1) {
		System.out.println("更新数据库成功");
	} else {
		System.out.println("更新数据库失败");
	}
%>
<script language="javascript">
	//alert("感谢你投了宝贵的一票");
	self.location = "/BBS/user/openShow.do?method=openShow&showPage=1&bbsId=<%=session.getAttribute("bbsId")%>";
</script>