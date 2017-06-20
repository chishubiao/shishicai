package cn.lj.shishicai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lj.shishicai.entity.Agent;
import cn.lj.shishicai.repository.AgentDao;
import cn.lj.shishicai.repository.IBaseDao;
@Service
public class AgentService extends ABaseService<Agent, Integer>{
	@Autowired
	private AgentDao agentDao;

	@Override
	protected IBaseDao<Agent, Integer> getEntityDAO() {
		return agentDao;
	}

}
