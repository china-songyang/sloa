package com.saturn.action.sldb.temp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.sldb.Temporary;

public class QueryTempAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		Temporary vo = Temporary.get(id);
		String type = request.getParameter("type");
		//获取当前用户所在部门返回不同的编辑页面
		User user = (User)request.getSession().getAttribute("authUser");
		User userOragantion = User.getOrganizationsByOrganizationId(user.getId());
		if("21".equals(userOragantion.getOrganizationId())){
			if("1".equals(type)){
				request.setAttribute("temp", vo);
				return new JspView("/app/sldb/temp/editByCenter.jsp");
			} else {
				request.setAttribute("temp", vo);
				return new JspView("/app/sldb/temp/edit2.jsp");
			}
		}else{
			if("1".equals(type)){
				request.setAttribute("temp", vo);
				return new JspView("/app/sldb/temp/edit.jsp");
			} else {
				request.setAttribute("temp", vo);
				return new JspView("/app/sldb/temp/edit2.jsp");
			}
		}
	}
	
	@Override
	public String requestMapping() {
		return "/app/sldb/temp/query.action";
	}
}
