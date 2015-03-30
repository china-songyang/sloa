package com.saturn.action.sldb.society;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.auth.User;
import com.saturn.sldb.Society;

public class ListSocietyByTotalAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		DataGridInfo dataGridInfo = new DataGridInfo(request);

		Society vo = BeanUtils.getBean(request, Society.class);

		User user = (User) request.getSession().getAttribute("authUser");

		User userOragantion = User.getOrganizationsByOrganizationId(user
				.getId());

		if ("21".equals(userOragantion.getOrganizationId())) {
			ListData<Society> data = Society.getAllWithSelect(vo,
					dataGridInfo.getStartPage(), dataGridInfo.getRows(),
					dataGridInfo.getSortId(), dataGridInfo.getOreder());

			return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
					data.getList()));
		} else {
			vo.setCreater(user.getId());

			ListData<Society> data = Society.getAllWithSelect(vo,
					dataGridInfo.getStartPage(), dataGridInfo.getRows(),
					dataGridInfo.getSortId(), dataGridInfo.getOreder());

			return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
					data.getList()));
		}

	}

	@Override
	public String requestMapping() {
		return "/app/sldb/society/listSocietyByTotal.action";
	}
}
