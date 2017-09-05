/**
 * Copyright &copy; 2017-2017<a href="#">rishi</a> All rights reserved.
 */
package com.rishi.reserve.modules.sys.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rishi.reserve.common.config.ResponseCodeCanstants;
import com.rishi.reserve.common.utils.StringUtils;
import com.rishi.reserve.common.web.BaseController;
import com.rishi.reserve.common.config.ResponseResult;
import com.rishi.reserve.modules.sys.entity.User;
import com.rishi.reserve.modules.sys.utils.UserUtils;

/**
 * 用户Controller
 * @author ThinkGem
 * @version 2013-8-29
 */
@Controller
@RequestMapping(value = "${frontPath}/user")
public class UserFrontController extends BaseController {


	@ResponseBody
	@RequestMapping(value = {"getCurrentUser"})
	public Object getCurrentUser() {
		User user = UserUtils.getUser();
		if (user!=null&&StringUtils.isNotBlank(user.getName())){
			return new ResponseResult(ResponseCodeCanstants.SUCCESS, user, "成功");
		}else{
			return new ResponseResult(ResponseCodeCanstants.NOAUTH, null, "没有登录");
		}
	}


}
