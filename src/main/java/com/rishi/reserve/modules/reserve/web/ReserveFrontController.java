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
import org.springframework.web.bind.annotation.ResponseBody;

import com.rishi.reserve.common.config.ResponseCodeCanstants;
import com.rishi.reserve.common.config.ResponseResult;
import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.web.BaseController;
import com.rishi.reserve.modules.sys.entity.User;
import com.rishi.reserve.modules.sys.service.SystemService;

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
	@ResponseBody
	@RequestMapping(value = {"doctor", ""})
	public Object doctor(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		Page<User> page= systemService.findUser(new Page<User> (request, response), user);
		model.addAttribute("page", page);
		return new ResponseResult(ResponseCodeCanstants.SUCCESS,page, "成功");
	}

	
}