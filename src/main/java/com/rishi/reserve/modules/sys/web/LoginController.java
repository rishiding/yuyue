/**
 * Copyright &copy; 2017-2017<a href="#">rishi</a> All rights reserved.
 */
package com.rishi.reserve.modules.sys.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.ThreadContext;
import org.apache.shiro.web.subject.WebSubject;
import org.apache.shiro.web.subject.WebSubject.Builder;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.rishi.reserve.common.config.Global;
import com.rishi.reserve.common.config.ResponseCodeCanstants;
import com.rishi.reserve.common.config.ResponseResult;
import com.rishi.reserve.common.security.shiro.session.SessionDAO;
import com.rishi.reserve.common.servlet.ValidateCodeServlet;
import com.rishi.reserve.common.utils.CacheUtils;
import com.rishi.reserve.common.utils.CookieUtils;
import com.rishi.reserve.common.utils.IdGen;
import com.rishi.reserve.common.utils.StringUtils;
import com.rishi.reserve.common.web.BaseController;
import com.rishi.reserve.modules.sys.entity.SysSystems;
import com.rishi.reserve.modules.sys.entity.User;
import com.rishi.reserve.modules.sys.security.FormAuthenticationFilter;
import com.rishi.reserve.modules.sys.security.SystemAuthorizingRealm;
import com.rishi.reserve.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.rishi.reserve.modules.sys.service.SysSystemsService;
import com.rishi.reserve.modules.sys.service.SystemService;
import com.rishi.reserve.modules.sys.utils.UserUtils;

/**
 * 登录Controller
 * @author ThinkGem
 * @version 2013-5-31
 */
@Controller
public class LoginController extends BaseController{
	
	@Autowired
	private SessionDAO sessionDAO;
	
	@Autowired
	private SysSystemsService sysSystemsService;
	
	private static String LOGINED="LOGINED";
	
	/**
	 * 管理登录 
	 */
	@RequestMapping(value = "${adminPath}/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		Principal principal = UserUtils.getPrincipal();		
		if (logger.isDebugEnabled()){
			logger.debug("login, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}
		
		// 如果已登录，再次访问主页，则退出原账号。
		if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
			CookieUtils.setCookie(response, LOGINED, "false");
		}
		 
		// 如果已经登录，则跳转到管理首页
		if(principal != null && !principal.isMobileLogin()){
			return "redirect:" + adminPath;
		}

		return "modules/sys/sysLogin";
	}
	@ResponseBody
	@RequestMapping(value = "${frontPath}/userLogin")
	public Object userLogin(HttpServletRequest request,HttpServletResponse response,String username,String password, Model model){
		if (username==null||StringUtils.isBlank(username) ||password==null||StringUtils.isBlank(password) ){
			return new ResponseResult(ResponseCodeCanstants.FAILED, null, "用户名、密码不能为空");
		}
		Principal principal = UserUtils.getPrincipal();		
		// 如果已经登录，则跳转到管理首页
		if(principal != null){
			User user = UserUtils.getUser();
			return new ResponseResult(ResponseCodeCanstants.SUCCESS, user, "用户已经登录");
		}
		User user=UserUtils.getByLoginName(username);
		if(user==null){
			return new ResponseResult(ResponseCodeCanstants.FAILED, null, "用户名错误");
		}
		if(SystemService.validatePassword(password, user.getPassword())){			
			 loginShiro(request,response,user);
		      
		      return new ResponseResult(ResponseCodeCanstants.SUCCESS, user, "登录成功");
		}else{
			return new ResponseResult(ResponseCodeCanstants.FAILED, null, "密码错误");
		}
		
		
	}
	private void loginShiro(HttpServletRequest request,HttpServletResponse response,User user){
		PrincipalCollection principals =new SimplePrincipalCollection(new SystemAuthorizingRealm.Principal(user,false), user.getLoginName());;   
		Builder builder = new WebSubject.Builder( request,response);  
		builder.principals(principals);  
		builder.authenticated(true);  
		WebSubject subject = builder.buildWebSubject();  
		ThreadContext.bind(subject); 
	}
	/**
	 * 登录失败，真正登录的POST请求由Filter完成
	 */
	@RequestMapping(value = "${adminPath}/register")
	public String register(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/sys/register";
	}
	@RequestMapping(value = "${adminPath}/findpassword")
	public String findpassword(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/sys/findpassword";
	}
	/**
	 * 登录失败，真正登录的POST请求由Filter完成
	 */
	@RequestMapping(value = "${adminPath}/login", method = RequestMethod.POST)
	public String loginFail(HttpServletRequest request, HttpServletResponse response, Model model) {
		Principal principal = UserUtils.getPrincipal();
		
		// 如果已经登录，则跳转到管理首页
		if(principal != null){
			return "redirect:" + adminPath;
		}
 
		String username = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
		boolean rememberMe = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM);
		boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
		String exception = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		String message = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);
		
		if (StringUtils.isBlank(message) || StringUtils.equals(message, "null")){
			message = "用户或密码错误, 请重试.";
		}

		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MOBILE_PARAM, mobile); 
		model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);
		 
		if (logger.isDebugEnabled()){
			logger.debug("login fail, active session size: {}, message: {}, exception: {}", 
					sessionDAO.getActiveSessions(false).size(), message, exception);
		}
		
		// 非授权异常，登录失败，验证码加1。
		if (!UnauthorizedException.class.getName().equals(exception)){
			model.addAttribute("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
		}
		
		// 验证失败清空验证码
		request.getSession().setAttribute(ValidateCodeServlet.VALIDATE_CODE, IdGen.uuid());
		
		// 如果是手机登录，则返回JSON字符串
		if (mobile){
	        return renderString(response, model);
		}
		
		return "modules/sys/sysLogin";
	}

	/**
	 * 登录成功，进入管理首页
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "${adminPath}")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		Principal principal = UserUtils.getPrincipal();

		// 登录成功后，验证码计算器清零
		isValidateCodeLogin(principal.getLoginName(), false, true);
		
		if (logger.isDebugEnabled()){
			logger.debug("show index, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}
		User user=UserUtils.getUser();
		model.addAttribute("user", user);
		request.getSession().setAttribute("_tab", "index");
		// 如果已登录，再次访问主页，则退出原账号。
		if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
			String logined = CookieUtils.getCookie(request, LOGINED);
			if (StringUtils.isBlank(logined) || "false".equals(logined)){
				CookieUtils.setCookie(response, LOGINED, "true");
			}else if (StringUtils.equals(logined, "true")){
				UserUtils.getSubject().logout();
				return "redirect:" + adminPath + "/login";
			}
		}
		
		// 如果是手机登录，则返回JSON字符串
		if (principal.isMobileLogin()){
			if (request.getParameter("login") != null){
				return renderString(response, principal);
			}
			if (request.getParameter("index") != null){
				return "modules/sys/sysIndex";
			}
			return "redirect:" + adminPath + "/login";
		}
		

		return "modules/sys/sysIndex";
	}
	
	
	@RequestMapping(value = "${adminPath}/sys/index")
	public String sysIndex(HttpServletRequest request, HttpServletResponse response, Model model) {		
		java.util.List<SysSystems> sysList=sysSystemsService.findList(new SysSystems());
		User user=UserUtils.getUser();
		model.addAttribute("sysList", sysList);
		model.addAttribute("user", user);
		return "modules/sys/index";
	}
	
	/**
	 * 获取主题方案
	 */
	@RequestMapping(value = "/theme/{theme}")
	public String getThemeInCookie(@PathVariable String theme, HttpServletRequest request, HttpServletResponse response){
		String theme1="theme";
		if (StringUtils.isNotBlank(theme)){
			CookieUtils.setCookie(response, theme1, theme);
		}else{
			theme = CookieUtils.getCookie(request, theme1);
		}
		return "redirect:"+request.getParameter("url");
	}
	
	/**
	 * 是否是验证码登录
	 * @param useruame 用户名
	 * @param isFail 计数加1
	 * @param clean 计数清零
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean){
		Map<String, Integer> loginFailMap = (Map<String, Integer>)CacheUtils.get("loginFailMap");
		if (loginFailMap==null){
			loginFailMap = Maps.newHashMap();
			CacheUtils.put("loginFailMap", loginFailMap);
		}
		Integer loginFailNum = loginFailMap.get(useruame);
		if (loginFailNum==null){
			loginFailNum = 0;
		}
		if (isFail){
			loginFailNum++;
			loginFailMap.put(useruame, loginFailNum);
		}
		if (clean){
			loginFailMap.remove(useruame);
		}
		return loginFailNum >= 3;
	}
}
