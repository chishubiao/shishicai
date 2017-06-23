package cn.lj.shishicai.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lj.shishicai.entity.Game;
import cn.lj.shishicai.repository.GameDao;
import cn.lj.shishicai.repository.IBaseDao;

@Service
public class GameService  extends ABaseService<Game,Integer>{
    @Autowired
    private GameDao gameDao;
	@Override
	protected IBaseDao<Game, Integer> getEntityDAO() {
		
		return gameDao;
	}
	public List<Game> findByGameDate(Date date) {
		
		return gameDao.findByGameDate(date);
	}



}
