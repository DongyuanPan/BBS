package com.yxq.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.yxq.actionform.BroadcastForm;
import com.yxq.actionform.UserForm;
import com.yxq.dao.OpDB;
import com.yxq.model.CreatePage;
import com.yxq.tools.Change;

public class BroadcastAction extends MySuperAction {
	/** 查看公告 */
	public ActionForward broadcastListShow(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse responce) {
		super.setParams(request);
		HttpSession session = request.getSession();
		session.setAttribute("mainPage", "/pages/show/bbs/broadcastShow.jsp");
		OpDB myOp = new OpDB();
		int perR = 5;
		String currentP = request.getParameter("showpage");
		if (currentP == null || currentP.equals("")) {
			currentP = (String) session.getAttribute("currentPBroadcast");
		} else {
			session.setAttribute("currentPBroadcast", currentP);
		}
		String gowhich = "user/broadcastShow.do?method=broadcastListShow";
		myOp.setMark(true);
		myOp.setPageInfo(perR, currentP, gowhich);

		List broadcastList = myOp.OpBroadcastShow();
		CreatePage page = myOp.getPage();

		session.setAttribute("broadcast", broadcastList);
		session.setAttribute("page", page);

		return mapping.findForward("success");
	}

	/** 后台-发布公告 */
	public ActionForward addBroadcast(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse responce) {
		HttpSession session = request.getSession();
		session.setAttribute("mainPage", "/pages/ass/broadcast.jsp");

		String validate = request.getParameter("validate");
		if (validate == null || validate.equals("") || !validate.equals("yes")) {
			return mapping.findForward("showAddJSP");
		} else {
			BroadcastForm broadcastForm = (BroadcastForm) form;
			String broadcastTime = Change.dateTimeChange(new Date());
			String broadcastMessage = Change.HTMLChange(broadcastForm.getBroadcastMessege());
			String sql = "insert into tb_broadcast values(null,?,?)";
			Object[] params = { broadcastMessage, broadcastTime };

			ActionMessages messages = new ActionMessages();
			OpDB myOp = new OpDB();

			int i = myOp.OpUpdate(sql, params);
			if (i <= 0) {
				System.out.println("发布公告失败!");
				messages.add("adminOpR", new ActionMessage("luntan.admin.add.E"));
				saveErrors(request, messages);

				return mapping.findForward("error");
			} else {
				System.out.println("发布公告成功！");
				session.setAttribute("currentP", "1");
				messages.add("adminOpR", new ActionMessage("luntan.admin.add.S"));
				broadcastForm.clear();
				saveErrors(request, messages);
				return mapping.findForward("success");
			}
		}

	}

	/** 后台-删除公告 */
	public ActionForward deleteBroadcast(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserForm logoner = (UserForm) session.getAttribute("logoner");

		String broadcastId = request.getParameter("broadcastId");
		if (broadcastId == null || broadcastId.equals("")) {
			broadcastId = "-1";
		}
		String sql = "delete from tb_broadcast where broadcast_id=?";
		Object[] params = { broadcastId };

		OpDB myOp = new OpDB();
		int i = myOp.OpUpdate(sql, params);

		ActionMessages messages = new ActionMessages();
		String forwardPath = "";
		if(i<=0) {
			System.out.println("删除公告失败！");
			forwardPath="error";
			messages.add("adminOpR",new ActionMessage("luntan.admin.delete.broadcast.E"));
		}else {
			System.out.println("删除公告成功！");
			forwardPath="success";
			messages.add("adminOpR",new ActionMessage("luntan.admin.delete.broadcast.S"));
		}
		saveErrors(request, messages);
		return mapping.findForward(forwardPath);

	}
}
