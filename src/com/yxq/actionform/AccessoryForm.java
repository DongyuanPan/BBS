package com.yxq.actionform;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

public class AccessoryForm extends ValidatorForm {
	private String accessoryId;
	private String accessoryBbsId;
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
		accessoryId = "";
		accessoryBbsId = "";
		accessoryFileName = "";
		accessoryPath = "";	
		accessoryUploadTime = "";
		accessoryDescription = "";
		accessorySize = "";
		accessoryDownloadCount = "";
	}

	public String getAccessoryId() {
		return accessoryId;
	}

	public void setAccessoryId(String accessoryId) {
		this.accessoryId = accessoryId;
	}

	public String getAccessoryFileName() {
		return accessoryFileName;
	}

	public void setAccessoryFileName(String accessoryFileName) {
		this.accessoryFileName = accessoryFileName;
	}

	public String getAccessoryPath() {
		return accessoryPath;
	}

	public void setAccessoryPath(String accessoryPath) {
		this.accessoryPath = accessoryPath;
	}

	public String getAccessoryUploadTime() {
		return accessoryUploadTime;
	}

	public void setAccessoryUploadTime(String accessoryUploadTime) {
		this.accessoryUploadTime = accessoryUploadTime;
	}

	public String getAccessoryDescription() {
		return accessoryDescription;
	}

	public void setAccessoryDescription(String accessoryDescription) {
		this.accessoryDescription = accessoryDescription;
	}

	public String getAccessorySize() {
		return accessorySize;
	}

	public void setAccessorySize(String accessorySize) {
		this.accessorySize = accessorySize;
	}

	public String getAccessoryDownloadCount() {
		return accessoryDownloadCount;
	}

	public void setAccessoryDownloadCount(String accessoryDownloadCount) {
		this.accessoryDownloadCount = accessoryDownloadCount;
	}

	public String getAccessoryBbsId() {
		return accessoryBbsId;
	}

	public void setAccessoryBbsId(String accessoryBbsId) {
		this.accessoryBbsId = accessoryBbsId;
	}
}