/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package cn.lj.shishicai.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.lj.shishicai.entity.Game;

public interface GameDao extends IBaseDao<Game, Integer> {

	List<Game> findByGameDate(Date date);

	/**
	 * 更新开彩结果
	 * @param gameId
	 */
	@Modifying
	@Query(nativeQuery=true,value="update bet set result=:result where game_id=:gameId")
	void updateGameResult(@Param("gameId") Long gameId, @Param("result") String result);
	
	/**
	 * 检查投注是否中奖,除了游戏id，还要传入投注类别传入５个参数,分别是开奖结果的５位数,b1,b2,b3,b4,b5
	 * 
	 * type=5, 00XX type=6, 0X0X type=7, 0XX0 type=8, X0X0 type=9, X00X
	 * type=10,XX00 type=20,XXX00
	 * 
	 * @param gameId
	 * @param b1
	 * @param b2
	 * @param b3
	 * @param b4
	 * @param b5
	 */
	@Modifying
	@Query(nativeQuery=true,value="update bet set flag = 1 where game_id=:gameId and ((type=5 and param1=:b1 and param2=:b2) or (type=6 and param1=:b1 and param2=:b3) or (type=7 and param1=:b1 and param2=:b4)  or (type=9 and param1=:b2 and param2=:b3) or (type=8 and param1=:b2 and param2=:b4) or (type=10 and param1=:b3 and param2=:b4) or (type=20 and param1=:b4 and param2=:b5))")
	void updateWinBetFlag(@Param("gameId") Long gameId, @Param("b1") Integer b1, @Param("b2") Integer b2,
			@Param("b3") Integer b3, @Param("b4") Integer b4, @Param("b5") Integer b5);

	/**
	 * 把此局未赢的全部标记为输
	 * @param gameId
	 */
	@Modifying
	@Query(nativeQuery=true,value="update bet set flag = -1 where game_id=:gameId and flag<>1")
	void updateLostBetFlag(@Param("gameId") Long gameId);

	
	/**
	 * 更新一级代理和二级代理的赔彩金额
	 * 
	 * @param gameId
	 */
	@Modifying
	@Query(nativeQuery=true,value="update bet set agent_paid_amount = bet_amount * agent_paid_rate , broker_paid_amount = bet_amount * broker_paid_rate where game_id=:gameId and flag = 1")
	void updatePaidAmount(@Param("gameId") Long gameId);

	/**
	 * 更新二级代理的余额
	 * 
	 * @param gameId
	 */
	@Modifying
	@Query(nativeQuery=true,value="update agent join (select broker_id,sum(broker_paid_amount) as totalPaidAmt from bet where flag=1 and game_id=:gameId group by broker_id) as profile ON agent.id=profile.broker_id set agent.credit= (agent.credit + profile.totalPaidAmt)")
	void updateBrokerCredit(@Param("gameId") Long gameId);

	/**
	 * 更新一级代理的余额
	 * 
	 * @param gameId
	 */
	@Modifying
	@Query(nativeQuery=true,value="update agent join (select agent_id,sum(agent_paid_amount) as totalPaidAmt from bet where flag=1 and game_id=:gameId group by agent_id) as profile ON agent.id=profile.agent_id set agent.credit= (agent.credit + profile.totalPaidAmt)")
	void updateAgentCredit(@Param("gameId") Long gameId);

}
