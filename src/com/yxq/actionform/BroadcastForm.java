package com.yxq.actionform;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

public class BroadcastForm extends ValidatorForm {

	private int broadcastId;
	private String broadcastMessage;
	private String broadcastTime;
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		String validate=request.getParameter("validate");
		if(validate==null||validate.equals("")||!validate.equals("yes"))
			return null;
		else
			return super.validate(mapping, request);
	}
	
	public int getBroadcastId() {
		return broadcastId;
	}
	public void setBroadcastId(int broadcastId) {
		this.broadcastId = broadcastId;
	}
	public String getBroadcastMessage() {
		return broadcastMessage;
	}
	public void setBroadcastMessage(String broadcastMessage) {
		this.broadcastMessage = broadcastMessage;
	}
	public String getBroadcastTime() {
		return broadcastTime;
	}
	public void setBroadcastTime(String broadcastTime) {
		this.broadcastTime = broadcastTime;
	}
	
	public void clear(){
		broadcastId=0;
		broadcastMessage="";
		broadcastTime="";
	}
	
}
