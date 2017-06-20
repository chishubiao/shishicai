package cn.lj.shishicai.web.account;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.mapper.BeanMapper;

import cn.lj.shishicai.dto.AgentDto;
import cn.lj.shishicai.entity.Agent;
import cn.lj.shishicai.entity.User;
import cn.lj.shishicai.service.AgentService;
import cn.lj.shishicai.service.UserService;
import cn.lj.shishicai.service.account.SessionUser;
import cn.lj.shishicai.web.ABaseController;

@Controller
@RequestMapping("agent")
public class AgentController extends ABaseController {
	@Autowired
	private UserService userService;
	@Autowired
	private AgentService agentService;

	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "agent/list";
	}

	@ResponseBody
	@RequestMapping("/findPage")
	public Map<String, Object> findPage(@RequestParam(defaultValue = "20") Integer pageSize,
			@RequestParam(defaultValue = "1") Integer pageNumber) {
		Map<String, Object> searchParams = new HashMap<>();
		if (SessionUser.getType() == User.UserType.AGENT.getType()) {
			searchParams.put("EQ_parentId", SessionUser.getUserId());
		}
		Page<Agent> page = agentService.searchAllByPageSort(searchParams, pageNumber, pageSize, null);
		List<Agent> agentList = page.getContent();
		List<AgentDto> agentDtos = new ArrayList<>();
		for (Agent agent : agentList) {

			User user = userService.getById(agent.getId());
			AgentDto agentDto = map(user, agent);
			agentDtos.add(agentDto);
		}
		Page<AgentDto> agentPage = new PageImpl<>(agentDtos, new PageRequest(page.getNumber(), page.getSize()),
				page.getTotalElements());
		return getReturnMap(SUCCESS_CODE, "获取成功", agentPage);
	}

	private AgentDto map(User user, Agent agent) {
		AgentDto agentDto = BeanMapper.map(user, AgentDto.class);
		BeanMapper.copy(agent, agentDto);
		return agentDto;
	}
}
