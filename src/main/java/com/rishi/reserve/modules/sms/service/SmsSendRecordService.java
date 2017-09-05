/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sms.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.service.CrudService;
import com.rishi.reserve.common.utils.DateUtils;
import com.rishi.reserve.modules.sms.entity.SmsSendRecord;
import com.rishi.reserve.modules.sms.dao.SmsSendRecordDao;

/**
 * 短信Service
 * @author rishi
 * @version 2017-09-05
 */
@Service
@Transactional(readOnly = true)
public class SmsSendRecordService extends CrudService<SmsSendRecordDao, SmsSendRecord> {

	
	
	public Page<SmsSendRecord> findPage(Page<SmsSendRecord> page, SmsSendRecord smsSendRecord) {
		// 设置默认时间范围，默认当前月
				if (smsSendRecord.getBeginDate() == null){
					smsSendRecord.setBeginDate(DateUtils.setDays(DateUtils.parseDate(DateUtils.getDate()), 1));
				}
				if (smsSendRecord.getEndDate() == null){
					smsSendRecord.setEndDate(DateUtils.addMonths(smsSendRecord.getBeginDate(), 1));
				}
		return super.findPage(page, smsSendRecord);
	}
	
	
	
	
}