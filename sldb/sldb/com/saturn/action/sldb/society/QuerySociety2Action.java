package com.saturn.action.sldb.society;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Society;
import com.saturn.sldb.Sub;

public class QuerySociety2Action implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String view = request.getParameter("view");
		String id = request.getParameter("id");
		
		Society vo = Society.get(id);
		request.setAttribute("society", vo);
		if("ok".equals(view)){
			List<Sub> subs = new ArrayList<Sub>();
			if(vo!=null){
				subs = Sub.getByPid(id);
			}
			request.setAttribute("subs", subs);
			return new JspView("/app/sldb/society/apply/view.jsp");
		}else if("edit".equals(view)){
			List<Sub> subs = new ArrayList<Sub>();
			if(vo!=null){
				subs = Sub.getByPid(id);
			}
			request.setAttribute("subs", subs);
			return new JspView("/app/sldb/society/approve/edit.jsp");
		}
		else{
			Society vo1 = new Society();
			vo1.setId(vo.getId());
			vo1.setName(vo.getName());
			vo1.setFiles(vo.getFiles());
			request.setAttribute("temp", vo1);
			return new JspView("/app/sldb/society/apply/upfile.jsp");
		}
	}
	
	@Override
	public String requestMapping() {
		return "/app/sldb/society/query2.action";
	}
}
