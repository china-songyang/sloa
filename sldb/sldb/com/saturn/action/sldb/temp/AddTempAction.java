package com.saturn.action.sldb.temp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Temporary;

public class AddTempAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Temporary vo = BeanUtils.getBean(request, Temporary.class);
		
		String type = request.getParameter("type1");
		if (type != null && type.trim().equals("auto")) {
			if (Temporary.addAuto(vo) == 1) {
				return new JspView("/app/sldb/temp/temp.jsp");
			} else {
				return new JspErrorView("添加申请低保信息失败");
			}
		} else if (Temporary.add(vo) == 1) {
			return new JspView("/app/sldb/temp/temp.jsp");
		} else {
			return new JspErrorView("添加信息失败");
		}
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/temp/add.action";
	}
}
