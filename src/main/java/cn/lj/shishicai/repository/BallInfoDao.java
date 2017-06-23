/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package cn.lj.shishicai.repository;

import java.util.List;

import cn.lj.shishicai.entity.BallInfo;

public interface BallInfoDao extends IBaseDao<BallInfo, Integer> {

	List<BallInfo> findByBallId(int ballId);
	
}
