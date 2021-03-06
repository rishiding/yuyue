/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.reserve.dao;

import com.rishi.reserve.common.persistence.CrudDao;
import com.rishi.reserve.common.persistence.annotation.MyBatisDao;
import com.rishi.reserve.modules.reserve.entity.ReserveRecord;

/**
 * 预约记录DAO接口
 * @author rishi
 * @version 2017-09-07
 */
@MyBatisDao
public interface ReserveRecordDao extends CrudDao<ReserveRecord> {
	
}