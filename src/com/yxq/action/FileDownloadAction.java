package com.yxq.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.URLEncoder;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class FileDownloadAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String path = request.getParameter("fileName");
		System.out.println(path);

		String filepath = servlet.getServletContext().getRealPath("/WEB-INF/upload");

		System.out.println("�ļ�·��" + filepath);

		InputStream iStream = new FileInputStream(filepath + File.separator + path);
		OutputStream oStream = response.getOutputStream();
		// ����;��ǵ������ضԻ���Ĺؼ�����
		response.addHeader("content-disposition",
				"attachment;filename=" + java.net.URLEncoder.encode(path, "GB2312"));

		byte[] b = new byte[1024];// һ�ζ������ֽڵ����ݴ�iStream��
		int size = iStream.read(b);
		while (size > 0) {
			oStream.write(b, 0, size);// ����һ��д����
			size = iStream.read(b);
		}
		iStream.close();
		oStream.close();
		return null;
	}

}
