/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.service.CrudService;
import com.rishi.reserve.modules.sys.entity.SysSystems;
import com.rishi.reserve.modules.sys.dao.SysSystemsDao;

/**
 * 单表生成Service
 * @author rishi
 * @version 2017-08-09
 */
@Service
@Transactional(readOnly = true)
public class SysSystemsService extends CrudService<SysSystemsDao, SysSystems> {

	public SysSystems get(String id) {
		return super.get(id);
	}
	
	public List<SysSystems> findList(SysSystems sysSystems) {
		return super.findList(sysSystems);
	}
	
	public Page<SysSystems> findPage(Page<SysSystems> page, SysSystems sysSystems) {
		return super.findPage(page, sysSystems);
	}
	
	@Transactional(readOnly = false)
	public void save(SysSystems sysSystems) {
		super.save(sysSystems);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysSystems sysSystems) {
		super.delete(sysSystems);
	}
	
}