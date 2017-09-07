/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.reserve.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.service.CrudService;
import com.rishi.reserve.modules.reserve.entity.ReserveRecord;
import com.rishi.reserve.modules.reserve.dao.ReserveRecordDao;

/**
 * 预约记录Service
 * @author rishi
 * @version 2017-09-07
 */
@Service
@Transactional(readOnly = true)
public class ReserveRecordService extends CrudService<ReserveRecordDao, ReserveRecord> {

	public ReserveRecord get(String id) {
		return super.get(id);
	}
	
	public List<ReserveRecord> findList(ReserveRecord reserveRecord) {
		return super.findList(reserveRecord);
	}
	
	public Page<ReserveRecord> findPage(Page<ReserveRecord> page, ReserveRecord reserveRecord) {
		return super.findPage(page, reserveRecord);
	}
	
	@Transactional(readOnly = false)
	public void save(ReserveRecord reserveRecord) {
		super.save(reserveRecord);
	}
	
	@Transactional(readOnly = false)
	public void delete(ReserveRecord reserveRecord) {
		super.delete(reserveRecord);
	}
	
}