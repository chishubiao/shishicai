package cn.lj.shishicai.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.lj.shishicai.entity.Game;
import cn.lj.shishicai.repository.GameDao;
import cn.lj.shishicai.repository.IBaseDao;

@Service
public class GameService extends ABaseService<Game, Integer> {
	@Autowired
	private GameDao gameDao;

	@Override
	protected IBaseDao<Game, Integer> getEntityDAO() {
		return gameDao;
	}

	public List<Game> findByGameDate(Date date) {
		return gameDao.findByGameDate(date);
	}

	@Transactional(readOnly = false)
	public void paid(String result, Long gameId) {
		Integer n = Integer.valueOf(result);
		gameDao.updateGameResult(gameId,result);
		gameDao.updateWinBetFlag(gameId, n / 10000, (n % 10000) / 1000, (n % 1000) / 100, (n % 100) / 10, n % 10);
		gameDao.updateLostBetFlag(gameId);
		gameDao.updatePaidAmount(gameId);
		gameDao.updateBrokerCredit(gameId);
		gameDao.updateAgentCredit(gameId);
	}

}
