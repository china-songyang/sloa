package com.saturn.action.sldb.society;

import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.auth.User;
import com.saturn.sldb.PersonState;
import com.saturn.sldb.Society;

public class ListSocietyByTotalExcelAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		Society vo = BeanUtils.getBean(request, Society.class);
		User user = (User) request.getSession().getAttribute("authUser");
		
		
		String startTime = "";
		String endTime = "";
		List<String> idents = new ArrayList<String>();
		double b = 0;
		List<Society> data;
		User userOragantion = User.getOrganizationsByOrganizationId(user.getId());

		if ("21".equals(userOragantion.getOrganizationId())) {
			data = Society.getAllWithSelectExcel(vo);
		} else{
			vo.setCreater(user.getId());
			data = Society.getAllWithSelectExcel(vo);
		}
		
		int s=0;
		for(Society t : data){
			//时间
			String createTime = t.getCreateTime();
			if(s==0){
				startTime = createTime;
				endTime = createTime;
				s++;
			}else{
				int n = getSmallTime(createTime,endTime);
				if(n<0){
					n = getSmallTime(createTime,startTime);
					if(n<0){
						startTime = createTime;
					}
				}else{
					endTime = createTime;
				}
			}
			//人数
			String identify = t.getIdentify();
			/*if(!idents.contains(identify)){
				idents.add(identify);
			}*/
			idents.add(identify);
			//金额
			String money = t.getMoney();
			if(money!=null&&!"".equals(money)){
				try{
					b+=Double.parseDouble(money);
				}catch(Exception e){}
			}
			//审批时间
			String state = t.getState();
			PersonState ps = PersonState.getCreateTime(identify, state);
			if(ps!=null){
				t.setCreateTime(ps.getCreateTime());
			}else{
				t.setCreateTime("");
			}
		}
		
		if(vo.getBeginTime()!=null&&vo.getEndTime()!=null&&!"".equals(vo.getBeginTime())&&!"".equals(vo.getEndTime())){
			startTime = vo.getBeginTime();
			endTime = vo.getEndTime();
		}

		response.setHeader("Content-Disposition", "attachment;Filename=Report"+DateUtils.getSystemDate()+".xls");
		response.setContentType("application/ms-excel");
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");
		
		
		HSSFCellStyle cs=wb.createCellStyle();
		cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cs.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cs.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cs.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		cs.setWrapText(true);
		
		//头样式
		HSSFCellStyle csH =wb.createCellStyle();
		csH.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		csH.setBorderTop(HSSFCellStyle.BORDER_THIN);
		csH.setBorderRight(HSSFCellStyle.BORDER_THIN);
		csH.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		csH.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		csH.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		csH.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
		csH.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		csH.setWrapText(true);
		
		//保险样式
		HSSFCellStyle csIns =wb.createCellStyle();
//		csIns.setBorderLeft(HSSFCellStyle.BORDER_THIN);
//		csIns.setBorderTop(HSSFCellStyle.BORDER_THIN);
//		csIns.setBorderRight(HSSFCellStyle.BORDER_THIN);
//		csIns.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		csIns.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		csIns.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		//csIns.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
		//csIns.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		csIns.setWrapText(true);

		//进项资金样式
		HSSFCellStyle csMoney =wb.createCellStyle();
		csMoney.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		csMoney.setBorderTop(HSSFCellStyle.BORDER_THIN);
		csMoney.setBorderRight(HSSFCellStyle.BORDER_THIN);
		csMoney.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		csMoney.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		csMoney.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		csMoney.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
		csMoney.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		csMoney.setWrapText(true);
		
		
		//sheet.addMergedRegion(new Region(0,(short)0,0,(short)8));
		sheet.addMergedRegion(new CellRangeAddress(
                0, //first row (0-based)
                0, //last row  (0-based)
                0, //first column (0-based)
                8  //last column  (0-based)
        ));//设置合并的区域
		
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = row.createCell(0);
		cell.setCellValue("从"+startTime.substring(0,10)+"日到"+endTime.substring(0,10)+"日，共发放社会化救助"+idents.size()+"人次，共计发放救助金"+b+"元。");
		cell.setCellStyle(csIns);
		
		row = sheet.createRow(1);
		cell = row.createCell(0);
		cell.setCellValue("姓名");
		cell.setCellStyle(csH);
		cell = row.createCell(1);
		cell.setCellValue("身份证号");
		cell.setCellStyle(csH);
		cell = row.createCell(2);
		cell.setCellValue("申报单位");
		/*cell.setCellStyle(csH);
		cell = row.createCell(3);
		cell.setCellValue("临时救助类型");*/
		cell.setCellStyle(csH);
		cell = row.createCell(3);
		cell.setCellValue("户口类型");
		cell.setCellStyle(csH);
		cell = row.createCell(4);
		cell.setCellValue("审批人");
		cell.setCellStyle(csH);
		cell = row.createCell(5);
		cell.setCellValue("审批方式");
		cell.setCellStyle(csH);
		cell = row.createCell(6);
		cell.setCellValue("金额");
		cell.setCellStyle(csH);
		cell = row.createCell(7);
		cell.setCellValue("审批时间");
		cell.setCellStyle(csH);
		cell = row.createCell(8);
		cell.setCellValue("状态");
		cell.setCellStyle(csH);
		
		int i = 2;
		for (Society temp : data) {
			//temp.getId();
			HSSFRow rowi = sheet.createRow(i);
			HSSFCell cellj = rowi.createCell(0);
			cellj.setCellValue(temp.getName());
			cellj.setCellStyle(cs);
			
			cellj = rowi.createCell(1);
			cellj.setCellValue(temp.getIdentify());
			cellj.setCellStyle(cs);
			
			cellj = rowi.createCell(2);
			cellj.setCellValue(temp.getCreaterDepartment());
			cellj.setCellStyle(cs);
			
			/*cellj = rowi.createCell(3);
			cellj.setCellValue(temp.getType());
			cellj.setCellStyle(cs);*/

			cellj = rowi.createCell(3);
			cellj.setCellValue(temp.getAccountType());
			cellj.setCellStyle(cs);

			cellj = rowi.createCell(4);
			cellj.setCellValue("");
			cellj.setCellStyle(cs);

			cellj = rowi.createCell(5);
			if("待审批".equals(temp.getState())||"完结".equals(temp.getState())){
				cellj.setCellValue("上报审批");
			}else{
				cellj.setCellValue("本级审批");
			}
			cellj.setCellStyle(cs);

			cellj = rowi.createCell(6);
			cellj.setCellValue(temp.getMoney());
			cellj.setCellStyle(csMoney);

			cellj = rowi.createCell(7);
			cellj.setCellValue(temp.getCreateTime());
			cellj.setCellStyle(cs);
			
			cellj = rowi.createCell(8);
			cellj.setCellValue(temp.getState());
			cellj.setCellStyle(cs);

			i++;
		}
		
		//sheet.setColumnWidth((short) 0, (short) (35.7*20));
		
		try{
			OutputStream os = response.getOutputStream();
			wb.write(os);
			os.flush();
			os.close();
		}catch(Exception e){
		
		}
		//out.clear();
	    //out=pageContext.pushBody();
	
		return null;
		//return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
		//		data.getList(),data1.getList()));
	}
	@Override
	public String requestMapping() {
		return "/app/sldb/society/listTempByTotalExcel.action";
	}
	
	private int getSmallTime(String s1, String s2){
		//s1="2008-01-25 09:12:09";
		//s2="2008-01-29 09:12:11";
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar c1=Calendar.getInstance();
		Calendar c2=Calendar.getInstance();
		try{
			c1.setTime(df.parse(s1));
			c2.setTime(df.parse(s2));
		}catch(ParseException e){
			System.err.println("格式不正确");
		}
		int result=c1.compareTo(c2);
		return result;
		
		/*if(n==0){
			//System.out.println("c1相等c2");
		}else if(n<0){
			//System.out.println("c1小于c2");
		}else{
			//System.out.println("c1大于c2");
		}*/
	}
}
