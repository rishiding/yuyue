/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sms.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.rishi.reserve.common.persistence.DataEntity;

/**
 * 短信Entity
 * @author rishi
 * @version 2017-09-05
 */
public class SmsSendRecord extends DataEntity<SmsSendRecord> {
	
	private static final long serialVersionUID = 1L;
	private String telphone;		// 接收手机号
	private String content;		// 内容
	private String sendStatus;		// 发送状态
	private String sendOutBody;		// 发送结果
	
	private Date beginDate;		// 开始日期
	private Date endDate;		// 结束日期
	
	public SmsSendRecord() {
		super();
	}

	public SmsSendRecord(String id){
		super(id);
	}

	@Length(min=1, max=20, message="接收手机号长度必须介于 1 和 20 之间")
	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	
	@Length(min=0, max=255, message="内容长度必须介于 0 和 255 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=20, message="发送状态长度必须介于 0 和 20 之间")
	public String getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(String sendStatus) {
		this.sendStatus = sendStatus;
	}
	
	@Length(min=0, max=255, message="发送结果长度必须介于 0 和 255 之间")
	public String getSendOutBody() {
		return sendOutBody;
	}

	public void setSendOutBody(String sendOutBody) {
		this.sendOutBody = sendOutBody;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
}