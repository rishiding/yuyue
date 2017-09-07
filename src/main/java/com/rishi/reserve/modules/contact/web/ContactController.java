/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.contact.web;

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
import com.rishi.reserve.modules.contact.entity.Contact;
import com.rishi.reserve.modules.contact.service.ContactService;
import com.rishi.reserve.modules.sys.utils.UserUtils;

/**
 * 联系人Controller
 * @author rishi
 * @version 2017-09-06
 */
@Controller
@RequestMapping(value = "${adminPath}/contact/contact")
public class ContactController extends BaseController {

	@Autowired
	private ContactService contactService;
	
	@ModelAttribute
	public Contact get(@RequestParam(required=false) String id) {
		Contact entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contactService.get(id);
		}
		if (entity == null){
			entity = new Contact();
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = {"myContact"})
	public Object myContact(Contact contact, HttpServletRequest request, HttpServletResponse response) {
		if(contact==null){
			contact=new Contact();
		}
		contact.setUser(UserUtils.getUser());
		Page<Contact> page = contactService.findPage(new Page<Contact>(request, response), contact); 
		return new ResponseResult(ResponseCodeCanstants.SUCCESS, page,"成功");
	}

	
	@RequiresPermissions("contact:contact:view")
	@RequestMapping(value = {"list", ""})
	public String list(Contact contact, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(contact==null){
			contact=new Contact();
		}
		contact.setUser(UserUtils.getUser());
		Page<Contact> page = contactService.findPage(new Page<Contact>(request, response), contact); 
		model.addAttribute("page", page);
		return "modules/contact/contactList";
	}

	@RequiresPermissions("contact:contact:view")
	@RequestMapping(value = "form")
	public String form(Contact contact, Model model) {
		model.addAttribute("contact", contact);
		return "modules/contact/contactForm";
	}

	@RequiresPermissions("contact:contact:edit")
	@RequestMapping(value = "save")
	public String save(Contact contact, Model model, RedirectAttributes redirectAttributes) {
		contact.setUser(UserUtils.getUser());
		if (!beanValidator(model, contact)){
			return form(contact, model);
		}
		
		
		contactService.save(contact);
		addMessage(redirectAttributes, "保存联系人成功");
		return "redirect:"+Global.getAdminPath()+"/contact/contact/?repage";
	}
	
	@RequiresPermissions("contact:contact:edit")
	@RequestMapping(value = "delete")
	public String delete(Contact contact, RedirectAttributes redirectAttributes) {
		contactService.delete(contact);
		addMessage(redirectAttributes, "删除联系人成功");
		return "redirect:"+Global.getAdminPath()+"/contact/contact/?repage";
	}

}