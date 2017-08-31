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
import com.yxq.actionform.ClassForm;
import com.yxq.actionform.UserForm;
import com.yxq.dao.OpDB;
import com.yxq.model.CreatePage;
import com.yxq.tools.Change;

public class BroadcastAction extends MySuperAction {
	/** �鿴���� */
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

	/** ��̨-�������� */
	public ActionForward addBroadcast(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse responce) {
		HttpSession session = request.getSession();
		session.setAttribute("backMainPage", "../broadcast/broadcastAdd.jsp");

		String validate = request.getParameter("validate");
		if (validate == null || validate.equals("") || !validate.equals("yes")) {
			return mapping.findForward("result");
		} else {
			ActionMessages messages = new ActionMessages();
			BroadcastForm broadcastForm = (BroadcastForm) form;
			String broadcastTime = Change.dateTimeChange(new Date());
			String broadcastMessage = Change.HTMLChange(broadcastForm.getBroadcastMessage());
			String sql = "insert into tb_broadcast values(null,?,?)";
			Object[] params = { broadcastMessage, broadcastTime };

			OpDB myOp = new OpDB();

			int i = myOp.OpBroadcastUpdate(sql, params);
			if (i <= 0) {
				System.out.println("��������ʧ��!");
				messages.add("adminOpR", new ActionMessage("luntan.admin.add.broadcast.E"));
				return mapping.findForward("error");
			} else {
				System.out.println("��������ɹ���");
				messages.add("adminOpR", new ActionMessage("luntan.admin.add.broadcast.S"));
				broadcastForm.clear();
			}
			saveErrors(request, messages);
			return mapping.findForward("result");
		}

	}

	/** ��̨-�б�鿴��̳��� */
	public ActionForward getBroadcastList(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("backMainPage", "../broadcast/broadcastListShow.jsp");

		OpDB myOp = new OpDB();
		List broadcastList = myOp.OpBroadcastShow();
		session.setAttribute("backBroadcastList", broadcastList);
		return mapping.findForward("success");
	}

	/** ��̨-�޸���̳��� */
	public ActionForward modifyBroadcast(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("backMainPage", "../broadcast/broadcastModify.jsp");

		String forwardPath = "";
		int broadcastId = Integer.parseInt(request.getParameter("broadcastId"));

		OpDB myOp = new OpDB();
		BroadcastForm broadcastForm = (BroadcastForm) form;
		String validate = request.getParameter("validate");
		if (validate == null || validate.equals("") || !validate.equals("yes")) {
			forwardPath = "showModifyJSP";
			String sql = "select * from tb_broadcast where broadcast_id=?";
			Object[] params = { broadcastId };

			BroadcastForm broadcastSingle = myOp.OpBroadcastSingleShow(sql, params);
			broadcastForm.setBroadcastTime(Change.dateTimeChange(new Date()));
		} else {
			ActionMessages messages = new ActionMessages();
			broadcastId = broadcastForm.getBroadcastId();
			String broadcastTime = Change.dateTimeChange(new Date());
			String broadcastMessage = Change.HTMLChange(broadcastForm.getBroadcastMessage());

			String sql = "update tb_class set broadcast_message=?,broadcast_time=? where class_id=?";
			Object[] paramsMo = { broadcastMessage, broadcastTime, broadcastId };
			int i = myOp.OpBroadcastUpdate(sql, paramsMo);
			if (i <= 0) {
				System.out.println("������̳����ʧ�ܣ�");
				forwardPath = "error";
				messages.add("adminOpR", new ActionMessage("luntan.admin.modify.broadcast.E"));
			} else {
				System.out.println("������̳����ɹ���");
				session.setAttribute("backMainPage", "../broadcast/broadcastListShow.jsp");
				forwardPath = "success";
				messages.add("adminOpR", new ActionMessage("luntan.admin.modify.broadcast.S"));
			}
			saveErrors(request, messages);
		}
		return mapping.findForward(forwardPath);
	}

	/** ��̨-ɾ������ */
	public ActionForward deleteBroadcast(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();

		int broadcastId = 0;
		if (request.getParameter("broadcastId") == null || request.getParameter("broadcastId").equals("")) {
			broadcastId = -1;
		}else {
			broadcastId=Integer.parseInt(request.getParameter("broadcastId"));
		}
		String sql = "delete from tb_broadcast where broadcast_id=?";
		Object[] params = { broadcastId };

		OpDB myOp = new OpDB();
		int i = myOp.OpBroadcastUpdate(sql, params);

		ActionMessages messages = new ActionMessages();
		String forwardPath = "";
		if (i <= 0) {
			System.out.println("ɾ������ʧ�ܣ�");
			forwardPath = "error";
			messages.add("adminOpR", new ActionMessage("luntan.admin.delete.broadcast.E"));
		} else {
			System.out.println("ɾ������ɹ���");
			forwardPath = "success";
			messages.add("adminOpR", new ActionMessage("luntan.admin.delete.broadcast.S"));
		}
		saveErrors(request, messages);
		return mapping.findForward(forwardPath);
	}

}
