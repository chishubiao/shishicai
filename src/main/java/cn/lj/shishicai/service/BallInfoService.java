package cn.lj.shishicai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lj.shishicai.entity.BallInfo;
import cn.lj.shishicai.repository.BallInfoDao;
import cn.lj.shishicai.repository.IBaseDao;

@Service
public class BallInfoService extends ABaseService<BallInfo, Integer>{
	@Autowired
	private BallInfoDao ballInfoDao;
	
	@Override
	protected IBaseDao<BallInfo, Integer> getEntityDAO() {
		return ballInfoDao;
	}

}
