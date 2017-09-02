package com.yxq.actionform;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

public class ForbiddenIPForm extends ValidatorForm {

	private static final long serialVersionUID = 1L;
	private String forbiddenIP;
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		String validate=request.getParameter("validate");
		if(validate==null||validate.equals("")||!validate.equals("yes"))
			return null;
		else
			return super.validate(mapping, request);	
	}

	public void clear(){
		setForbiddenIP("");
	}

	public String getForbiddenIP() {
		return forbiddenIP;
	}

	public void setForbiddenIP(String forbiddenIP) {
		this.forbiddenIP = forbiddenIP;
	}
}

