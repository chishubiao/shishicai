package cn.lj.shishicai.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.lj.shishicai.entity.Agent;
import cn.lj.shishicai.entity.AgentDto;

public interface AgentDao extends IBaseDao<Agent, Integer>{
    @Query("select new AgentDto(user.id as id,user.username as username,user.status as status,agent.creditLimit as creditLimit,agent.paidRate as paidRate,agent.credit as credit) from Agent agent,User user where user.id=agent.id and agent.parentId = :parentId and user.type=3")
	Page<AgentDto> getBrokerPageByParentId(@Param("parentId")Integer parentId,Pageable pageRequest);

    
    @Query("select new AgentDto(user.id as id,user.username as username,user.status as status,agent.creditLimit as creditLimit,agent.paidRate as paidRate,agent.credit as credit) from Agent agent,User user where user.id=agent.id and user.type=2")
   	Page<AgentDto> getAgentPage(Pageable pageRequest);
}
