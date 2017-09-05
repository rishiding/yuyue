package com.rishi.reserve.common.utils.sql;

import org.springframework.stereotype.Component;

@Component("arrayUtils")
public class BasicArrayUtils extends ArrayUtils{

	@Override
	public Object[] createArray(Object... objs) {
		Object[] objArray = new Object[objs.length];
		int index = 0;
		for(Object obj : objs){
			objArray[index++] = obj;
		}
		return objArray;
	}

	@Override
	public String[] createArray(String... keys) {
		String[] keyArray = new String[keys.length];
		int index = 0;
		for(String key : keys){
			keyArray[index++] = key;
		}
		return keyArray;
	}

}
