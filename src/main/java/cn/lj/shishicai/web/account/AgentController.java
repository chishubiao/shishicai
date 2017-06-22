package cn.lj.shishicai.web.account;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lj.shishicai.entity.AgentDto;
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
		Page<AgentDto> page = null;
		if (SessionUser.getType() == User.UserType.AGENT.getType()) {
			page = agentService.getBrokerPageByParentId(SessionUser.getUserId(), pageNumber, pageSize);
		} else {
			page = agentService.getAgentPage(pageNumber, pageSize);
		}
		return getReturnMap(SUCCESS_CODE, "获取成功", page);
	}

	@RequestMapping("/edit")
	public String edit(Integer id) {
		return "agent/edit";
	}

	@RequestMapping("/create")
	public String create(Integer id) {
		return "agent/create";
	}

	@RequestMapping("/save")
	@ResponseBody
	public Map<String, Object> save(AgentDto agentDto) {
		agentService.saveAgent(agentDto);
		return getReturnMap(SUCCESS_CODE, "保存成功", null);

	}

}
