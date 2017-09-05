package com.rishi.reserve.common.utils.excel;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.rishi.reserve.common.utils.IdGen;

import freemarker.template.TemplateException;

public abstract class ExportExcelUtil {
	
	abstract  File parse(String templateDir,String templateName,String excelPath,Map<String,Object> data) throws IOException, TemplateException;
	
	abstract  byte[] parse(String templateDir,String templateName,Map<String,Object> data) throws IOException, TemplateException;
	
	abstract String parse(String templateStr, Map<String, Object> data) throws IOException, TemplateException;
	
	public File ExportInHospExcel(HttpServletRequest request, Map<String,Object> data) throws IOException, TemplateException{
		return parse(request.getSession().getServletContext().getRealPath("/WEB-INF/views/tpl"), "excelTemplete4.ftl", IdGen.uuid() + ".xls", data);
	}

}
 