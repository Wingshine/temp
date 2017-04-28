package org.ws.ctf.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ws.ctf.entity.User;

/**
 * @author jssjh p配置spring和junit整合,junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({ "classpath:spring/spring-dao.xml" })
public class UserDaoTest {
	// 注入Dao实现类依赖
	@Resource
	private UserDao userDao;

	@Test
	public void testAddUser() throws Exception{
		User user = new User();
		user.setUserName("shadow");
		user.setPassword("1234567");
		user.setNickName("shadowmax");
		user.setAge(22);
		user.setEmail("jssjh2016@gmail.com");
		user.setMd5("dasfasdfasdfasdf");
		user.setHeadImg("003.png");
		System.out.println(user);
		int resultcount = userDao.addUser(user);
		System.out.println("resultcount="+resultcount);
	}
	
	@Test
	public void testQueryCountByUserName() throws Exception{
		int resultcount = userDao.queryCountByUserName("admin");
		System.out.println("resultcount="+resultcount);
	}
	
	@Test
	public void testQueryCountByNickName() throws Exception{
		int resultcount = userDao.queryCountByNickName("wingshine");
		System.out.println("resultcount="+resultcount);
	}
	
	@Test
	public void testQueryCountByEmail() throws Exception{
		int resultcount = userDao.queryCountByEmail("jssjh2017@gmail.com");
		System.out.println("resultcount="+resultcount);
	}
	
	
	@Test
	public void testQueryByUserName() throws Exception{
		User user = userDao.queryByUserName("admin");
		System.out.println(user);
	}
	
	@Test
	public void testQueryByEmail() throws Exception{
		User user = userDao.queryByEmail("jssjh2016@gmail.com");
		System.out.println(user);
	}
	
	@Test
	public void testQueryById() throws Exception{
		User user = userDao.queryById(10000003);
		System.out.println(user);
	}
	
	@Test
	public void testUpdateUserInfoAdmin() throws Exception{
		User user = new User();
		user.setUserId(10000002);
		user.setUserName("shadow");
		user.setPassword("12345467");
		user.setNickName("shadowmin");
		user.setAge(22);
		user.setEmail("jssjh2017@gmail.com");
		user.setValidated(1);	
		user.setMd5("dasfas4544545f");
		user.setPrivilegeLvl(3);
		user.setLvl(47);
		user.setHeadImg("005.png");
		DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = dateFormat2.parse("2010-09-13 22:36:01");
		user.setSignUpTime(time);
		System.out.println(user);
		int resultcount = userDao.updateUserInfoAdmin(user);
		System.out.println("resultcount="+resultcount);
	}
	
	@Test
	public void testUpdateUserInfoUser() throws Exception{
		User user = new User();
		user.setUserId(10000002);
		user.setUserName("shadow");
		user.setNickName("shadowmin");
		user.setAge(22);
		user.setHeadImg("005.png");
	}
}
