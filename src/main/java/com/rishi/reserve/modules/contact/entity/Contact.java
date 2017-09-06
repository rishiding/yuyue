/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.contact.entity;

import com.rishi.reserve.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import com.rishi.reserve.common.persistence.DataEntity;

/**
 * 联系人Entity
 * @author rishi
 * @version 2017-09-06
 */
public class Contact extends DataEntity<Contact> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 所属用户
	private String name;		// 姓名
	private String gender;		// 性别
	private String birthday;		// 出生日期
	private String nickName;		// 昵称
	private String headImg;		// 头像
	private String telphone;		// 手机号
	private String height;		// 身高
	private String weight;		// 体重
	
	public Contact() {
		super();
	}

	public Contact(String id){
		super(id);
	}

	@NotNull(message="所属用户不能为空")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=1, max=255, message="姓名长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=2, message="性别长度必须介于 0 和 2 之间")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Length(min=0, max=50, message="出生日期长度必须介于 0 和 50 之间")
	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	@Length(min=0, max=100, message="昵称长度必须介于 0 和 100 之间")
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	@Length(min=0, max=500, message="头像长度必须介于 0 和 500 之间")
	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	
	@Length(min=0, max=200, message="手机号长度必须介于 0 和 200 之间")
	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	
	@Length(min=0, max=10, message="身高长度必须介于 0 和 10 之间")
	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}
	
	@Length(min=0, max=20, message="体重长度必须介于 0 和 20 之间")
	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}
	
}