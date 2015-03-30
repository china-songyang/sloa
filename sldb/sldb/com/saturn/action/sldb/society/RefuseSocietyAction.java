package com.saturn.action.sldb.society;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.sldb.PersonState;
import com.saturn.sldb.Society;

public class RefuseSocietyAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		User user = (User) request.getSession().getAttribute("authUser");
		String id = request.getParameter("id");
		String type = request.getParameter("type");

		Society society = Society.get(id);
		PersonState personState = new PersonState(null, id, user.getId(),
				user.getName(), DateUtils.getSystemTime(), society.getName(),
				society.getIdentify(), "", "", society.getCreaterDepartment(),
				"社会化救助");

		society.setState("驳回");
		personState.setNote(request.getParameter("note"));
		if (Society.editToState(society) == 1) {
			personState.setState(society.getState());
			PersonState.add(personState);
			if ("1".equals(type)) {
				return new JspView("/app/sldb/society/audit/show.jsp");
			} else if("2".equals(type)){
				return new JspView("/app/sldb/society/check/show.jsp");
			} else if("3".equals(type)){
				return new JspView("/app/sldb/society/first/show.jsp");
			} else if("4".equals(type)){
				return new JspView("/app/sldb/society/random/show.jsp");
			} else if("5".equals(type)){
				return new JspView("/app/sldb/society/approve/show.jsp");
			}
		} else {
			return new JspErrorView("信息更新失败");
		}
		return null;
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/society/refuseSociety.action";
	}
}
