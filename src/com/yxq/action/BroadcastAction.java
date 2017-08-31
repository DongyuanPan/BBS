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
import com.yxq.dao.OpDB;
import com.yxq.model.CreatePage;
import com.yxq.tools.Change;

public class BroadcastAction extends MySuperAction {
	/** 查看公告 */
	public ActionForward broadcastListShow(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse responce) {
		super.setParams(request);
		HttpSession session = request.getSession();
		session.setAttribute("mainPage", "/pages/show/broadcast/broadcastShow.jsp");
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

}
