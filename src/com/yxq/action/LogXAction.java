package com.yxq.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.LabelValueBean;

import com.yxq.actionform.UserForm;
import com.yxq.dao.OpDB;
import com.yxq.tools.Change;
import com.yxq.tools.Encryption;

public class LogXAction extends DispatchAction {
	
	/** 前台登录判断 */
	public ActionForward isUserLogin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		Object loginer=session.getAttribute("logoner");
		if(loginer!=null&&(loginer instanceof UserForm)){			
			ActionMessages messages=new ActionMessages();
			messages.add("loginR",new ActionMessage("luntan.bbs.have.login"));
			saveErrors(request,messages);
			return mapping.findForward("FhaveLogin");
		}
		else{
			return mapping.findForward("noLogin");			
		}
	}
	/** 后台登录判断 */
	public ActionForward isAdminLogin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		ActionMessages messages=new ActionMessages();
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("logoner");
		if(obj!=null&&(obj instanceof UserForm)){
			UserForm logoner=(UserForm)obj;
			String able=logoner.getUserAble();

			if(!able.equals("2")){				
				messages.add("loginR",new ActionMessage("luntan.bbs.loginBack.N"));
				saveErrors(request,messages);
				return mapping.findForward("noAble");				
			}
			else{
				return mapping.findForward("BhaveLogin");
			}
		}
		else{
			messages.add("loginR",new ActionMessage("luntan.bbs.loginBack.E"));
			saveErrors(request,messages);
			return mapping.findForward("noLogin");			
		}
	}
	
	/** 登录 */
	public ActionForward login(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		UserForm logoner=(UserForm)form;
		String userName=Change.HTMLChange(logoner.getUserName());
		String userPassword=Change.HTMLChange(logoner.getUserPassword());
		new Encryption();
		userPassword = Encryption.getHash(userPassword, "MD5");
		System.out.println(userPassword);
		
		String sql="select * from tb_user where user_name=? and user_password=?";
		Object[] params={userName,userPassword};
		
		ActionMessages messages=new ActionMessages();
		OpDB myOp = new OpDB();
		logoner = myOp.OpUserSingleShow(sql, params);
		if(logoner!=null){			
			session.setAttribute("logoner",logoner);
			return (mapping.findForward("success"));
		}
		else{			
			messages.add("loginR",new ActionMessage("luntan.bbs.login.E"));
			saveErrors(request,messages);
			return mapping.findForward("fault");
		}		
	}
	
	/** 注销 */
	public ActionForward logout(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		session.invalidate();
		return mapping.findForward("logout");
	}
	/** 用户注册 */
	public ActionForward userReg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		ActionMessages messages=new ActionMessages();
		HttpSession session=request.getSession();
		session.setAttribute("mainPage","../pages/userReg.jsp");
		
		String validate=request.getParameter("validate");
		if(validate==null||validate.equals("")||!validate.equals("yes")){
			return mapping.findForward("result");
		}
		else{			
			UserForm regForm=(UserForm)form;
			String pass1=regForm.getUserPassword();
		    new Encryption();
			pass1 = Encryption.getHash(pass1, "MD5");
			String pass2=regForm.getAginPassword();
			pass2 = Encryption.getHash(pass2, "MD5");
			if(!pass1.equals(pass2)){
				System.out.println("两次输入的密码不一致！");
				messages.add("userPassword",new ActionMessage("luntan.user.reg.pass.noEquals"));
				saveErrors(request,messages);				
			}
			else{
				String userName=Change.HTMLChange(regForm.getUserName());
				Object[] params=null;
				String sql="";
				
				sql="select * from tb_user where user_name=?";
				params=new Object[1];
				params[0]=userName;
				
				OpDB myOp = new OpDB();
				UserForm user = myOp.OpUserSingleShow(sql, params);
				
				if(user!=null){
					System.out.println(userName+" 用户已经存在！");
					messages.add("userOpR",new ActionMessage("luntan.user.reg.exist",userName));
				}
				else{
					//String userPassword=Change.HTMLChange(regForm.getUserPassword());
					String userFace=regForm.getUserFace();
					String userSex=regForm.getUserSex();
					String userPhone=regForm.getUserPhone();
					String userOICQ=regForm.getUserOICQ();
					String userEmail=regForm.getUserEmail();
					String userFrom=Change.HTMLChange(regForm.getUserFrom());
					String userAble="0";
					String userForbidden="0";
					
					sql="insert into tb_user values(null,?,?,?,?,?,?,?,?,?,?)";
					params=new Object[10];
					params[0]=userName;
					params[1]=pass1;
					params[2]=userFace;
					params[3]=userSex;
					params[4]=userPhone;
					params[5]=userOICQ;
					params[6]=userEmail;
					params[7]=userFrom;
					params[8]=userAble;
					params[9]=userForbidden;
					
					int i = myOp.OpUpdate(sql, params);			
					if(i <= 0){
						System.out.println("用户注册失败！");
						messages.add("userOpR",new ActionMessage("luntan.user.reg.E"));
					}
					else{
						System.out.println("用户注册成功！");
						regForm.clear();
						messages.add("userOpR",new ActionMessage("luntan.user.reg.S"));
					}				
					saveErrors(request,messages);		
				}
				
			}			
			return mapping.findForward("result");		
		}
	}	
	
	public ActionForward myPersonInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		ActionMessages messages=new ActionMessages();
		HttpSession session=request.getSession();
		session.setAttribute("perCentermainPage","../UserCenter/personCenter.jsp");
		
		Object obj=session.getAttribute("logoner");
		if(obj!=null&&(obj instanceof UserForm)){
			UserForm logoner=(UserForm)obj;
			String ID=logoner.getId();
			
			String sql="";
    		Object[] params=null;
    		sql="select * from tb_user where id=?";
    		params=new Object[1];
    		params[0]=ID;    			                  
    		
    		OpDB myOp = new OpDB();
    		UserForm user=myOp.OpUserShow(sql, params);
    		session.setAttribute("backUser",user);
    		if (session != null)
    			return mapping.findForward("result");
    		else
    			return mapping.findForward("noLogin");
		}
		else{
			messages.add("loginR",new ActionMessage("luntan.bbs.loginBack.E"));
			saveErrors(request,messages);
			return mapping.findForward("noLogin");			
		}
	}	
	
	public ActionForward personCenter(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		ActionMessages messages=new ActionMessages();
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("logoner");
		if(obj!=null&&(obj instanceof UserForm)){
			UserForm logoner=(UserForm)obj;
			String able=logoner.getUserAble();
			return mapping.findForward("BhaveLogin");
		}
		else{
			messages.add("loginR",new ActionMessage("luntan.bbs.loginBack.E"));
			saveErrors(request,messages);
			return mapping.findForward("noLogin");			
		}
	}	
	
	public ActionForward modifyUser1(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	HttpSession session=request.getSession();
    	session.setAttribute("perCentermainPage","../UserCenter/userModify.jsp");
    	Object obj=session.getAttribute("logoner");
    	String ID=null;
		if(obj!=null&&(obj instanceof UserForm)){
			UserForm logoner=(UserForm)obj;
			ID=logoner.getId();
		}
		
    	List backUserAble=new ArrayList();    	
    	backUserAble.add(new LabelValueBean("管理员","2"));
    	backUserAble.add(new LabelValueBean("版主","1"));
    	backUserAble.add(new LabelValueBean("普通用户","0"));
    	session.setAttribute("backUserAble",backUserAble);    		

		String forwardPath="";		
		String userId=ID;
		if(userId==null)
			userId="";
    	
		UserForm userForm=(UserForm)form;
    	String validate=request.getParameter("validate");
    	if(validate==null||validate.equals("")||!validate.equals("yes")){        	
    		forwardPath="showModifyJSP";    		
    		String sql="select * from tb_user where id=?";
        	Object[] params={userId};
        	
        	OpDB myOp=new OpDB();
        	UserForm select=myOp.OpUserSingleShow(sql, params);
        	
        	userForm.setId(select.getId());
        	userForm.setUserName(select.getUserName());
        	userForm.setOldPassword(select.getOldPassword()); 
        	userForm.setUserFace(select.getUserFace());
        	userForm.setUserSex(select.getUserSex());
        	userForm.setUserPhone(select.getUserPhone());
        	userForm.setUserOICQ(select.getUserOICQ());
        	userForm.setUserEmail(select.getUserEmail());
        	userForm.setUserFrom(select.getUserFrom());
        	userForm.setUserAble(select.getUserAble());        	
    	}
    	else{    		
    		ActionMessages messages=new ActionMessages();
    		
    		userId = userForm.getId();
    		String userName=Change.HTMLChange(userForm.getUserName());
    		String userPassword=Change.HTMLChange(userForm.getUserPassword());    
    		userPassword = Encryption.getHash(userPassword, "MD5");
    		String userFace=userForm.getUserFace();
    		String userSex=userForm.getUserSex();
    		String userPhone=userForm.getUserPhone();
    		String userOICQ=userForm.getUserOICQ();
    		String userEmail=userForm.getUserEmail();
    		String userFrom=Change.HTMLChange(userForm.getUserFrom());
    		
    		String sql="update tb_user set user_name=?,user_password=?,user_face=?,user_sex=?,user_phone=?,user_OICQ=?,user_email=?,user_from=? where id=?";
    		Object[] params={userName,userPassword,userFace,userSex,userPhone,userOICQ,userEmail,userFrom,userId};
    		
    		OpDB myOp=new OpDB();
    		int i=myOp.OpUpdate(sql, params);    		

    		if(i<=0){
    			System.out.println("更新用户失败！");
    			forwardPath="error";
    			messages.add("adminOpR",new ActionMessage("luntan.admin.modify.user.E"));
    		}
    		else{
    			System.out.println("更新用户成功！");
    			forwardPath="success";
    			messages.add("adminOpR",new ActionMessage("luntan.admin.modify.user.S"));
    		}
    		saveErrors(request,messages);
    	}
    	return mapping.findForward(forwardPath);
    }
}
