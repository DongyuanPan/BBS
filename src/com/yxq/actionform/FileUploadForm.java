package com.yxq.actionform;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import org.apache.struts.validator.ValidatorActionForm;
import org.apache.struts.validator.ValidatorForm;

public class FileUploadForm extends ValidatorActionForm {

	private static final long serialVersionUID = 1L;
	private String fileName;// 上传文件的名称
	private String fileSize;// 上传文件的大小
	private String uploadTime;// 上传文件的日期
	private String fileBbsID;
	private String fileID;
	private String filePath;
	private String fileDescription;
	private String fileDownloadCount;

	private FormFile file;// 上传文件

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		String validate = request.getParameter("validate");
		if (validate == null || validate.equals("") || !validate.equals("yes"))
			return null;
		else
			return super.validate(mapping, request);
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	}

	public String getFileBbsID() {
		return fileBbsID;
	}

	public void setFileBbsID(String fileBbsID) {
		this.fileBbsID = fileBbsID;
	}

	public String getFileID() {
		return fileID;
	}

	public void setFileID(String fileID) {
		this.fileID = fileID;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileDescription() {
		return fileDescription;
	}

	public void setFileDescription(String fileDescription) {
		this.fileDescription = fileDescription;
	}

	public String getFileDownloadCount() {
		return fileDownloadCount;
	}

	public void setFileDownloadCount(String fileDownloadCount) {
		this.fileDownloadCount = fileDownloadCount;
	}

	public void clear() {
		fileName = "";
		fileSize = "";
		uploadTime = "";
		fileBbsID = "";
		fileID = "";
		filePath = "";
		fileDescription = "";
		fileDownloadCount = "";
		file = null;

	}
}