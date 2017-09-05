/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sms.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.web.BaseController;
import com.rishi.reserve.modules.sms.entity.SmsSendRecord;
import com.rishi.reserve.modules.sms.service.SmsSendRecordService;

/**
 * 短信Controller
 * @author rishi
 * @version 2017-09-05
 */
@Controller
@RequestMapping(value = "${adminPath}/sms/smsSendRecord")
public class SmsSendRecordController extends BaseController {

	@Autowired
	private SmsSendRecordService smsSendRecordService;
	
	
	
	@RequiresPermissions("sms:smsSendRecord:view")
	@RequestMapping(value = {"list", ""})
	public String list(SmsSendRecord smsSendRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SmsSendRecord> page = smsSendRecordService.findPage(new Page<SmsSendRecord>(request, response), smsSendRecord); 
		model.addAttribute("page", page);
		return "modules/sms/smsSendRecordList";
	}

	
	

}