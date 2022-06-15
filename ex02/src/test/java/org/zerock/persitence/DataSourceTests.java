package org.zerock.persitence;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DataSourceTests {
	
	@Autowired
	DataSource dataSource;

	@Test
	public void testConnetion() {
		try {
			Connection conn =dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
