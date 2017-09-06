/**
 * Copyright &copy; 2017 bskj All rights reserved.
 */
package com.rishi.reserve.modules.contact.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rishi.reserve.common.persistence.Page;
import com.rishi.reserve.common.service.CrudService;
import com.rishi.reserve.modules.contact.entity.Contact;
import com.rishi.reserve.modules.contact.dao.ContactDao;

/**
 * 联系人Service
 * @author rishi
 * @version 2017-09-06
 */
@Service
@Transactional(readOnly = true)
public class ContactService extends CrudService<ContactDao, Contact> {

	public Contact get(String id) {
		return super.get(id);
	}
	
	public List<Contact> findList(Contact contact) {
		return super.findList(contact);
	}
	
	public Page<Contact> findPage(Page<Contact> page, Contact contact) {
		return super.findPage(page, contact);
	}
	
	@Transactional(readOnly = false)
	public void save(Contact contact) {
		super.save(contact);
	}
	
	@Transactional(readOnly = false)
	public void delete(Contact contact) {
		super.delete(contact);
	}
	
}