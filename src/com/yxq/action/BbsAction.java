package com.yxq.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.util.LabelValueBean;

import com.yxq.actionform.BbsAnswerForm;
import com.yxq.actionform.BbsForm;
import com.yxq.actionform.BoardForm;
import com.yxq.actionform.FileUploadForm;
import com.yxq.actionform.UserForm;
import com.yxq.actionform.VoteForm;
import com.yxq.dao.OpDB;
import com.yxq.model.CreatePage;
import com.yxq.tools.Change;

public class BbsAction extends MySuperAction {

	/** 显示指定版面中的所有根帖 */
	public ActionForward rootListShow(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		super.setParams(request);
		HttpSession session = request.getSession();
		session.setAttribute("mainPage", "/pages/show/bbs/listRootShow.jsp");

		String classId = request.getParameter("classId");
		String boardId = request.getParameter("boardId");
		if (classId == null || classId.equals(""))
			classId = (String) session.getAttribute("classId");
		else
			session.setAttribute("classId", classId);
		if (boardId == null || boardId.equals(""))
			boardId = (String) session.getAttribute("boardId");
		else
			session.setAttribute("boardId", boardId);

		/* 生成“跳转版面”下拉列表中的选项，这些选项应为当前论坛类别中的版面 */
		Vector<LabelValueBean> jumpBoard = new Vector<LabelValueBean>();
		List<BoardForm> boardlist = (ArrayList) session.getAttribute("class" + classId);
		if (boardlist != null && boardlist.size() != 0) {
			for (int i = 0; i < boardlist.size(); ++i) {
				BoardForm boardSingle = (BoardForm) boardlist.get(i);
				jumpBoard.add(new LabelValueBean(boardSingle.getBoardName(), boardSingle.getBoardId()));
				if (boardId.equals(boardSingle.getBoardId())) { // 如果是当前版面
					session.setAttribute("boardMaster", boardSingle.getBoardMaster()); // 保存当前版面的斑竹
					session.setAttribute("boardPcard", boardSingle.getBoardPcard()); // 保存当前版面的公告
				}
			}
		}
		session.setAttribute("jumpBoard", jumpBoard);

		String sql = "";
		Object[] params = { boardId };
		OpDB myOp = new OpDB();

		/* 查询数据库，获取置顶帖子(不包括括精华帖子) */
		myOp.setMark(false); // 不进行分页显示
		sql = "select * from tb_bbs where bbs_boardID=? and bbs_isTop='1' order by bbs_toTopTime DESC";
		List topbbslist = myOp.OpBbsListShow(sql, params);
		session.setAttribute("topbbslist", topbbslist);

		/* 查询数据库，获取其他帖子(包括精华帖子，也包括即是置顶，又是精华的帖子) */
		int perR = 5;
		String currentP = request.getParameter("showpage");
		if (currentP == null || currentP.equals(""))
			currentP = (String) session.getAttribute("currentP");
		else
			session.setAttribute("currentP", currentP);
		String gowhich = "user/listShow.do?method=rootListShow";

		myOp.setMark(true); // 进行分页显示
		myOp.setPageInfo(perR, currentP, gowhich); // 设置进行分页显示需要的信息

		sql = "select * from tb_bbs where bbs_boardID=? and bbs_isTop='0' order by bbs_opTime DESC";
		List otherbbslist = myOp.OpBbsListShow(sql, params);
		CreatePage page = myOp.getPage();

		session.setAttribute("otherbbslist", otherbbslist);
		session.setAttribute("page", page);

		return mapping.findForward("success");
	}

	/** 查看某个根帖 */
	public ActionForward openShow(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("mainPage", "/pages/show/bbs/openRootShow.jsp");

		String bbsId = request.getParameter("bbsId");
		if (bbsId == null || bbsId.equals(""))
			bbsId = (String) session.getAttribute("bbsId");
		else
			session.setAttribute("bbsId", bbsId);

		String sql = "";
		Object[] params = { bbsId };
		OpDB myOp = new OpDB();

		/*********** 查询tb_bbs数据表，获取要查看的根帖 ***********/
		sql = "select * from tb_bbs where bbs_id=?";
		BbsForm bbsRootSingle = myOp.OpBbsSingleShow(sql, params);
		session.setAttribute("bbsRootSingle", bbsRootSingle);

		/* 查询tb_accessory数据表，获取附件信息 */
		sql = "select * from tb_accessory where accessory_bbs_id = ?";
		List<FileUploadForm> bbsAccessory = myOp.OpAccessoryShow(sql, params);
		if (bbsAccessory.size() != 0) {
			FileUploadForm bbsFirstsAccessory = bbsAccessory.get(0);
			session.setAttribute("bbsFirstFileName", bbsFirstsAccessory.getFileName());

			List<String> listFileNames = new ArrayList<String>();
			for (int p = 0; p < bbsAccessory.size(); p++) {
				listFileNames.add(bbsAccessory.get(p).getFileName());
			}
			session.setAttribute("listFileNames", listFileNames);
			session.setAttribute("bbsFileNameList", bbsAccessory);

		} else {
			session.setAttribute("bbsFirstFileName", "无附件上传");
		}

		/* 对投票贴进行字符串解析 */
		if (bbsRootSingle.getBbsType().equals("投票贴")) {
			String bbsContent = bbsRootSingle.getBbsContent();
			int totalSelNum = Integer.parseInt(bbsContent.substring(0, bbsContent.indexOf("@")));
			session.setAttribute("totalSelNum", totalSelNum);
			int totalVoteNum = Integer
					.parseInt(bbsContent.substring(bbsContent.indexOf("@") + 1, bbsContent.indexOf(":")));
			session.setAttribute("totalVoteNum", totalVoteNum);
			int beginIndex = bbsContent.indexOf(":") + 1;
			int endIndex = bbsContent.indexOf(";", beginIndex);
			String contentShow = "";
			List<VoteForm> votes = new ArrayList<VoteForm>();
			for (int i = 0; i < totalSelNum; i++) {
				votes.add(new VoteForm(bbsContent.substring(beginIndex, endIndex)));
				beginIndex = endIndex + 1;
				endIndex = bbsContent.indexOf(";", beginIndex);
			}
			session.setAttribute("votes", votes);
		}
		/* 查询tb_user数据表，获取该根帖发表者信息 */
		String asker = bbsRootSingle.getBbsSender();
		sql = "select * from tb_user where user_name=?";
		params[0] = asker;
		UserForm askUser = myOp.OpUserSingleShow(sql, params);
		session.setAttribute("askUser", askUser);

		/* 获取进行分页显示需要的信息 */
		int perR = 6;
		String currentP = request.getParameter("showpage");
		if (currentP == null || currentP.equals(""))
			currentP = (String) session.getAttribute("currentPopen");
		else
			session.setAttribute("currentPopen", currentP);
		String gowhich = "user/openShow.do?method=openShow";

		myOp.setMark(true); // 进行分页显示
		myOp.setPageInfo(perR, currentP, gowhich); // 设置进行分页显示需要的信息

		/*********** 查询tb_bbsAnswer数据表，获取根帖的回复帖 ***********/
		sql = "select * from tb_bbsAnswer where bbsAnswer_rootID=? order by bbsAnswer_sendTime";
		params[0] = bbsId;
		List answerbbslist = myOp.OpBbsAnswerListShow(sql, params);
		CreatePage page = myOp.getPage();

		session.setAttribute("answerbbslist", answerbbslist);
		session.setAttribute("page", page);

		/* 查询tb_user数据表，获取当前回复帖发表者信息 */
		sql = "select * from tb_user where user_name=?";
		Map answerMap = new HashMap();
		for (int i = 0; i < answerbbslist.size(); ++i) {
			String answerer = ((BbsAnswerForm) answerbbslist.get(i)).getBbsAnswerSender();
			if (!answerMap.containsKey(answerer)) {
				params[0] = answerer;
				UserForm answerUser = myOp.OpUserSingleShow(sql, params);
				answerMap.put(answerer, answerUser);
			}
		}
		session.setAttribute("answerMap", answerMap);

		return mapping.findForward("success");
	}

	/** 查看精华帖 */
	public ActionForward goodListShow(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		super.setParams(request);
		HttpSession session = request.getSession();
		session.setAttribute("mainPage", "/pages/show/bbs/goodListShow.jsp");
		OpDB myOp = new OpDB();

		int perR = 5;
		String currentP = request.getParameter("showpage");
		if (currentP == null || currentP.equals(""))
			currentP = (String) session.getAttribute("currentPgood");
		else
			session.setAttribute("currentPgood", currentP);
		String gowhich = "user/goodListShow.do?method=goodListShow";

		myOp.setMark(true); // 进行分页显示
		myOp.setPageInfo(perR, currentP, gowhich); // 设置进行分页显示需要的信息

		String sql = "select * from tb_bbs where bbs_isGood='1' order by bbs_toGoodTime DESC";
		List goodlist = myOp.OpBbsListShow(sql, null);
		CreatePage page = myOp.getPage();

		session.setAttribute("goodlist", goodlist);
		session.setAttribute("page", page);

		return mapping.findForward("success");
	}

	/** 发表帖子 */
	public ActionForward addBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("mainPage", "/pages/add/bbsAdd.jsp");
		UserForm logoner = (UserForm) session.getAttribute("logoner");

		String logonerForbidden = logoner.getUserForbidden();
		String validate = request.getParameter("validate");
		ActionMessages messages = new ActionMessages();
		int i, j = 1;

		if (logonerForbidden.equals("0")) {
			if (validate == null || validate.equals("") || !validate.equals("yes")) {
				return mapping.findForward("showAddJSP");
			} else {
				BbsForm bbsForm = (BbsForm) form;
				/* 帖子相关信息 */
				String boardId = (String) session.getAttribute("boardId");
				String bbsTitle = Change.HTMLChange(bbsForm.getBbsTitle());
				String bbsType = Change.HTMLChange(bbsForm.getBbsType());
				String bbsContent = Change.HTMLChange(bbsForm.getBbsContent());
				if (bbsType.equals("投票贴")) {
					bbsContent = Change.voteContentChange(bbsContent);
				}
				String bbsSender = ((UserForm) session.getAttribute("logoner")).getUserName();
				String bbsSendIP = request.getRemoteAddr();
				String bbsFace = bbsForm.getBbsFace();
				String bbsIsTop = "0";
				String bbsToTopTime = "";
				String bbsIsGood = "0";
				String bbsToGoodTime = "";

				OpDB myOp = new OpDB();
				String sql = "insert into tb_bbs values(null,?,?,?,?,?,now(),?,?,now(),?,null,?,null,null)";
				Object[] params = { boardId, bbsType, bbsTitle, bbsContent, bbsSender, bbsSendIP, bbsFace, bbsIsTop,
						bbsIsGood };
				i = myOp.OpUpdate(sql, params);

				/* 附件相关信息 */
				String fileName = (String) session.getAttribute("fileName");
				if (fileName != null) {

					String fileSize = (String) session.getAttribute("fileSize");
					int downloadCount = 0;
					String filePath = (String) session.getAttribute("filePath");
					int bbsID = myOp.getMaxBbsId();

					String[] fileNameEach = fileName.split("\\|");
					String[] fileSizeEach = fileSize.split("\\|");
					String[] filePathEach = filePath.split("\\|");

					for (int p = 1; p < fileNameEach.length; p++) {

						String sql2 = "insert into tb_accessory values(null,?,?,?,now(),' ',?,?)";
						Object[] params2 = { bbsID, fileNameEach[p], filePathEach[p], fileSizeEach[p], downloadCount };
						j = myOp.OpUpdate(sql2, params2);
						if (j <= 0) {
							break;
						}
					}

				}
				if (i <= 0) {
					System.out.println("发表帖子失败！");
					messages.add("userOpR", new ActionMessage("luntan.bbs.add.E"));
					saveErrors(request, messages);
					return mapping.findForward("error");
				} else if (j <= 0) {
					System.out.println("配置附件信息失败！");
					messages.add("userOpR", new ActionMessage("luntan.bbs.setaccessory.E"));
					saveErrors(request, messages);
					return mapping.findForward("error");
				} else {
					System.out.println("发表帖子成功！");
					session.setAttribute("currentP", "1");
					session.setAttribute("fileName", null);
					session.setAttribute("fileSize", null);					
					session.setAttribute("filePath", null);					
					messages.add("userOpR", new ActionMessage("luntan.bbs.add.S"));
					bbsForm.clear();
					saveErrors(request, messages);
					return mapping.findForward("success");
				}
			}
		} else {
			System.out.println("您当前已被禁言，无法发帖！");
			messages.add("userOpR", new ActionMessage("luntan.bbs.add.forbidden"));
			saveErrors(request, messages);
			return mapping.findForward("error");
		}
	}

	/** 回复帖子 */
	public ActionForward answerBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		BbsAnswerForm bbsAnswerForm = (BbsAnswerForm) form;

		String rootId = (String) session.getAttribute("bbsId");
		String bbsTitle = Change.HTMLChange(bbsAnswerForm.getBbsAnswerTitle());
		String bbsContent = Change.HTMLChange(bbsAnswerForm.getBbsAnswerContent());
		String bbsSender = ((UserForm) session.getAttribute("logoner")).getUserName();
		String bbsSendTime = Change.dateTimeChange(new Date());
		String bbsFace = bbsAnswerForm.getBbsFace();

		UserForm logoner = (UserForm) session.getAttribute("logoner");
		String logonerForbidden = logoner.getUserForbidden();

		ActionMessages messages = new ActionMessages();
		if (logonerForbidden.equals("0")) {
			String sql = "insert into tb_bbsAnswer values(null,?,?,?,?,?,?)";
			Object[] params = new Object[6];

			params[0] = rootId;
			params[1] = bbsTitle;
			params[2] = bbsContent;
			params[3] = bbsSender;
			params[4] = bbsSendTime;
			params[5] = bbsFace;

			String forwardPath = "";

			OpDB myOp = new OpDB();
			int i = myOp.OpUpdate(sql, params);
			if (i <= 0) {
				System.out.println("回复帖子失败！");
				forwardPath = "error";
				messages.add("userOpR", new ActionMessage("luntan.bbs.answerR.E"));
			} else {
				System.out.println("回复帖子成功！");
				forwardPath = "success";
				messages.add("userOpR", new ActionMessage("luntan.bbs.answerR.S"));
				bbsAnswerForm.clear();
			}
			saveErrors(request, messages);
			return mapping.findForward(forwardPath);
		} else {
			System.out.println("您当前已被禁言，无法回复该帖!");
			messages.add("userOpR", new ActionMessage("luntan.bbs.answer.forbidden"));
			saveErrors(request, messages);
			return mapping.findForward("error");
		}
	}

	/** 收藏帖子 */
	public ActionForward collectBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String forwardPath = "";

		HttpSession session = request.getSession();
		UserForm logoner = (UserForm) session.getAttribute("logoner");
		if (logoner != null && (logoner instanceof UserForm)) {

			String bbsId = request.getParameter("bbsId"); // 获取被提前帖子的ID
			String collector = logoner.getUserName(); // 获取当前登录用户的用户名

			if (bbsId != null && !bbsId.equals("")) {
				String sql = "insert into tb_collect value(null,?,?)";
				Object[] params = { collector, bbsId };

				ActionMessages messages = new ActionMessages();

				OpDB myOp = new OpDB();
				int i = myOp.OpUpdate(sql, params);
				if (i <= 0) {
					System.out.println("收藏失败！");
					forwardPath = "error";
					messages.add("userOpR", new ActionMessage("luntan.user.add.collect.E"));
				} else {
					System.out.println("收藏成功！");
					forwardPath = "success";
					messages.add("userOpR", new ActionMessage("luntan.user.add.collect.S"));
				}
				saveErrors(request, messages);
			}
			return mapping.findForward(forwardPath);
		} else {
			return mapping.findForward("error");
		}
	}

	/** 取消收藏帖子 */
	public ActionForward cancelcollectBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String forwardPath = "";

		HttpSession session = request.getSession();
		UserForm logoner = (UserForm) session.getAttribute("logoner");

		String bbsId = request.getParameter("bbsId"); // 获取被提前帖子的ID
		String collector = logoner.getUserName(); // 获取当前登录用户的用户名

		if (bbsId != null && !bbsId.equals("")) {
			String sql = "delete from tb_collect where collect_collector = ? and collect_bbs_id = ?";
			Object[] params = { collector, bbsId };

			ActionMessages messages = new ActionMessages();

			OpDB myOp = new OpDB();
			int i = myOp.OpUpdate(sql, params);
			if (i <= 0) {
				System.out.println("取消收藏失败，您没有收藏该帖！");
				forwardPath = "error";
				messages.add("userOpR", new ActionMessage("luntan.user.delete.collect.E"));
			} else {
				System.out.println("取消收藏成功！");
				forwardPath = "success";
				messages.add("userOpR", new ActionMessage("luntan.user.delete.collect.S"));
			}
			saveErrors(request, messages);
		}
		return mapping.findForward(forwardPath);
	}

	/**
	 * 将帖子提前
	 * 
	 * @throws UnsupportedEncodingException
	 */
	public ActionForward toFirstBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		UserForm logoner = (UserForm) session.getAttribute("logoner");

		String bbsId = request.getParameter("bbsId"); // 获取被提前帖子的ID
		String bbsSender = request.getParameter("bbsSender"); // 获取被提前帖子的发布者
		// bbsSender=new String(bbsSender.getBytes("ISO-8859-1"),"gbk");
		String time = Change.dateTimeChange(new Date()); // 获取操作时间
		String lognerAble = logoner.getUserAble(); // 获取当前登录用户的权限
		String lognerName = logoner.getUserName(); // 获取当前登录用户的用户名
		String master = (String) session.getAttribute("boardMaster"); // 获取当前版面的斑竹

		if (bbsId == null)
			bbsId = "-1";
		if (bbsSender == null)
			bbsSender = "";

		String forwardPath = "";
		ActionMessages messages = new ActionMessages();

		/* 如果当前登录的用户是帖子的发表者、帖子所属版面的斑竹、管理员 */
		if (lognerAble.equals("2") || lognerName.equals(master) || lognerName.equals(bbsSender)) {
			if (bbsId != null && !bbsId.equals("")) {
				Object[] params = { time, bbsId };
				String sql = "update tb_bbs set bbs_opTime=? where bbs_id=?";
				OpDB myOp = new OpDB();
				int i = myOp.OpUpdate(sql, params);
				if (i <= 0) {
					System.out.println("提前帖子失败");
					forwardPath = "error";
					messages.add("userOpR", new ActionMessage("luntan.bbs.first.E"));
				} else {
					System.out.println("提前帖子成功！");
					forwardPath = "success";
					messages.add("userOpR", new ActionMessage("luntan.bbs.first.S"));
				}
			} else {
				forwardPath = "error";
			}
		} else {
			System.out.println("您没有权限提前该帖子！");
			forwardPath = "error";
			messages.add("userOpR", new ActionMessage("luntan.bbs.first.N"));
		}
		saveErrors(request, messages);
		return mapping.findForward(forwardPath);
	}

	/**
	 * 删除根帖
	 * 
	 * @throws UnsupportedEncodingException
	 */
	public ActionForward deleteRootBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		UserForm logoner = (UserForm) session.getAttribute("logoner");

		String bbsId = request.getParameter("bbsId"); // 获取要删除帖子的ID
		String bbsSender = request.getParameter("bbsSender"); // 获取要删除帖子的发布者
		bbsSender = new String(bbsSender.getBytes("ISO-8859-1"));
		String lognerAble = logoner.getUserAble(); // 获取当前登录用户的权限
		String lognerName = logoner.getUserName(); // 获取当前登录用户的用户名
		String master = (String) session.getAttribute("boardMaster"); // 获取当前斑竹

		if (bbsId == null)
			bbsId = "-1";
		if (bbsSender == null)
			bbsSender = "";

		System.out.print(bbsId + bbsSender);

		ActionMessages messages = new ActionMessages();

		// 如果当前登录的用户是帖子的发表者、帖子所属版面的斑竹、管理员
		if (lognerAble.equals("2") || lognerName.equals(master) || lognerName.equals(bbsSender)) {
			if (bbsId != null && !bbsId.equals("")) {
				String sql = "delete from tb_bbs where bbs_id=?";
				Object[] params = { bbsId };

				OpDB myOp = new OpDB();

				String sql3 = "select * from tb_accessory where accessory_bbs_id = ?";
				List<FileUploadForm> bbsAccessory = myOp.OpAccessoryShow(sql3, params);

				int i = myOp.OpUpdate(sql, params);
				
				String sql4 = "delete from tb_bbsanswer where bbsAnswer_rootID = ?";
				int n = myOp.OpUpdate(sql4, params);
				
				if (bbsAccessory.size() > 0) {
					String sql2 = "delete from tb_accessory where accessory_bbs_id=?";
					int j = myOp.OpUpdate(sql2, params);

					String filepath = servlet.getServletContext().getRealPath("/WEB-INF/upload");
					/* 查询tb_accessory数据表，获取附件信息 */
					List<String> fileNames = new ArrayList<String>();

					for (int p = 0; p < bbsAccessory.size(); p++) {
						fileNames.add(bbsAccessory.get(p).getFileName());
					}
					for (int k = 0; k < bbsAccessory.size(); k++) {
						String filePathFull = filepath + File.separator + fileNames.get(k);
						new File(filePathFull).delete();
					}
					if (j <= 0) {
						System.out.println("删除附件出错！");
						messages.add("userOpR", new ActionMessage("luntan.bbs.deleteAccessory.E"));
						saveErrors(request, messages);
					}
				}

				if (i <= 0) {
					System.out.println("删除出错！");
					messages.add("userOpR", new ActionMessage("luntan.bbs.deleteRoot.E"));
					saveErrors(request, messages);
				}else if (n <= 0) {
					System.out.println("删除回复出错！");
					messages.add("userOpR", new ActionMessage("luntan.bbs.deleteAnswer.E"));
					saveErrors(request, messages);
				}
				else { // 删除成功后，要返回列表显示根帖的页面，该页面有：查看某版面下所有根帖的页面、查看我的帖子的页面、查看精华帖子的页面
					System.out.println("删除成功！");
					messages.add("userOpR", new ActionMessage("luntan.bbs.deleteRoot.S"));
					saveErrors(request, messages);
					ActionForward forward = new ActionForward(
							"/" + session.getAttribute("servletPath") + "?method=" + session.getAttribute("method")); // 因为返回的页面存在以上三种情况，所以返回的视图要在程序中动态指定
					return forward;
				}
			}
			return mapping.findForward("error");
		} else {
			System.out.println("您没有权限删除该帖子!");
			messages.add("userOpR", new ActionMessage("luntan.bbs.deleteRoot.N"));
			saveErrors(request, messages);
			return mapping.findForward("error");
		}
	}

	/** 查看帖子的发表者的详细信息 */
	public ActionForward getUserSingle(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();

		String userName = request.getParameter("userName");
		if (userName == null)
			userName = "";
		try {
			userName = new String(userName.getBytes("ISO-8859-1"), "gb2312");
		} catch (UnsupportedEncodingException e) {
			userName = "";
			e.printStackTrace();
		}

		ActionMessages messages = new ActionMessages();
		String forwardPath = "";

		String sql = "select * from tb_user where user_name=?";
		Object[] params = { userName };

		OpDB myOp = new OpDB();
		UserForm bbsUser = myOp.OpUserSingleShow(sql, params);

		if (bbsUser == null) {
			System.out.println("查看帖子的发表者失败！");
			forwardPath = "error";
			messages.add("userOpR", new ActionMessage("luntan.bbs.sender.E"));
		} else {
			System.out.println("查看帖子的发表者成功！");
			forwardPath = "success";
			session.setAttribute("bbsUserSingle", bbsUser);
			session.setAttribute("mainPage", "/pages/show/user/bbsUserSingle.jsp");
		}
		saveErrors(request, messages);
		return mapping.findForward(forwardPath);
	}
}
