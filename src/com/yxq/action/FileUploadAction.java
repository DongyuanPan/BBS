package com.yxq.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.upload.FormFile;

import com.yxq.actionform.FileUploadForm;

public class FileUploadAction extends Action {
	@Override  
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		FileUploadForm uf = (FileUploadForm) form;
		FormFile myFile = uf.getFile();  
		
		String fileName = myFile.getFileName();  
		int fileSize = myFile.getFileSize();
		String filePath = "";   
		
        InputStream in = null;   
        OutputStream out = null;        
        HttpSession session=request.getSession();
		ActionMessages messages = new ActionMessages();
		//得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
        String savePath = servlet.getServletContext().getRealPath("/WEB-INF/upload");
        
		filePath = savePath + "/" + fileName;
        
        File savefile = new File(savePath);
        //判断上传文件的保存目录是否存在
        if (!savefile.exists() && !savefile.isDirectory()) {
            System.out.println(savePath+"目录不存在，需要创建");
            //创建目录
            savefile.mkdir();
        }
        //消息提示
        try{
            //得到上传文件的流，可以通过这个流读取上传文件   
            in = myFile.getInputStream();     
            //得到上传文件的名字   
            out = new FileOutputStream(savePath + "/" + fileName);     
            session.setAttribute("fileSize", fileSize); 
            session.setAttribute("fileName", fileName);             
            session.setAttribute("filePath", filePath);            
            byte[] b = new byte[1024];   
            int length = 0;   
            //开始上传文件,每读取1024个字节，就向服务器指定路径位置写入读取到的字节。   
            while ((length = in.read(b)) != -1) {   
                out.write(b, 0, length);   
                out.flush();        	
            }
        }catch (IOException ioe) {   
            ioe.printStackTrace();   
        }finally{   
            //关闭流   
            in.close();     
            out.close();   
        }
		System.out.println("附件上传成功！");
		messages.add("userOpR", new ActionMessage("luntan.bbs.addaccesspry.S"));
		saveErrors(request, messages);
        return mapping.findForward("success");

	}

}
