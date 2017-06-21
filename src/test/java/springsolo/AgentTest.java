package springsolo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springside.modules.mapper.JsonMapper;

import cn.lj.shishicai.repository.AgentDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Profile("production")
public class AgentTest extends AbstractTransactionalJUnit4SpringContextTests{
	private Logger logger=LoggerFactory.getLogger(AgentTest.class);
	@Autowired
	private AgentDao agentDao;
	
	@Test
	public void testfindPage(){
		Page page=agentDao.getBrokerPageByParentId(2, new PageRequest(0,5));
		logger.info("返回值{}",new JsonMapper().toJson(page));
	}
	@Test
	public void testfindAgentPage(){
		Page page=agentDao.getAgentPage(new PageRequest(0,5));
		logger.info("{}",new JsonMapper().toJson(page));
	}
	
}
