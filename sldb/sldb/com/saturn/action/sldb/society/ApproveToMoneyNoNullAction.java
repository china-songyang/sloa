package com.saturn.action.sldb.society;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Society;

public class ApproveToMoneyNoNullAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String id=request.getParameter("ids");
		
		Society vo = Society.get(id);
		if("".equals(vo.getMoney())|| vo.getMoney() == null || "".equals(vo.getCreater())|| vo.getCreater() ==null){
			return new JspView("/app/sldb/society/approve/fail.jsp");
		}
			return new JspView("/app/sldb/society/approve/pass.jsp?id="+id);
	}
	
	@Override
	public String requestMapping() {
		return "/app/sldb/society/approve/ApproveToMoneyNoNull.action";
	}
}
