/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rishi.reserve.common.config.Global;
import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.web.BaseController;
import com.rishi.reserve.common.utils.StringUtils;
import com.rishi.reserve.modules.sys.entity.SysSystems;
import com.rishi.reserve.modules.sys.service.SysSystemsService;

/**
 * 单表生成Controller
 * @author rishi
 * @version 2017-08-09
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysSystems")
public class SysSystemsController extends BaseController {

	@Autowired
	private SysSystemsService sysSystemsService;
	
	@ModelAttribute
	public SysSystems get(@RequestParam(required=false) String id) {
		SysSystems entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysSystemsService.get(id);
		}
		if (entity == null){
			entity = new SysSystems();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:sysSystems:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysSystems sysSystems, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysSystems> page = sysSystemsService.findPage(new Page<SysSystems>(request, response), sysSystems); 
		model.addAttribute("page", page);
		return "modules/sys/sysSystemsList";
	}

	@RequiresPermissions("sys:sysSystems:view")
	@RequestMapping(value = "form")
	public String form(SysSystems sysSystems, Model model) {
		model.addAttribute("sysSystems", sysSystems);
		return "modules/sys/sysSystemsForm";
	}

	@RequiresPermissions("sys:sysSystems:edit")
	@RequestMapping(value = "save")
	public String save(SysSystems sysSystems, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysSystems)){
			return form(sysSystems, model);
		}
		sysSystemsService.save(sysSystems);
		addMessage(redirectAttributes, "保存系统成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysSystems/?repage";
	}
	
	@RequiresPermissions("sys:sysSystems:edit")
	@RequestMapping(value = "delete")
	public String delete(SysSystems sysSystems, RedirectAttributes redirectAttributes) {
		sysSystemsService.delete(sysSystems);
		addMessage(redirectAttributes, "删除系统成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysSystems/?repage";
	}

}