package com.saturn.action.sldb.temp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.sldb.PersonState;
import com.saturn.sldb.Temporary;

public class EndTempAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String id = request.getParameter("id");
		String type = request.getParameter("type");

		
		
		User user = (User)request.getSession().getAttribute("authUser");
		Temporary tmp = Temporary.get(id);
		
		User userOragantion = User.getOrganizationsByOrganizationId(user.getId());
			
		PersonState personState = new PersonState(null, id, user.getId(),
				user.getName(), DateUtils.getSystemTime(), tmp
						.getName(), tmp.getIdentify(), "",
				"", tmp.getCreaterDepartment(), "临时救助");
		
		
		if ("1".equals(type)) { // 乡镇街-申报
			tmp.setState("待审核");
			if(tmp.getFiles() == null){
				return new JspView("/app/sldb/temp/error.jsp");
			}
			
			/*if(!tmp.getAudit().equals("") || !tmp.getMoney().equals("") || tmp.getAudit() != null || tmp.getMoney() != null){
					return new JspView("/app/sldb/temp/fail.jsp");
			}*/
			
			if("".equals(tmp.getAudit()) || "".equals(tmp.getMoney()) || tmp.getAudit() == null || tmp.getMoney() == null){
				tmp.setAudit("");
				tmp.setMoney("");
				if (Temporary.edit(tmp) == 1) {
					
					personState.setState(tmp.getState());
					PersonState.add(personState);
					return new JspView("/app/sldb/temp/temp.jsp");
				} else {
					return new JspErrorView("信息更新失败");
				}
			} else{
				return new JspView("/app/sldb/temp/fail.jsp");
			}
			/*if (Temporary.edit(tmp) == 1) {
				
				personState.setState(tmp.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/temp/temp.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}*/
		} else if ("2".equals(type)) { // 乡镇街-完成
			if("21".equals(userOragantion.getOrganizationId())){
				tmp.setState("未支付");
				if (tmp.getMoney() == null || tmp.getMoney().equals("") || tmp.getFiles() == null || tmp.getFiles().equals("")) {
					return new JspView("/app/sldb/temp/endError.jsp");
				} else {

					if (Temporary.edit(tmp) == 1) {
						
						personState.setState(tmp.getState());
						PersonState.add(personState);
						return new JspView("/app/sldb/temp/temp.jsp");
					} else {
						return new JspErrorView("信息更新失败");
					}
				}
			}else{
				tmp.setState("未付款");
				if (tmp.getMoney() == null || tmp.getMoney().equals("") || tmp.getFiles() == null || tmp.getFiles().equals("")) {
					return new JspView("/app/sldb/temp/endError.jsp");
				} else {

					if (Temporary.edit(tmp) == 1) {
						
						personState.setState(tmp.getState());
						PersonState.add(personState);
						return new JspView("/app/sldb/temp/temp.jsp");
					} else {
						return new JspErrorView("信息更新失败");
					}
				}
			}
		}else if ("4".equals(type)) { // 乡镇街财务-完成
			tmp.setState("已付款");
			if (tmp.getMoney() == null || tmp.getMoney().equals("") || tmp.getFiles() == null || tmp.getFiles().equals("")) {
				return new JspView("/app/sldb/temp/endError.jsp");
			} else {

				if (Temporary.edit(tmp) == 1) {
					
					personState.setState(tmp.getState());
					PersonState.add(personState);
					return new JspView("/app/sldb/account/country.jsp");
				} else {
					return new JspErrorView("信息更新失败");
				}
			}
		} else if ("3".equals(type)) { // 民政局-完成
			tmp.setState("未支付");
			if (tmp.getMoney() == null || tmp.getMoney().equals("")) {
				return new JspView("/app/sldb/temp/endError.jsp");
			} else {

				if (Temporary.edit(tmp) == 1) {
					personState.setState(tmp.getState());
					PersonState.add(personState);
					return new JspView("/app/sldb/temp/check.jsp");
				} else {
					return new JspErrorView("信息更新失败");
				}
			}
		}else if ("5".equals(type)) { // 民政局-完成
			tmp.setState("已支付");
			if (tmp.getMoney() == null || tmp.getMoney().equals("")) {
				return new JspView("/app/sldb/temp/endError.jsp");
			} else {

				if (Temporary.edit(tmp) == 1) {
					personState.setState(tmp.getState());
					PersonState.add(personState);
					return new JspView("/app/sldb/account/center.jsp");
				} else {
					return new JspErrorView("信息更新失败");
				}
			}
		} else{ // 民政局-驳回
			tmp.setState("驳回");
			personState.setNote(request.getParameter("note"));
			if (Temporary.edit(tmp) == 1) {
				personState.setState(tmp.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/temp/check.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}
		}
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/temp/endTemp.action";
	}
}
