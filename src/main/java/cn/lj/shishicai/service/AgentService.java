package cn.lj.shishicai.service;



import java.math.BigDecimal;
import java.util.Date;

import org.apache.shiro.crypto.hash.Md5Hash;
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
import cn.lj.shishicai.service.account.SessionUser;
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
    	checkUsername(agentDto);
		if (SessionUser.getType() == UserType.AGENT.getType()) {
			Agent agent=agentDao.findOne(SessionUser.getUserId());
			checkPaidRate(agentDto, agent);
			subtractAgentAccount(agent,agentDto.getCredit());
			agentDto.setParentId(SessionUser.getUserId());
			agentDto.setType(UserType.BROKER.getType());
		} else {//管理员
			agentDto.setType(UserType.AGENT.getType());
		}
		String password = new Md5Hash(agentDto.getPassword()).toString();
		agentDto.setPassword(password);
		Date date = new Date();
		agentDto.setCreateTime(date);
		agentDto.setLastUpdateTime(date);
		User user=BeanMapper.map(agentDto, User.class);
	    user=userService.save(user);
	    Agent agent=BeanMapper.map(agentDto, Agent.class);
	    agent.setId(user.getId());
	    save(agent);
	}

	public void checkPaidRate(AgentDto agentDto, Agent agent) {
		if(agent.getPaidRate().compareTo(agentDto.getPaidRate())<0){
			throw new ServiceException(String.format("赔率不能大于%s",agent.getPaidRate().toString()));
		}
	}
    @Transactional(readOnly=false)
	public Agent subtractAgentAccount(Agent agent, BigDecimal credit) {
		if(agent.getCredit().compareTo(credit)<0){
			throw new ServiceException("账户余额不足");
		}
		agent.setCredit(agent.getCredit().subtract(credit));
		return agentDao.save(agent);
	}

	private void checkUsername(AgentDto agentDto) {
		if(userService.isExistUsername(agentDto.getUsername())){
			throw new ServiceException( "用户已经存在");
		}
	}

}
