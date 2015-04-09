package com.saturn.action.sldb.general;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Sub;
import com.saturn.sldb.Temporary;

public class QueryGeneralAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		Temporary vo = Temporary.get(id);
		List<Sub> subs = new ArrayList<Sub>();
		if (vo != null) {
			subs = Sub.getByPid(id);
		}

		request.setAttribute("society", vo);
		request.setAttribute("subs", subs);
		return new JspView("/app/sldb/general/sdshenbao/edit.jsp");
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/general/query.action";
	}
}
