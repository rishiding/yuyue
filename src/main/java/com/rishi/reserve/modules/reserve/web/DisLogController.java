/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.reserve.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rishi.reserve.common.config.Global;
import com.rishi.reserve.common.config.ResponseCodeCanstants;
import com.rishi.reserve.common.config.ResponseResult;
import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.web.BaseController;
import com.rishi.reserve.common.utils.StringUtils;
import com.rishi.reserve.modules.reserve.entity.DisLog;
import com.rishi.reserve.modules.reserve.service.DisLogService;
import com.rishi.reserve.modules.sys.utils.UserUtils;

/**
 * 就诊病历Controller
 * @author rishi
 * @version 2017-09-07
 */
@Controller
@RequestMapping(value = "${adminPath}/reserve/disLog")
public class DisLogController extends BaseController {

	@Autowired
	private DisLogService disLogService;
	
	@ModelAttribute
	public DisLog get(@RequestParam(required=false) String id) {
		DisLog entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = disLogService.get(id);
		}
		if (entity == null){
			entity = new DisLog();
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = {"records", ""})
	public Object records(DisLog disLog, HttpServletRequest request, HttpServletResponse response, Model model) {
		disLog.setUser(UserUtils.getUser());
		Page<DisLog> page = disLogService.findPage(new Page<DisLog>(request, response), disLog); 
		
		return new ResponseResult(ResponseCodeCanstants.SUCCESS,page, "成功");
	}
	
	@RequiresPermissions("reserve:disLog:view")
	@RequestMapping(value = {"list", ""})
	public String list(DisLog disLog, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DisLog> page = disLogService.findPage(new Page<DisLog>(request, response), disLog); 
		model.addAttribute("page", page);
		return "modules/reserve/disLogList";
	}

	@RequiresPermissions("reserve:disLog:view")
	@RequestMapping(value = "form")
	public String form(DisLog disLog, Model model) {
		model.addAttribute("disLog", disLog);
		return "modules/reserve/disLogForm";
	}

	@RequiresPermissions("reserve:disLog:edit")
	@RequestMapping(value = "save")
	public String save(DisLog disLog, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, disLog)){
			return form(disLog, model);
		}
		disLogService.save(disLog);
		addMessage(redirectAttributes, "保存就诊病历成功");
		return "redirect:"+Global.getAdminPath()+"/reserve/disLog/list?repage";
	}
	
	@RequiresPermissions("reserve:disLog:edit")
	@RequestMapping(value = "delete")
	public String delete(DisLog disLog, RedirectAttributes redirectAttributes) {
		disLogService.delete(disLog);
		addMessage(redirectAttributes, "删除就诊病历成功");
		return "redirect:"+Global.getAdminPath()+"/reserve/disLog/?repage";
	}

}