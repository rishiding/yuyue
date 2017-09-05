package com.rishi.reserve.common.utils.sql;

import java.util.HashMap;
import java.util.Map;

public class SQLUtils {
	
	public static Map<String, Object> createMapParam(String[] keys, Object[] values){
		Map<String, Object> mapParam = new HashMap<String, Object>();
		for(int index = 0; index < keys.length; index++){ 
			mapParam.put(keys[index], values[index]);
		}
		return mapParam;
	}
	
	public static Map<String, Object> createMapParamFromExistMap(Map<String, Object> existMap,String[] keys, Object[] values){
		for(int index = 0; index < keys.length; index++){
			existMap.put(keys[index], values[index] == null ? "null" : values[index]);
		}
		return existMap;
	}
		
	
}
