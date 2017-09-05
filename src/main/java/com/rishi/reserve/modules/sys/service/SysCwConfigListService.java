/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.service.CrudService;
import com.rishi.reserve.modules.sys.entity.SysCwConfigList;
import com.rishi.reserve.modules.sys.dao.SysCwConfigListDao;

/**
 * 床位一览表配置Service
 * @author rishi
 * @version 2017-07-13
 */
@Service
@Transactional(readOnly = true)
public class SysCwConfigListService extends CrudService<SysCwConfigListDao, SysCwConfigList> {

	public SysCwConfigList get(String id) {
		return super.get(id);
	}
	
	public List<SysCwConfigList> findList(SysCwConfigList sysCwConfigList) {
		return super.findList(sysCwConfigList);
	}
	
	public Page<SysCwConfigList> findPage(Page<SysCwConfigList> page, SysCwConfigList sysCwConfigList) {
		return super.findPage(page, sysCwConfigList);
	}
	
	@Transactional(readOnly = false)
	public void save(SysCwConfigList sysCwConfigList) {
		super.save(sysCwConfigList);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysCwConfigList sysCwConfigList) {
		super.delete(sysCwConfigList);
	}
	
}