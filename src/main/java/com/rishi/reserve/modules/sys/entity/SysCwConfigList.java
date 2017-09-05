/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.rishi.reserve.common.persistence.DataEntity;

/**
 * 床位一览表配置Entity
 * @author rishi
 * @version 2017-07-13
 */
public class SysCwConfigList extends DataEntity<SysCwConfigList> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// name
	private String displayName;		// display_name
	private String officeid;		// officeid
	private String color;		// color
	private String label;		// color
	



	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public SysCwConfigList() {
		super();
	}

	public SysCwConfigList(String id){
		super(id);
	} 
 
	@Length(min=1, max=64, message="name长度必须介于 1 和 64 之间")
	public String getName() {
		return name;
	} 

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=64, message="display_name长度必须介于 1 和 64 之间") 
	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	
	@Length(min=1, max=64, message="officeid长度必须介于 1 和 64 之间")
	public String getOfficeid() {
		return officeid;
	}

	public void setOfficeid(String officeid) {
		this.officeid = officeid;
	}
	
	@Length(min=1, max=64, message="color长度必须介于 1 和 64 之间")
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
}