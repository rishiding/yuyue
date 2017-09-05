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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rishi.reserve.common.config.Global;
import com.rishi.reserve.common.config.ResponseCodeCanstants;
import com.rishi.reserve.common.config.ResponseResult;
import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.web.BaseController;
import com.rishi.reserve.common.utils.StringUtils;
import com.rishi.reserve.modules.sys.entity.SysCwConfigList;
import com.rishi.reserve.modules.sys.service.SysCwConfigListService;

/**
 * 床位一览表配置Controller
 * @author rishi
 * @version 2017-07-13
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysCwConfigList")
public class SysCwConfigListController extends BaseController {

	@Autowired
	private SysCwConfigListService sysCwConfigListService;
	// 查询到历史交接班记录
		@ResponseBody
		@RequestMapping(value = "getConfig") 
		public Object getCWListConfig(){   
			SysCwConfigList configList = new SysCwConfigList();
			try {
				return new ResponseResult(ResponseCodeCanstants.SUCCESS, sysCwConfigListService.findList(configList), "操作成功");
			} catch (Exception e) {
				return new ResponseResult(ResponseCodeCanstants.FAILED, "操作失败");
			}
		}
	@ModelAttribute
	public SysCwConfigList get(@RequestParam(required=false) String id) {
		SysCwConfigList entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysCwConfigListService.get(id);
		}
		if (entity == null){
			entity = new SysCwConfigList();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:sysCwConfigList:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysCwConfigList sysCwConfigList, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysCwConfigList> page = sysCwConfigListService.findPage(new Page<SysCwConfigList>(request, response), sysCwConfigList); 
		model.addAttribute("page", page);
		return "modules/sys/sysCwConfigListList";
	}

	@RequiresPermissions("sys:sysCwConfigList:view")
	@RequestMapping(value = "form")
	public String form(SysCwConfigList sysCwConfigList, Model model) {
		model.addAttribute("sysCwConfigList", sysCwConfigList);
		return "modules/sys/sysCwConfigListForm";
	}

	@RequiresPermissions("sys:sysCwConfigList:edit")
	@RequestMapping(value = "save")
	public String save(SysCwConfigList sysCwConfigList, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysCwConfigList)){
			return form(sysCwConfigList, model);
		}
		sysCwConfigListService.save(sysCwConfigList);
		addMessage(redirectAttributes, "保存床位一览表配置成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysCwConfigList/?repage";
	}
	
	@RequiresPermissions("sys:sysCwConfigList:edit")
	@RequestMapping(value = "delete")
	public String delete(SysCwConfigList sysCwConfigList, RedirectAttributes redirectAttributes) {
		sysCwConfigListService.delete(sysCwConfigList);
		addMessage(redirectAttributes, "删除床位一览表配置成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysCwConfigList/?repage";
	}

}