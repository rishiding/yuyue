package com.rishi.reserve.common.utils;

import java.util.HashMap;

public class NurPlanStatus {

 static HashMap<String, String> nurPlanStatusMap = new HashMap<String, String>(3);
 static{
	 nurPlanStatusMap.put("1", "执行中");
	 nurPlanStatusMap.put("2", "执行完成");
	 nurPlanStatusMap.put("3", "撤销");
 }

	public static String getValue(String key){
		
		return nurPlanStatusMap.get(key)==null?"未执行":nurPlanStatusMap.get(key);
	}
	
	
	
	
	public static void main(String[] args) {
		System.out.println(getValue(null));
	}
}
