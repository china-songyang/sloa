package com.saturn.action.sldb.general;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Society;

public class UpdateLsybjzxtFilesAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		String files = request.getParameter("files");
		if(files!=null&&!"".equals(files)){
			if (Society.editFiles(id, files) == 1) {
				return new JspView("/app/sldb/lsybjzxt/apply/show.jsp");
			} else {
				return new JspErrorView("更新信息失败");
			}
		}
		return new JspErrorView("无图片信息");
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/lsybjzxt/updatefiles.action";
	}
}
