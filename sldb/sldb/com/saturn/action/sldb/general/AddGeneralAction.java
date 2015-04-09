package com.saturn.action.sldb.general;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Sub;
import com.saturn.sldb.Temporary;

public class AddGeneralAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		Temporary vo = BeanUtils.getBean(request, Temporary.class);

		String[] c_name = request.getParameterValues("c_name"); // 姓名
		String[] c_sex = request.getParameterValues("c_sex"); // 性别
		String[] c_personRelation = request
				.getParameterValues("c_personRelation"); // 与户主关系
		String[] c_identify = request.getParameterValues("c_identify"); // 身份证号
		String[] c_tempNumber = request.getParameterValues("c_tempNumber"); // 暂住证或居住证号
		String[] c_diseaseKind = request.getParameterValues("c_diseaseKind"); // 病种
		String[] c_diagnosisOrg = request.getParameterValues("c_diagnosisOrg"); // 确诊机构
		String[] c_healthCareType = request
				.getParameterValues("c_healthCareType"); // 医保类型
		String[] c_contact = request.getParameterValues("c_contact"); // 联系电话

		List<Sub> list = new ArrayList<Sub>();

		for (int i = 0; i < c_name.length; i++) {
			if (!"".equals(c_name[i]) || !"".equals(c_sex[i])
					|| !"".equals(c_personRelation[i])
					|| !"".equals(c_identify[i]) || !"".equals(c_tempNumber[i])
					|| !"".equals(c_diseaseKind[i])
					|| !"".equals(c_diagnosisOrg[i])
					|| !"".equals(c_healthCareType[i])
					|| !"".equals(c_contact[i])) {
				Sub sub = new Sub(null, c_name[i], c_sex[i], c_identify[i],
						null, c_healthCareType[i], c_contact[i], null, null,
						null, null, null, null, c_personRelation[i],
						vo.getName(), c_tempNumber[i], c_diseaseKind[i],
						c_diagnosisOrg[i]);
				list.add(sub);
			}
		}

		if (Temporary.add(vo, list) == 1) {
			return new JspView("/app/sldb/general/sdshenbao/show.jsp");
		} else {
			return new JspErrorView("添加信息失败");
		}

		/*
		 * String type = request.getParameter("type1"); if (type != null &&
		 * type.trim().equals("auto")) { if (Temporary.addAuto(vo,list) == 1) {
		 * return new JspView("/app/sldb/general/sdshenbao/show.jsp"); } else {
		 * return new JspErrorView("添加申报救助信息失败"); } } else if
		 * (Temporary.add(vo,list) == 1) { return new
		 * JspView("/app/sldb/general/sdshenbao/show.jsp"); } else { return new
		 * JspErrorView("添加信息失败"); }
		 */
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/lsybjzxt/add.action";
	}
}
