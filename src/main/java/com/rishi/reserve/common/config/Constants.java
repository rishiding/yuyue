package com.rishi.reserve.common.config;
/**
 * 系统常量
 * @author Administrator
 *
 */
public class Constants {
	
	private Constants(){}
	
	//组件常量 定义 assembly	
	public static final String ASSEMBLY_RADIO="1";  //单选	
	public static final String ASSEMBLY_CHECKBOX="2";  //多选	
	public static final String ASSEMBLY_SINGLE_TEXT="3";  //单文本	
	public static final String ASSEMBLY_MULTILINE_TEXT="4";  //多行文本	
	public static final String ASSEMBLY_SELECT="5";  //下拉
	public static final String ASSEMBLY_NUMBER="6";  //下拉
	
	
	public static final String ASSEMBLY_TYPE_DIA="1";  //诊断
	public static final String ASSEMBLY_TYPE_EDUCATION="2";  // 健康教育
	public static final String ASSEMBLY_TYPE_PAPER="3";//评估表询征
	
	public static final String MOFELTYPE_ZD [] = new String[]{"DY","YJ","YS","MB","CS","XZ"};
	public static final String MOFELTYPE_PAPER [] = new String[]{"PAPER_XZ"};
	public static final String MOFELTYPE_JKJY [] = new String[]{"JKJY"};
	//简码-类别 : 简码 目标：MB ，措施：CS，询征：XZ，定义：DY,因素：YS，依据：YJ，PAPER_XZ:评估表询证,健康教育:JKJY
	
	//评估表状态
	public static final String ASSEMBLY_STATUS_PAPER="assembly_status";

	//护理计划  计划 来源  SOURCE
	public static final String ASSEMBLY_SOURCE_HANGS="1";  //手工新增
	public static final String ASSEMBLY_SOURCE_RESULT="2";  //评估结果
	public static final String ASSEMBLY_SOURCE_HIS="3";  //医嘱
	public static final String ASSEMBLY_SOURCE_OTHER="4";  //其他
	
	//护理计划状态
	public static final String ASSEMBLY_STATUS_NOTBEGIN="1";  //手工新增
	public static final String ASSEMBLY_STATUS_BEGIN="2";  //手工新增
	public static final String ASSEMBLY_STATUS_OVER="3";  //手工新增
}
