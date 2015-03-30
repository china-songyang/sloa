package com.saturn.sldb;

import com.saturn.app.utils.DateUtils;

public class Test {
	public static void main(String args[]){
		String date = DateUtils.getSystemDate();
		System.out.println("日期：" + date);
		
		/*User user = (User)request.getSession().getAttribute("authUser");// TODO Auto-generated method stub
		String number = user.getNumber();
		System.out.println("账号:" + number);*/
		
		int random = (int) (Math.random()*9000+1000);
		System.out.println("随机4位数：" + random);
		
		String number = date + "-" + Integer.toString(random);
		System.out.println("编号："+number);
	}
}

