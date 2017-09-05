package com.rishi.reserve.test;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration({"classpath*:/spring-context*.xml"})  
public class JUnitBase extends AbstractTransactionalJUnit4SpringContextTests {
	 @Override  
	    @Resource(name = "dataSource")  
	    public void setDataSource(DataSource dataSource) {  
	        // TODO Auto-generated method stub  
	        super.setDataSource(dataSource);  
	    }  
}
