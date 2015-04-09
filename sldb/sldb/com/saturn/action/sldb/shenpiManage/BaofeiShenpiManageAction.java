package com.saturn.action.sldb.shenpiManage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;

public class BaofeiShenpiManageAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		//String id = request.getParameter("id");
		//String type = request.getParameter("type");

		String note = request.getParameter("note");
		if("".equals(note) || note == null){
			note = "";
		}
		//User user = (User) request.getSession().getAttribute("authUser");
		//Society society = Society.get(id);

		//return new JspView("/app/sldb/lsybjzxt/approve/show.jsp");
		return new JspErrorView("报废操作失败！");
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/shenpiManage/baofeiShenpiManage.action";
	}
}
