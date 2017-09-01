package com.yxq.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.yxq.actionform.UserForm;
import com.yxq.dao.OpDB;
import com.yxq.model.CreatePage;

public class OwnAction extends MySuperAction {
	
	/** 查看发表的根帖 */
	public ActionForward lookMyBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){		
		super.setParams(request);
		HttpSession session=request.getSession();
		session.setAttribute("mainPage","/pages/show/bbs/myBbsShow.jsp");
		UserForm logoner=(UserForm)session.getAttribute("logoner");
		if(logoner!=null&&(logoner instanceof UserForm)){
			String bbsown=logoner.getUserName();
			String sql="select * from tb_bbs where bbs_sender=? order by bbs_opTime DESC";
			Object[] params={bbsown};
			OpDB myOp=new OpDB();
			
			int perR=5;
			String currentP=request.getParameter("showpage");
			if(currentP==null||currentP.equals(""))
				currentP=(String)session.getAttribute("currentPmy");
			else
				session.setAttribute("currentPmy",currentP);
			String gowhich="needLogin/my/listShow.do?method=lookMyBbs";	
			
			myOp.setMark(true);								//进行分页显示
			myOp.setPageInfo(perR, currentP, gowhich);		//设置进行分页显示需要的信息	
			
			List mybbslist=myOp.OpBbsListShow(sql, params);
			CreatePage page=myOp.getPage();
			
			session.setAttribute("mybbslist",mybbslist);
			session.setAttribute("page",page);
		}		
		return (mapping.findForward("success"));
	}
	

	public ActionForward lookMyAnswer(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){		
		super.setParams(request);
		HttpSession session=request.getSession();
		session.setAttribute("mainPage","/pages/show/bbs/myAnswerShow.jsp");
		UserForm logoner=(UserForm)session.getAttribute("logoner");
		if(logoner!=null&&(logoner instanceof UserForm)){
			String bbsown=logoner.getUserName();
			String sql = "select * from tb_bbsanswer where bbsAnswer_sender=? order by bbsAnswer_sendTime desc";
			Object[] params={bbsown};
			OpDB myOp=new OpDB();
			
			int perR=5;
			String currentP=request.getParameter("showpage");
			if(currentP==null||currentP.equals(""))
				currentP=(String)session.getAttribute("currentPmy");
			else
				session.setAttribute("currentPmy",currentP);
			String gowhich="needLogin/my/myAnswer.do?method=lookMyAnswer";	
			
			myOp.setMark(true);								//进行分页显示
			myOp.setPageInfo(perR, currentP, gowhich);		//设置进行分页显示需要的信息	
			
			List myanswerlist=myOp.OpBbsAnswerShow(sql, params);
			CreatePage page=myOp.getPage();
			
			session.setAttribute("myanswerlist",myanswerlist);
			session.setAttribute("page",page);
		}		
		return (mapping.findForward("success"));
	}
	
	/** 查看收藏的根帖 */
	public ActionForward showCollect(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){		
		super.setParams(request);
		HttpSession session=request.getSession();
		session.setAttribute("mainPage","/pages/show/bbs/myCollectShow.jsp");
		UserForm logoner=(UserForm)session.getAttribute("logoner");
		if(logoner!=null&&(logoner instanceof UserForm)){
			String bbsown=logoner.getUserName();
			String sql = "select * from tb_bbs where bbs_id in (select collect_bbs_id from tb_collect where collect_collector = ?)";
			Object[] params={bbsown};
			OpDB myOp=new OpDB();
			
			int perR=5;
			String currentP=request.getParameter("showpage");
			if(currentP==null||currentP.equals(""))
				currentP=(String)session.getAttribute("currentPmy");
			else
				session.setAttribute("currentPmy",currentP);
			String gowhich="needLogin/my/listShow.do ?method=showCollect";	
			
			myOp.setMark(true);								//进行分页显示
			myOp.setPageInfo(perR, currentP, gowhich);		//设置进行分页显示需要的信息	
			
			List mybbslist=myOp.OpCollectShow(sql, params);
			CreatePage page=myOp.getPage();
			
			session.setAttribute("mybbslist",mybbslist);
			session.setAttribute("page",page);
			return (mapping.findForward("success"));
			}		
		else {
			return mapping.findForward("noLogin");
		}
	}	
	
	public ActionForward lookMyFriend(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){		
		super.setParams(request);
		HttpSession session=request.getSession();
		session.setAttribute("mainPage","/pages/show/bbs/myFriendShow.jsp");
		UserForm logoner=(UserForm)session.getAttribute("logoner");
		if(logoner!=null&&(logoner instanceof UserForm)){
			String bbsown=logoner.getUserName();
			String sql = "select * from tb_friend where my_name = ?";
			Object[] params={bbsown};
			OpDB myOp=new OpDB();
			
			int perR=5;
			String currentP=request.getParameter("showpage");
			if(currentP==null||currentP.equals(""))
				currentP=(String)session.getAttribute("currentPmy");
			else
				session.setAttribute("currentPmy",currentP);
			String gowhich="needLogin/my/myAnswer.do?method=lookMyAnswer";	
			
			myOp.setMark(true);								//进行分页显示
			myOp.setPageInfo(perR, currentP, gowhich);		//设置进行分页显示需要的信息	
			
			List myFriendlist=myOp.OpFriendShow(sql, params);
			CreatePage page=myOp.getPage();
			
			session.setAttribute("myFriendlist",myFriendlist);
			session.setAttribute("page",page);
		}		
		return (mapping.findForward("success"));
	}
	

}
