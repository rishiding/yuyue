/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sys.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.rishi.reserve.common.persistence.DataEntity;

/**
 * 单表生成Entity
 * @author rishi
 * @version 2017-08-09
 */
public class SysSystems extends DataEntity<SysSystems> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 系统名
	private String url;		// 系统地址
	private String icon;		// 系统图标
	private String note;		// 备注
	private String modifyBy;		// modify_by
	private Date modifyDate;		// modify_date
	
	public SysSystems() {
		super();
	}

	public SysSystems(String id){
		super(id);
	}

	@Length(min=0, max=128, message="系统名长度必须介于 0 和 128 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=1024, message="系统地址长度必须介于 0 和 1024 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=100, message="系统图标长度必须介于 0 和 100 之间")
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	@Length(min=0, max=100, message="备注长度必须介于 0 和 100 之间")
	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	public String getModifyBy() {
		return modifyBy;
	}

	public void setModifyBy(String modifyBy) {
		this.modifyBy = modifyBy;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
}