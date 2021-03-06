package com.saturn.action.system.easyform.form;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.FormItem;

public class ReadonlyAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String readonly = request.getParameter("readonly");
		String tableId = request.getParameter("tableId");
		String formType = request.getParameter("formType");
		
		FormItem.readonly(readonly);
		return new JspView("/app/system/easyform/form/show.jsp?tableId="+tableId+"&formType="+formType);
	}

	public String requestMapping() {
		return "/app/system/easyform/form/readonly.action";
	}

}
