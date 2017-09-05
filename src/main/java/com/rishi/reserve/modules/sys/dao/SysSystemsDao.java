/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.sys.dao;

import com.rishi.reserve.common.persistence.CrudDao;
import com.rishi.reserve.common.persistence.annotation.MyBatisDao;
import com.rishi.reserve.modules.sys.entity.SysSystems;

/**
 * 单表生成DAO接口
 * @author rishi
 * @version 2017-08-09
 */
@MyBatisDao
public interface SysSystemsDao extends CrudDao<SysSystems> {
	
}