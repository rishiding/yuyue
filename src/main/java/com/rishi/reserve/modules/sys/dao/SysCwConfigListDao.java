/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sys.dao;

import com.rishi.reserve.common.persistence.CrudDao;
import com.rishi.reserve.common.persistence.annotation.MyBatisDao;
import com.rishi.reserve.modules.sys.entity.SysCwConfigList;

/**
 * 床位一览表配置DAO接口
 * @author rishi
 * @version 2017-07-13
 */
@MyBatisDao
public interface SysCwConfigListDao extends CrudDao<SysCwConfigList> {
	
}