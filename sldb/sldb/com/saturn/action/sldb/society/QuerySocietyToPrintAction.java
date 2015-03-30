package com.saturn.action.sldb.society;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Society;
import com.saturn.sldb.Sub;

public class QuerySocietyToPrintAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		Society vo = Society.get(id);
		List<Sub> subs = new ArrayList<Sub>();
		if(vo!=null){
			subs = Sub.getByPid(id);
		}
		
		request.setAttribute("society", vo);
		request.setAttribute("subs", subs);
		return new JspView("/app/sldb/society/apply/print.jsp");
	}
	@Override
	public String requestMapping() {
		return "/app/sldb/society/querySocietyToPrint.action";
	}
}
