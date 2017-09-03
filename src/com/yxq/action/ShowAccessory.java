//package com.yxq.action;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.apache.struts.action.Action;
//import org.apache.struts.action.ActionForm;
//import org.apache.struts.action.ActionForward;
//import org.apache.struts.action.ActionMapping;
//import com.yxq.actionform.FileUploadForm;
//import com.yxq.dao.OpDB;
//
//public class ShowAccessory extends Action {
//	
//	public ActionForward ShowAccessory(ActionMapping mapping, ActionForm form, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//
//		HttpSession session = request.getSession();
//		String bbsId = (String) session.getAttribute("bbsId");
//
//		String sql = "";
//		Object[] params = { bbsId };
//		OpDB myOp = new OpDB();
//		/* 查询tb_accessory数据表，获取附件信息 */
//		sql = "select * from tb_accessory where accessory_bbs_id = ?";
//		List<FileUploadForm> bbsAccessory = myOp.OpAccessoryShow(sql, params);
//		List<String> fileNames = new ArrayList<String>();
//		for (int p = 1; p < bbsAccessory.size(); p++) {
//			fileNames.add(bbsAccessory.get(p).getFileName());
//		}
//
//		request.setAttribute("fileNames", fileNames);
//
//		return mapping.findForward("success");
//
//	}
//
//}



