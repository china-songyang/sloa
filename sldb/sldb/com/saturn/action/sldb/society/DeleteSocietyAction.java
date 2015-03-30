package com.saturn.action.sldb.society;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Society;

public class DeleteSocietyAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String ids = request.getParameter("ids");
		String[] idsStr = ids.split("__");
		
		Society.removes(idsStr);
		return new JspView("/app/sldb/society/apply/show.jsp");
	}
	
	@Override
	public String requestMapping() {
		// TODO Auto-generated method stub
		return "/app/sldb/society/delete.action";
	}
}
