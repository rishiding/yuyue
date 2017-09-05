/**
 * Copyright &copy; 2017-2017<a href="#">rishi</a> All rights reserved.
 */
package com.rishi.reserve.modules.sys.dao;

import com.rishi.reserve.common.persistence.CrudDao;
import com.rishi.reserve.common.persistence.annotation.MyBatisDao;
import com.rishi.reserve.modules.sys.entity.Log;

/**
 * 日志DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {

}
