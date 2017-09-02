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
		//�õ��ϴ��ļ��ı���Ŀ¼�����ϴ����ļ������WEB-INFĿ¼�£����������ֱ�ӷ��ʣ���֤�ϴ��ļ��İ�ȫ
        String savePath = servlet.getServletContext().getRealPath("/WEB-INF/upload");
        
		filePath = savePath + "/" + fileName;
        
        File savefile = new File(savePath);
        //�ж��ϴ��ļ��ı���Ŀ¼�Ƿ����
        if (!savefile.exists() && !savefile.isDirectory()) {
            System.out.println(savePath+"Ŀ¼�����ڣ���Ҫ����");
            //����Ŀ¼
            savefile.mkdir();
        }
        //��Ϣ��ʾ
        try{
            //�õ��ϴ��ļ�����������ͨ���������ȡ�ϴ��ļ�   
            in = myFile.getInputStream();     
            //�õ��ϴ��ļ�������   
            out = new FileOutputStream(savePath + "/" + fileName);     
            session.setAttribute("fileSize", fileSize); 
            session.setAttribute("fileName", fileName);             
            session.setAttribute("filePath", filePath);            
            byte[] b = new byte[1024];   
            int length = 0;   
            //��ʼ�ϴ��ļ�,ÿ��ȡ1024���ֽڣ����������ָ��·��λ��д���ȡ�����ֽڡ�   
            while ((length = in.read(b)) != -1) {   
                out.write(b, 0, length);   
                out.flush();        	
            }
        }catch (IOException ioe) {   
            ioe.printStackTrace();   
        }finally{   
            //�ر���   
            in.close();     
            out.close();   
        }
		System.out.println("�����ϴ��ɹ���");
		messages.add("userOpR", new ActionMessage("luntan.bbs.addaccesspry.S"));
		saveErrors(request, messages);
        return mapping.findForward("success");

	}

}
