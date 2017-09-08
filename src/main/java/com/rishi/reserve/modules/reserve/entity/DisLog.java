/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.reserve.entity;

import org.hibernate.validator.constraints.Length;
import com.rishi.reserve.modules.sys.entity.User;
import com.rishi.reserve.modules.sys.utils.DictUtils;
import com.rishi.reserve.common.persistence.DataEntity;

/**
 * 就诊病历Entity
 * @author rishi
 * @version 2017-09-07
 */
public class DisLog extends DataEntity<DisLog> {
	
	private static final long serialVersionUID = 1L;
	private String patientName;		// 病人姓名
	private String date;		// 就诊日期
	private String type;		// 就诊类型 : 1 门诊2 急诊
	private String hospital;		// 就诊医院
	private String dept;		// 就诊科室
	private String doctor;		// 医生姓名
	private String reason;		// 就诊原因
	private String result;		// 诊断结果
	private String suggestion;		// 医生建议
	private String chufang;		// 用药处方
	private String jianchabaogao;		// 检查报告
	private String bingli;		// 病历
	private User user;		// 所属用户 : 所属用户
	
	public DisLog() {
		super();
	}

	public DisLog(String id){
		super(id);
	}

	@Length(min=0, max=20, message="病人姓名长度必须介于 0 和 20 之间")
	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	
	@Length(min=0, max=20, message="就诊日期长度必须介于 0 和 20 之间")
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	@Length(min=0, max=1, message="就诊类型 : 1 门诊2 急诊长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}
	public String getTypeName() {
		return DictUtils.getDictLabel(type, "dis_type", "");
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=50, message="就诊医院长度必须介于 0 和 50 之间")
	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	
	@Length(min=0, max=50, message="就诊科室长度必须介于 0 和 50 之间")
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
	
	@Length(min=0, max=50, message="医生姓名长度必须介于 0 和 50 之间")
	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
	
	@Length(min=0, max=200, message="就诊原因长度必须介于 0 和 200 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Length(min=0, max=500, message="诊断结果长度必须介于 0 和 500 之间")
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	@Length(min=0, max=255, message="医生建议长度必须介于 0 和 255 之间")
	public String getSuggestion() {
		return suggestion;
	}

	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	
	@Length(min=0, max=500, message="用药处方长度必须介于 0 和 500 之间")
	public String getChufang() {
		return chufang;
	}

	public void setChufang(String chufang) {
		this.chufang = chufang;
	}
	
	@Length(min=0, max=500, message="检查报告长度必须介于 0 和 500 之间")
	public String getJianchabaogao() {
		return jianchabaogao;
	}

	public void setJianchabaogao(String jianchabaogao) {
		this.jianchabaogao = jianchabaogao;
	}
	
	@Length(min=0, max=100, message="病历长度必须介于 0 和 100 之间")
	public String getBingli() {
		return bingli;
	}

	public void setBingli(String bingli) {
		this.bingli = bingli;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}