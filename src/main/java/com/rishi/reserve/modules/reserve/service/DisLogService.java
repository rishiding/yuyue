/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.reserve.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.service.CrudService;
import com.rishi.reserve.modules.reserve.entity.DisLog;
import com.rishi.reserve.modules.reserve.dao.DisLogDao;

/**
 * 就诊病历Service
 * @author rishi
 * @version 2017-09-07
 */
@Service
@Transactional(readOnly = true)
public class DisLogService extends CrudService<DisLogDao, DisLog> {

	public DisLog get(String id) {
		return super.get(id);
	}
	
	public List<DisLog> findList(DisLog disLog) {
		return super.findList(disLog);
	}
	
	public Page<DisLog> findPage(Page<DisLog> page, DisLog disLog) {
		return super.findPage(page, disLog);
	}
	
	@Transactional(readOnly = false)
	public void save(DisLog disLog) {
		super.save(disLog);
	}
	
	@Transactional(readOnly = false)
	public void delete(DisLog disLog) {
		super.delete(disLog);
	}
	
}