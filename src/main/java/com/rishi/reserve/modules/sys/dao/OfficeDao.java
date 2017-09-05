/**
 * Copyright &copy; 2017-2017<a href="#">rishi</a> All rights reserved.
 */
package com.rishi.reserve.modules.sys.dao;

import java.util.List;

import com.rishi.reserve.common.persistence.TreeDao;
import com.rishi.reserve.common.persistence.annotation.MyBatisDao;
import com.rishi.reserve.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	public List<Office> findDeptList(Office entity);
 
	public List<Office> findInhospDept(Office office);
	
}
 