package com.rishi.reserve.modules.sys.web;

import com.taobao.api.TaobaoClient;


import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

/**
 * 短信发送方法
 * @author rishi.ding
 * @date 2017-01-25
 */
public class SmsUtils {
	private static String url="http://gw.api.taobao.com/router/rest";
	private static String appkey="23563197";
	private static String secret="0b769624277fc00a53cd796e3749397d";
	private static String signName="彩虹医学网";
	
	private static String VALICODE_TEMPLATE="SMS_58145317";
	
/**
 * 发送注册验证码
 * @param telphones
 * @param content
 * @throws ApiException
 */
	public static boolean sendValiCode(String telphone,String code){
		String param="{\"code\":'"+code+"'}";
		return sendMsg(telphone,VALICODE_TEMPLATE,param);		
	}	
	
	private static boolean sendMsg(String telphone,String msg_template,String param) {
		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend("");
		req.setSmsType("normal");
		req.setSmsFreeSignName(signName);
		req.setSmsParamString(param);
		req.setRecNum(telphone);
		req.setSmsTemplateCode(msg_template);
		AlibabaAliqinFcSmsNumSendResponse rsp;
		try {
			rsp = client.execute(req);
			if(rsp.getResult()==null){
				return false;
			}
			return rsp.getResult().getSuccess();
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	
	
	public static void main(String[] args) {
					SmsUtils.sendValiCode("18111266553","1233");

		
	}

}
