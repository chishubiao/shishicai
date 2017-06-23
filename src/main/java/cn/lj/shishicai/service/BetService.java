package cn.lj.shishicai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lj.shishicai.entity.Bet;
import cn.lj.shishicai.repository.BetDao;
import cn.lj.shishicai.repository.IBaseDao;
@Service
public class BetService extends ABaseService<Bet, Integer>{
    @Autowired
    private BetDao betDao;
	@Override
	protected IBaseDao<Bet, Integer> getEntityDAO() {
		return betDao;
	}

}
