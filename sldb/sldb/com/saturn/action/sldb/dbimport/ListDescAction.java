package com.saturn.action.sldb.dbimport;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.Import;

public class ListDescAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		DataGridInfo dataGridInfo = new DataGridInfo(request);

		Import vo = BeanUtils.getBean(request, Import.class);
		ListData<Import> data = Import.getAll(vo, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());
		
		List<Import> data1 = Import.getAllFooter(vo);

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList(),data1));
	}
	
	public String requestMapping() {
		return "/app/sldb/import/listdesc.action";
	}
	
}





