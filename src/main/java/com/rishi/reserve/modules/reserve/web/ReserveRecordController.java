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
import com.rishi.reserve.modules.reserve.entity.ReserveRecord;
import com.rishi.reserve.modules.reserve.service.ReserveRecordService;
import com.rishi.reserve.modules.sys.utils.UserUtils;

/**
 * 预约记录Controller
 * @author rishi
 * @version 2017-09-07
 */
@Controller
@RequestMapping(value = "${adminPath}/reserve/reserveRecord")
public class ReserveRecordController extends BaseController {

	@Autowired
	private ReserveRecordService reserveRecordService;
	
	@ModelAttribute
	public ReserveRecord get(@RequestParam(required=false) String id) {
		ReserveRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = reserveRecordService.get(id);
		}
		if (entity == null){
			entity = new ReserveRecord();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = {"reserveRecords", ""})
	public Object reserveList(ReserveRecord reserveRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		reserveRecord.setUser(UserUtils.getUser());
		Page<ReserveRecord> page=reserveRecordService.findPage(new Page<ReserveRecord> (request, response), reserveRecord);
		return new ResponseResult(ResponseCodeCanstants.SUCCESS,page, "成功");
	}
	
	@RequiresPermissions("reserve:reserveRecord:view")
	@RequestMapping(value = {"list", ""})
	public String list(ReserveRecord reserveRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ReserveRecord> page = reserveRecordService.findPage(new Page<ReserveRecord>(request, response), reserveRecord); 
		model.addAttribute("page", page);
		return "modules/reserve/reserveRecordList";
	}

	@RequiresPermissions("reserve:reserveRecord:view")
	@RequestMapping(value = "form")
	public String form(ReserveRecord reserveRecord, Model model) {
		model.addAttribute("reserveRecord", reserveRecord);
		return "modules/reserve/reserveRecordForm";
	}

	@RequiresPermissions("reserve:reserveRecord:edit")
	@RequestMapping(value = "save")
	public String save(ReserveRecord reserveRecord, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, reserveRecord)){
			return form(reserveRecord, model);
		}
		reserveRecordService.save(reserveRecord);
		addMessage(redirectAttributes, "保存预约记录成功");
		return "redirect:"+Global.getAdminPath()+"/reserve/reserveRecord/?repage";
	}
	
	@RequiresPermissions("reserve:reserveRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(ReserveRecord reserveRecord, RedirectAttributes redirectAttributes) {
		reserveRecordService.delete(reserveRecord);
		addMessage(redirectAttributes, "删除预约记录成功");
		return "redirect:"+Global.getAdminPath()+"/reserve/reserveRecord/?repage";
	}
	
	@RequiresPermissions("reserve:reserveRecord:edit")
	@RequestMapping(value = "cancel")
	public String cancel(ReserveRecord reserveRecord, RedirectAttributes redirectAttributes) {
		reserveRecord=reserveRecordService.get(reserveRecord);
		if(reserveRecord==null||reserveRecord.getStatus().equals("2")){
			addMessage(redirectAttributes, "已经取消");
		}else{
			reserveRecord.setStatus("2");
			reserveRecordService.update(reserveRecord);
			addMessage(redirectAttributes, "取消成功");
		}
		return "redirect:"+Global.getAdminPath()+"/reserve/reserveRecord/list?repage";
	}

}