package com.saturn.action.sldb.general;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Society;

public class ReplayLsybjzxtAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String createTime = DateUtils.getSystemTime();
		
		Society society = Society.get(id);

		society.setState("创建");
		society.setCreateTime(createTime);
		
		Society.editByPerson(society);
		
		return new JspView("/app/sldb/lsybjzxt/state/showDetail.jsp?pid="+id+"&type=3");
	}
	@Override
	public String requestMapping() {
		return "/app/sldb/lsybjzxt/state/replayLsybjzxt.action";
	}
}
