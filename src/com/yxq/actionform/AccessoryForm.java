package com.yxq.actionform;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

public class AccessoryForm extends ValidatorForm {
	private String accessoryId;
	private String accessoryFileName;
	private String accessoryPath;	
	private String accessoryUploadTime;
	private String accessoryDescription;
	private String accessorySize;
	private String accessoryDownloadCount;
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		String validate=request.getParameter("validate");
		if(validate==null||validate.equals("")||!validate.equals("yes"))
			return null;
		else
			return super.validate(mapping, request);	
	}

	public void clear(){
		
	}
}