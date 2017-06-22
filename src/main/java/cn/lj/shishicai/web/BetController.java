package cn.lj.shishicai.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lj.shishicai.entity.BallInfo;
import cn.lj.shishicai.entity.CurrentRate;

@RequestMapping("/bet")
@Controller
public class BetController extends ABaseController {
	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "bet/index";
	}

	@RequestMapping("/getBallInfo")
	@ResponseBody
	public Map<String, Object> getBallInfo(String gameid, int ballId) {
		List<BallInfo> ballInfoList = new ArrayList<BallInfo>();
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				BallInfo ballInfo = new BallInfo();
				ballInfo.setBallId(ballId);
				ballInfo.setBallContent(ball(ballId, i, j));
				ballInfoList.add(ballInfo);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FrankColor", 80);
		map.put("CurrentRateList", ballInfoList);
		return map;
	}

	@RequestMapping("/getCurrentRate")
	@ResponseBody
	public Map<String, Object> getCurrentRate(String gameid, int ballid) {
		List<CurrentRate> currentRateList = new ArrayList<CurrentRate>();
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				CurrentRate currentRate = new CurrentRate();
				currentRate.setBallId(ballid);
				currentRate.setBallContent(ball(ballid, i, j));
				currentRateList.add(currentRate);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FrankColor", 80);
		map.put("CurrentRateList", currentRateList);
		return map;
	}

	private String ball(int ballId, int x, int y) {
		String result = "";
		switch (ballId) {
		case 5:
			result = x + "" + y + "XX";
			break;
		case 6:
			result = x + "X" + y + "X";
			break;
		case 7:
			result = x + "XX" + y;
			break;
		case 8:
			result = "X" + x + "X" + y;
			break;
		case 9:
			result = "X" + x + y + "X";
			break;
		case 10:
			result = "XX" + x + y;
			break;
		case 20:
			result = "XXX" + x + y;
			break;
		}
		return result;
	}
}
