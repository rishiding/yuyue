package com.rishi.reserve.modules.sms.web;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.rishi.reserve.common.config.Global;
import com.rishi.reserve.common.config.ResponseCodeCanstants;
import com.rishi.reserve.common.config.ResponseResult;
import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.utils.StringUtils;
import com.rishi.reserve.common.web.BaseController;
import com.rishi.reserve.modules.sms.entity.SmsSendRecord;
import com.rishi.reserve.modules.sms.service.SmsSendRecordService;
import com.rishi.reserve.modules.sys.entity.Office;
import com.rishi.reserve.modules.sys.entity.Role;
import com.rishi.reserve.modules.sys.entity.User;
import com.rishi.reserve.modules.sys.service.SystemService;
import com.rishi.reserve.modules.sys.utils.UserUtils;
import com.rishi.reserve.modules.sys.web.SmsUtils;
/**
 * 短信Controller
 * @author rishi
 * @version 2017-09-05
 */
@Controller
@RequestMapping(value = "${frontPath}/sms")
public class SmsSendFrontController extends BaseController {
private static final int MINUS_TIME=30;//验证码有效期 30分钟
	

	@Autowired
	private SmsSendRecordService manager;
	@Autowired
	private SystemService systemService;

	@ResponseBody
	@RequestMapping(value="/sendCode")
	public Object sendCode(String phone,HttpServletRequest request,HttpServletResponse response){
		Random random = new Random();
		String code = random.nextInt(9) + "" + random.nextInt(9) + random.nextInt(9) + random.nextInt(9); 
		if(SmsUtils.sendValiCode(phone, code)){
			SmsSendRecord bean=new SmsSendRecord();
			bean.setContent(code);
			bean.setTelphone(phone);		
			bean.setSendStatus("1");
			manager.save(bean);
			logger.info("save SmsSendRecord id={}", bean.getId());
			return new ResponseResult(ResponseCodeCanstants.SUCCESS, "发送成功");
		}else{
			return new ResponseResult(ResponseCodeCanstants.FAILED, "发送失败");
		}
	}
	@ResponseBody
	@RequestMapping(value="/checkPhoneCode")
	public Object checkPhoneCode(String code,String phone,HttpServletResponse response){
		if(phone==null||code==null){
			return new ResponseResult(ResponseCodeCanstants.FAILED, "失败");
		}
	
		Page<SmsSendRecord> page=new Page<SmsSendRecord>();
		page.setPageNo(1);
		page.setPageSize(1);
		SmsSendRecord smsSendRecord=new SmsSendRecord();
		smsSendRecord.setTelphone(phone);
		page=manager.findPage(page, smsSendRecord);
		
		if(page.getCount()>0){
			List<SmsSendRecord> list=(List<SmsSendRecord>)page.getList();
			SmsSendRecord bean=list.get(0);
			if(bean!=null&&bean.getContent().equals(code)){
				Timestamp now = new Timestamp(new Date().getTime()-MINUS_TIME*60*1000);
				if(!(bean.getCreateDate().before(now))){					
					return new ResponseResult(ResponseCodeCanstants.SUCCESS, "true");
				}
				
			}
			
		}
		return new ResponseResult(ResponseCodeCanstants.FAILED, "false");
		
	}
	public String checkLoginName(String oldLoginName, String loginName) {
		if (loginName !=null && loginName.equals(oldLoginName)) {
			return "true";
		} else if (loginName !=null && systemService.getUserByLoginName(loginName) == null) {
			return "true";
		}
		return "false";
	}
	@ResponseBody
	@RequestMapping(value = "/register")
	public Object regiester(User user, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		
		// 修正引用赋值问题，不知道为何，Company和Office引用的一个实例地址，修改了一个，另外一个跟着修改。
		user.setCompany(new Office("1"));
		user.setOffice(new Office("1"));
		user.setCreateDate(new Date());
		user.setUpdateDate(new Date());
		// 如果新密码为空，则不更换密码
		if (StringUtils.isNotBlank(user.getPassword())) {
			user.setPassword(SystemService.entryptPassword(user.getPassword()));
		}
		if (!beanValidator(model, user)){
			return new ResponseResult(ResponseCodeCanstants.FAILED, "注册失败");
		}
		if (!"true".equals(checkLoginName(user.getOldLoginName(), user.getLoginName()))){
			
			return new ResponseResult(ResponseCodeCanstants.FAILED, "保存用户'" + user.getLoginName() + "'失败，登录名已存在");
		}
		// 角色数据有效性验证，过滤不在授权内的角色
		List<Role> roleList = Lists.newArrayList();
	
		roleList.add(systemService.getRole("6"));
			
		user.setRoleList(roleList);
		// 保存用户信息
		systemService.saveUser(user);
		// 清除当前用户缓存
		if (user.getLoginName().equals(UserUtils.getUser().getLoginName())){
			UserUtils.clearCache();
			//UserUtils.getCacheMap().clear();
		}
		return new ResponseResult(ResponseCodeCanstants.SUCCESS, "保存用户'" + user.getLoginName() + "'成功");
		
	}
	@ResponseBody
	@RequestMapping(value = "/findUser")
	public Object findUser(User user, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		List<User> list=systemService.findUser(user);
		if(list!=null&&list.size()>0){
			return new ResponseResult(ResponseCodeCanstants.SUCCESS, "ok");
		}else{
			return new ResponseResult(ResponseCodeCanstants.FAILED, "没有找到匹配的用户");
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/resetpassword")
	public Object resetpassword(User user, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		List<User> list=systemService.findUser(user);
		if(list!=null&&list.size()>0){
			User oldUser=list.get(0);
			if (StringUtils.isNotBlank(user.getPassword())) {
				systemService.updatePasswordById(oldUser.getId(), oldUser.getLoginName(), user.getPassword());
				
				return new ResponseResult(ResponseCodeCanstants.SUCCESS, "保存成功");
			}
		}
			return new ResponseResult(ResponseCodeCanstants.FAILED, "数据异常");
		
	}
	
	public static void main(String args[]){
		System.out.println(SystemService.entryptPassword("123"));
	}

}
