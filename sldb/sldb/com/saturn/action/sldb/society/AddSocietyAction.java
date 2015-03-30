package com.saturn.action.sldb.society;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Society;
import com.saturn.sldb.Sub;

public class AddSocietyAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Society vo = BeanUtils.getBean(request, Society.class);
		
		String[] c_name = request.getParameterValues("c_name");
		String[] c_sex = request.getParameterValues("c_sex");
		String[] c_identify = request.getParameterValues("c_identify");
		String[] c_relation = request.getParameterValues("c_relation");
		String[] c_marry = request.getParameterValues("c_marry");
		String[] c_ill = request.getParameterValues("c_ill");
		String[] c_disability = request.getParameterValues("c_disability");
		String[] c_labor = request.getParameterValues("c_labor");
		String[] c_inputType = request.getParameterValues("c_inputType");
		
		List<Sub> list = new ArrayList<Sub>();
		
		for(int i=0; i<c_name.length; i++){
			if(!"".equals(c_name[i])||!"".equals(c_sex[i])||!"".equals(c_identify[i])||!"".equals(c_relation[i])||!"".equals(c_marry[i])||!"".equals(c_ill[i])||!"".equals(c_disability[i])||!"".equals(c_labor[i])||!"".equals(c_inputType[i])){
				if("".equals(c_inputType[i])){
					c_inputType[i] = "手动";
				} 
				Sub sub = new Sub(null,c_name[i],c_sex[i],c_identify[i],c_relation[i],c_marry[i],c_ill[i],c_disability[i],c_labor[i],c_inputType[i],null);
				list.add(sub);
			}
		}
		
		String type = request.getParameter("type1");
		if (type != null && type.trim().equals("auto")) {
			if (Society.addAuto(vo,list) == 1) {
				return new JspView("/app/sldb/society/apply/show.jsp");
			} else {
				return new JspErrorView("添加申报救助信息失败");
			}
		} else if (Society.add(vo,list) == 1) {
			return new JspView("/app/sldb/society/apply/show.jsp");
		} else {
			return new JspErrorView("添加信息失败");
		}
		
		//return new JspView("/app/sldb/society/apply/autoAdd.jsp");
	}
	@Override
	public String requestMapping() {
		// TODO Auto-generated method stub
		return "/app/sldb/society/add.action";
	}
}
