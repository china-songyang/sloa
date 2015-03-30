package com.saturn.action.sldb.society;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Society;

public class UpdateSocietyFilesAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		String files = request.getParameter("files");
		if(files!=null&&!"".equals(files)){
			if (Society.editFiles(id, files) == 1) {
				return new JspView("/app/sldb/society/apply/show.jsp");
			} else {
				return new JspErrorView("更新信息失败");
			}
		}
		return new JspErrorView("无图片信息");
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/society/updatefiles.action";
	}
}
