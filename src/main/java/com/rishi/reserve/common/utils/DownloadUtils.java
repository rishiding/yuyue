package com.rishi.reserve.common.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.time.DateFormatUtils;

import eu.bitwalker.useragentutils.Browser;

public class DownloadUtils {
	
	public static String startDate = "";
	public static String endDate = "";
	 
	public String getRealPath(){
		return this.getClass().getClassLoader().getResource("").getPath(); 
	} 
	
	public String createSQLFile(){
		String pathName = getRealPath().substring(1,2)+":/SQLStore/"+DateUtils.getDate("yyyy-MM-dd")+".sql";
		CreateFileUtil.createFile(pathName);
		return pathName;  
	}  
	
		
	public static void downLoad(HttpServletRequest request,HttpServletResponse response, File file,String filename){
		 

		try { 
			InputStream fis = new BufferedInputStream(new FileInputStream(file));

			// 清空response
			response.reset(); 
			// 设置response的Header
			 response.setContentType("application/vnd.ms-excel;charset=utf-8");

				if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {  
				    filename = URLEncoder.encode(filename, "UTF-8");  
				} else {  
				    filename = new String(filename.getBytes("UTF-8"), "ISO8859-1");  
				}  
			response.addHeader("Content-Disposition","attachment;filename=\"" + filename + "\"");
			response.addHeader("Content-Length", "" + file.length());
			
			
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream()); 
			 
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = fis.read(buff, 0, buff.length))) { 
				toClient.write(buff, 0, bytesRead);
			} 
			 
			toClient.flush();
			response.flushBuffer(); 	
			
			fis.close(); 
			toClient.close(); 
			file.delete(); 
		} catch (FileNotFoundException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	} 
	
	
	public void getStartDateAndEndDate(String date){

		try {
			if (StringUtils.isEmpty(date)) { 
				date = DateUtils.getDate("yyyy-MM-dd"); 
			}  
			startDate = getEndTime(date);
			endDate = getEndDate(date);
		} catch (ParseException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 
	private String getEndTime(String date){		 
		return date + " 08";
	}
	
	private String getEndDate(String date) throws ParseException {
		SimpleDateFormat dft = DateUtils.getSimpleDateFormat(DateUtils.ymdh); 
 
		Calendar calendar = DateUtils.getCalendarAtTime(DateUtils.ymdh, getEndTime(date));
		calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
		String endDate = dft.format(calendar.getTime());
		return endDate;
	} 

}
