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

public class ApplySocietyAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String type = request.getParameter("type");

		String note = request.getParameter("note");
		if("".equals(note) || note == null){
			note = "";
		}
		User user = (User) request.getSession().getAttribute("authUser");
		Society society = Society.get(id);

		PersonState personState = new PersonState(null, id, user.getId(),
				user.getName(), DateUtils.getSystemTime(), society.getName(),
				society.getIdentify(), "", note, society.getCreaterDepartment(), "社会化救助");

		if ("1".equals(type)) { // 乡镇街-申报
			if(society.getFiles() == null || "".equals(society.getFiles())){
				return new JspView("/app/sldb/society/apply/error.jsp");
			} else{
				society.setState("待审核");
				if (Society.editToState(society) == 1) {

					personState.setState(society.getState());
					PersonState.add(personState);
					return new JspView("/app/sldb/society/apply/show.jsp");
				} else {
					return new JspErrorView("信息更新失败");
				}
			}
			
		} else if ("2".equals(type)) { // 乡镇街-完成
			society.setState("待核对");
			if (Society.editToState(society) == 1) {

				personState.setState(society.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/society/audit/show.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}
		} else if ("3".equals(type)) { // 民政局-完成
			society.setState("待初审");
			if (Society.editToState(society) == 1) {

				personState.setState(society.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/society/check/show.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}
		}else if ("4".equals(type)) { 
			society.setState("待抽查");
			if (Society.editToState(society) == 1) {

				personState.setState(society.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/society/first/show.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}
		}else if ("5".equals(type)) { 
			society.setState("待审批");
			if (Society.editToState(society) == 1) {

				personState.setState(society.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/society/random/show.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}
		}else if ("6".equals(type)) { 
			society.setState("未支付");
			if (Society.editToState(society) == 1) {

				personState.setState(society.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/society/approve/show.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}
		}else if ("7".equals(type)) { 
			society.setState("已支付");
			if (Society.editToState(society) == 1) {

				personState.setState(society.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/account/center.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}
		} else { // 民政局-驳回
			society.setState("驳回");
			personState.setNote(request.getParameter("note"));
			if (Society.edit(society,null) == 1) {
				personState.setState(society.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/temp/check.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}
		}
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/society/applySociety.action";
	}
}
