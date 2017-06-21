package cn.lj.shishicai.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.mapper.BeanMapper;

import cn.lj.shishicai.entity.Agent;
import cn.lj.shishicai.entity.AgentDto;
import cn.lj.shishicai.entity.User;
import cn.lj.shishicai.entity.User.UserType;
import cn.lj.shishicai.repository.AgentDao;
import cn.lj.shishicai.repository.IBaseDao;
@Service
public class AgentService extends ABaseService<Agent, Integer>{
	@Autowired
	private AgentDao agentDao;
	
	@Autowired
	private UserService userService;

	@Override
	protected IBaseDao<Agent, Integer> getEntityDAO() {
		return agentDao;
	}

	public Page<AgentDto> getBrokerPageByParentId(Integer userId, Integer pageNumber, Integer pageSize) {
		Pageable pageRequest=new PageRequest(pageNumber-1,pageSize);
		return agentDao.getBrokerPageByParentId(userId,pageRequest);
	}

	public Page<AgentDto> getAgentPage(Integer pageNumber, Integer pageSize) {
		Pageable pageRequest=new PageRequest(pageNumber-1,pageSize);
		return agentDao.getAgentPage(pageRequest);
	}
   
    @Transactional(readOnly=false)
	public void saveAgent(AgentDto agentDto) {
		User user=BeanMapper.map(agentDto, User.class);
	    user=userService.save(user);
	    Agent agent=BeanMapper.map(agentDto, Agent.class);
	    agent.setId(user.getId());
	    save(agent);
	}

}
