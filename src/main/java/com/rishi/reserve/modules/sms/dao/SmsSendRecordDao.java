/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sms.dao;

import com.rishi.reserve.common.persistence.CrudDao;
import com.rishi.reserve.common.persistence.annotation.MyBatisDao;
import com.rishi.reserve.modules.sms.entity.SmsSendRecord;

/**
 * 短信DAO接口
 * @author rishi
 * @version 2017-09-05
 */
@MyBatisDao
public interface SmsSendRecordDao extends CrudDao<SmsSendRecord> {
	
}