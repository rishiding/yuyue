/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.contact.dao;

import com.rishi.reserve.common.persistence.CrudDao;
import com.rishi.reserve.common.persistence.annotation.MyBatisDao;
import com.rishi.reserve.modules.contact.entity.Contact;

/**
 * 联系人DAO接口
 * @author rishi
 * @version 2017-09-06
 */
@MyBatisDao
public interface ContactDao extends CrudDao<Contact> {
	
}