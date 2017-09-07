/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.reserve.entity;

import com.rishi.reserve.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import com.rishi.reserve.common.persistence.DataEntity;

/**
 * 预约记录Entity
 * @author rishi
 * @version 2017-09-07
 */
public class ReserveRecord extends DataEntity<ReserveRecord> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 所属用户 : 所属用户
	private String reserveUserId;		// 预约医生
	private User reserveUser;		// 预约医生
	private String reserveDate;		// 预约日期
	private String reserveTime;		// 预约时段
	private String reserveType;		// 预约类型 : 1，普通2，专家
	private String disease;		// 病情
	
	public ReserveRecord() {
		super();
	}

	public ReserveRecord(String id){
		super(id);
	}

	@NotNull(message="所属用户 : 所属用户不能为空")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=1, max=64, message="预约医生长度必须介于 1 和 64 之间")
	public String getReserveUserId() {
		return reserveUserId;
	}

	public void setReserveUserId(String reserveUserId) {
		this.reserveUserId = reserveUserId;
	}
	
	public User getReserveUser() {
		return reserveUser;
	}

	public void setReserveUser(User reserveUser) {
		this.reserveUser = reserveUser;
	}
	@NotNull(message="预约日期不能为空")
	@Length(min=0, max=20, message="预约日期长度必须介于 0 和 20 之间")
	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	
	@Length(min=0, max=20, message="预约时段长度必须介于 0 和 20 之间")
	public String getReserveTime() {
		return reserveTime;
	}

	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}
	
	@Length(min=0, max=2, message="预约类型必须介于 0 和 2 之间")
	public String getReserveType() {
		return reserveType;
	}

	public void setReserveType(String reserveType) {
		this.reserveType = reserveType;
	}
	
	@Length(min=0, max=500, message="病情长度必须介于 0 和 500 之间")
	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}
	
}