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
		
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");
//		String path = String(request.getParameter("fileName").getBytes("iso-8859-1","gb2312"));
		String path = request.getParameter("fileName");
		System.out.println(path);

		String filepath = servlet.getServletContext().getRealPath("/WEB-INF/upload");

		System.out.println("文件路径" + filepath);

		InputStream iStream = new FileInputStream(filepath + File.separator + path);
		OutputStream oStream = response.getOutputStream();
		// 这个就就是弹出下载对话框的关键代码
		response.addHeader("Content-Disposition","attachment;filename="+ new String((path).getBytes("GB2312"),"iso8859-1"));
//		response.addHeader("content-disposition",
//				"attachment;filename=" + java.net.URLEncoder.encode(path, "GB2312"));

		byte[] b = new byte[1024];// 一次读多少字节的数据从iStream中
		int size = iStream.read(b);
		while (size > 0) {
			oStream.write(b, 0, size);// 这里一次写多少
			size = iStream.read(b);
		}
		iStream.close();
		oStream.close();
		return null;
	}

}
