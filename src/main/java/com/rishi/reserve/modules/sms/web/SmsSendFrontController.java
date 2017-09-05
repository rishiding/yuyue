package com.rishi.reserve.modules.sms.web;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rishi.reserve.common.config.ResponseCodeCanstants;
import com.rishi.reserve.common.config.ResponseResult;
import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.web.BaseController;
import com.rishi.reserve.modules.sms.entity.SmsSendRecord;
import com.rishi.reserve.modules.sms.service.SmsSendRecordService;
import com.rishi.reserve.modules.sys.web.SmsUtils;
/**
 * 短信Controller
 * @author rishi
 * @version 2017-09-05
 */
@Controller
@RequestMapping(value = "${frontPath}/sms")
public class SmsSendFrontController extends BaseController {
private static final int MINUS_TIME=30;//验证码有效期 30分钟
	

	@Autowired
	private SmsSendRecordService manager;
	
	@ResponseBody
	@RequestMapping(value="/sendCode")
	public Object sendCode(String phone,HttpServletRequest request,HttpServletResponse response){
		Random random = new Random();
		String code = random.nextInt(9) + "" + random.nextInt(9) + random.nextInt(9) + random.nextInt(9); 
		if(SmsUtils.sendValiCode(phone, code)){
			SmsSendRecord bean=new SmsSendRecord();
			bean.setContent(code);
			bean.setTelphone(phone);		
			bean.setSendStatus("1");
			manager.save(bean);
			logger.info("save SmsSendRecord id={}", bean.getId());
			return new ResponseResult(ResponseCodeCanstants.SUCCESS, "发送成功");
		}else{
			return new ResponseResult(ResponseCodeCanstants.FAILED, "发送失败");
		}
	}
	@ResponseBody
	@RequestMapping(value="/checkPhoneCode")
	public Object checkPhoneCode(String code,String phone,HttpServletResponse response){
		if(phone==null||code==null){
			return new ResponseResult(ResponseCodeCanstants.FAILED, "失败");
		}
	
		Page<SmsSendRecord> page=new Page<SmsSendRecord>();
		page.setPageNo(1);
		page.setPageSize(1);
		SmsSendRecord smsSendRecord=new SmsSendRecord();
		smsSendRecord.setTelphone(phone);
		page=manager.findPage(page, smsSendRecord);
		
		if(page.getCount()>0){
			List<SmsSendRecord> list=(List<SmsSendRecord>)page.getList();
			SmsSendRecord bean=list.get(0);
			if(bean!=null&&bean.getContent().equals(code)){
				Timestamp now = new Timestamp(new Date().getTime()-MINUS_TIME*60*1000);
				if(!(bean.getCreateDate().before(now))){					
					return new ResponseResult(ResponseCodeCanstants.SUCCESS, "true");
				}
				
			}
			
		}
		return new ResponseResult(ResponseCodeCanstants.FAILED, "false");
		
	}

}
