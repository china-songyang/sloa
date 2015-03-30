package com.saturn.action.sldb.society;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.Society;

public class ListSocietyTempAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		DataGridInfo dataGridInfo = new DataGridInfo(request);

		Society vo = BeanUtils.getBean(request, Society.class);

		//User user = (User)request.getSession().getAttribute("authUser");
		//vo.setState("待抽查");
		
		List<Society> data1 = Society.getAllByRandom(vo, dataGridInfo.getSortId(),
				dataGridInfo.getOreder());
		
		int total = data1.size();
		
		
		List<Society> data2 = new ArrayList<Society>();//黑名单
		List<Society> data3 = new ArrayList<Society>();//其它
		//黑名单数据
		for(Society s : data1){
			if("1".equals(s.getHbState())){
				data2.add(s);
			}else{
				data3.add(s);
			}
		}
		
		List<Society> returnData = new ArrayList<Society>();
		int size = 0;
		if(total>3){
			size = (int)(total*0.3);//30%数
			if(data2.size()>0){
				if(data2.size()>=size){//黑名单数大于等于30%数，从黑名单里抽取
					List<String> r = getRandom(data2.size(),size);
					for(String s : r){
						returnData.add((Society)data2.get(Integer.parseInt(s)));
					}
				}else{//黑名单数小于30%数，黑名单全抽，其他有剩下的补
					returnData.addAll(data2);
					int otherSize = (size-data2.size());
					List<String> r = getRandom(data3.size(),otherSize);
					for(String s : r){
						returnData.add((Society)data3.get(Integer.parseInt(s)));
					}
				}
			}else{//无黑名单情况
				List<String> r = getRandom(total,size);
				for(String s : r){
					returnData.add((Society)data1.get(Integer.parseInt(s)));
				}
			}
		}
		
		//修改为以抽出状态
		String time = Society.updateSociety(returnData, "1");
		for(Society s :returnData){
			s.setCxState("1");
			s.setCxTime(time);
		}
		//return new JspView("/app/sldb/society/random/showTemp.jsp");
		return new JsonView(JSONUtils.getDataGridJSON(size,
				returnData));
	}
	
	@Override
	public String requestMapping() {
		return "/app/sldb/society/listSocietyTemp.action";
	}
	
	private List getRandom(int total, int size){
		 List<String> list = new ArrayList<String>(); 
		 for (int i = 0; i < size; i++) { 
			 int j = (int) (Math.random() * (total-0))+0;
			 while(list.contains(""+j)){
				 j = (int) (Math.random() * (total-0))+0;
			 }
			 list.add(""+j); 
		 }    
		 return list;
	}
}
