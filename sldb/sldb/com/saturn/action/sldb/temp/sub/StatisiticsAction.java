package com.saturn.action.sldb.temp.sub;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Temporary;

public class StatisiticsAction implements IAction {

	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		Temporary temp = new Temporary();
		temp.setIdentify("220323198811011618");
		List<Temporary> list = Temporary.getAllPersonByIdcard(temp.getIdentify());
		request.setAttribute("tempPersonList", list);
		return new JspView("/app/sldb/temp/statistics.jsp");
		//return new JspErrorView("信息更新失败");
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/temp/statistics.action";
	}

}
