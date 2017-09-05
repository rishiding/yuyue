package com.rishi.reserve.common.utils.sql;

public abstract class ArrayUtils {
	
	public String[] createKeyArray(String... keys){
		return  createArray(keys);
	}
	
	public Object[] createValueArray(Object... values ){
		return createArray(values);
	}
	
	public abstract Object[] createArray(Object... objs);
	
	public abstract String[] createArray(String... keys);

}
 