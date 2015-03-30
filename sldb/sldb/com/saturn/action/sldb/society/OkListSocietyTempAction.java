package com.saturn.action.sldb.society;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Society;

public class OkListSocietyTempAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String time = request.getParameter("time");
		if(!"".equals(time)){
			Society.updateSociety(time,"2");
		}
		
		return new JspView("/app/sldb/society/random/show.jsp");
	}
	
	@Override
	public String requestMapping() {
		return "/app/sldb/society/okListSocietyTemp.action";
	}
	
}
