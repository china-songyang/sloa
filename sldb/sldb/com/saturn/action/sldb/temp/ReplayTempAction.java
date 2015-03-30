package com.saturn.action.sldb.temp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Temporary;

public class ReplayTempAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String createTime = DateUtils.getSystemTime();
		
		/*PersonState.update(id);*/
		Temporary temp = Temporary.get(id);

		temp.setState("创建");
		temp.setCreateTime(createTime);
		
		
		Temporary.edit(temp);
		
		return new JspView("/app/sldb/temp/state/showDetail.jsp?pid="+id+"&type=3");
	}
	@Override
	public String requestMapping() {
		// TODO Auto-generated method stub
		return "/app/sldb/temp/state/replayTemp.action";
	}
}
