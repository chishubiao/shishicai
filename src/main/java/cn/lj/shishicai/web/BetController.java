package cn.lj.shishicai.web;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lj.shishicai.entity.Agent;
import cn.lj.shishicai.entity.BallInfo;
import cn.lj.shishicai.entity.Bet;
import cn.lj.shishicai.entity.BetDto;
import cn.lj.shishicai.entity.Game;
import cn.lj.shishicai.repository.BallInfoDao;
import cn.lj.shishicai.service.AgentService;
import cn.lj.shishicai.service.BallInfoService;
import cn.lj.shishicai.service.BetService;
import cn.lj.shishicai.service.GameService;
import cn.lj.shishicai.service.account.SessionUser;

@RequestMapping("/bet")
@Controller
public class BetController extends ABaseController {

	@Autowired
	private BallInfoService ballInfoService;

	
	@Autowired
	private BallInfoDao ballInfoDao;

	@Autowired
	private AgentService agentService;

	@Autowired
	private BetService betService;
	
	@Autowired
	private GameService gameService;

	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "bet/index";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/betPage")
	public String betPage() {
		return "bet/frame";
	}

	@RequestMapping("/getBallInfo")
	@ResponseBody
	public Map<String, Object> getBallInfo(String gameid, int ballId) {

		List<BallInfo> ballInfoList = ballInfoDao.findByBallId(ballId);

		Agent agent = agentService.getById(SessionUser.getUserId());
		for (BallInfo ballInfo : ballInfoList) {
			ballInfo.setMinChip(agent.getMinChip());
			ballInfo.setSingleChipLimit(agent.getSingleChipLimit());
			ballInfo.setRate(agent.getPaidRate());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FrankColor", 80);
		map.put("CurrentRateList", ballInfoList);
		return map;
	}

	@RequestMapping("/getCurrentRate")
	@ResponseBody
	public Map<String, Object> getCurrentRate(String gameid, int ballid) {
		List<BallInfo> ballInfoList = ballInfoDao.findByBallId(ballid);

		Agent agent = agentService.getById(SessionUser.getUserId());
		for (BallInfo ballInfo : ballInfoList) {
			ballInfo.setMinChip(agent.getMinChip());
			ballInfo.setSingleChipLimit(agent.getSingleChipLimit());
			ballInfo.setRate(agent.getPaidRate());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FrankColor", 80);
		map.put("CurrentRateList", ballInfoList);
		return map;
	}

	@RequestMapping("/confirm")
	@ResponseBody
	public Map<String, Object> confirm(@RequestBody BetDto betDto) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FrankColor", 80);
		return map;
	}

	@RequestMapping("/paid")
	@ResponseBody
	public Map<String, Object> paid(String result, Integer gameId) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FrankColor", 80);
		return map;
	}

	@RequestMapping("/gameList")
	public String paidPage() {
		return "bet/gameList";
	}

	@RequestMapping("/list")
	public String listPage() {
		return "bet/list";
	}

	@RequestMapping("/getPage")
	@ResponseBody
	public Map<String, Object> list(Integer pageNumber,Integer pageSize) {
		if(pageSize==null) pageSize=20;
		Map searchParams = new HashMap();
		Page<Bet> page = betService.searchAllByPageSort(searchParams, pageNumber, pageSize, "auto");
		return getReturnMap(SUCCESS_CODE, "", page);
	}
	
	
	@RequestMapping("/getGameList")
	@ResponseBody
	public Map<String, Object> gameList(){
		List<Game> gameList=gameService.findByGameDate(Calendar.getInstance().getTime());
		List<Game> list1=gameList.subList(0, 40);
		List<Game> list2=gameList.subList(40, 80);
		List<Game> list3=gameList.subList(80, 120);
		Map<String,List> map=new HashMap<>();
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		return getReturnMap(SUCCESS_CODE,"",map);
	}

}
