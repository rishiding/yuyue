/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.reserve.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rishi.reserve.common.config.Global;
import com.rishi.reserve.common.config.ResponseCodeCanstants;
import com.rishi.reserve.common.config.ResponseResult;
import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.web.BaseController;
import com.rishi.reserve.modules.reserve.entity.ReserveRecord;
import com.rishi.reserve.modules.reserve.service.ReserveRecordService;
import com.rishi.reserve.modules.sys.entity.User;
import com.rishi.reserve.modules.sys.service.SystemService;
import com.rishi.reserve.modules.sys.utils.UserUtils;

/**
 * 预约Controller
 * @author rishi
 * @version 2017-09-07
 */
@Controller
@RequestMapping(value = "${frontPath}/reserve")
public class ReserveFrontController extends BaseController {
	@Autowired
	SystemService systemService;
	
	@Autowired
	private ReserveRecordService reserveRecordService;
	
	
	
	
	@RequestMapping(value = {"index", ""})
	public String index(  HttpServletRequest request, HttpServletResponse response, Model model) {
		request.getSession().setAttribute("_tab", "reserve");
		return "modules/reserve/index";
	}
	@RequestMapping(value = {"help", ""})
	public String help(  HttpServletRequest request, HttpServletResponse response, Model model) {
		request.getSession().setAttribute("_tab", "help");
		return "modules/reserve/help";
	}
	
	@RequestMapping(value = {"doctorInfo", ""})
	public String doctorInfo(@RequestParam("userid") String userid,   Model model) {
		User doctor=systemService.getUser(userid);
		model.addAttribute("doctor", doctor);
		if(UserUtils.getPrincipal()!=null){
			model.addAttribute("user", UserUtils.getUser());
		}
		return "modules/reserve/doctorInfo";
	}
	@ResponseBody
	@RequestMapping(value = {"doctor", ""})
	public Object doctor(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		Page<User> page= systemService.findUser(new Page<User> (request, response), user);
		model.addAttribute("page", page);
		return new ResponseResult(ResponseCodeCanstants.SUCCESS,page, "成功");
	}
	

	
	@RequestMapping(value = "save")
	public String save(ReserveRecord reserveRecord, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, reserveRecord)){
			return doctorInfo(reserveRecord.getReserveUserId(), model);
		}
		reserveRecordService.save(reserveRecord);
		addMessage(redirectAttributes, "保存预约记录成功");
		return "redirect:"+Global.getFrontPath()+"/reserve/index?repage";
	}
	
}