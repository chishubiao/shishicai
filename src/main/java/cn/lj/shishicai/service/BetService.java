package cn.lj.shishicai.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.mapper.BeanMapper;

import cn.lj.shishicai.entity.Agent;
import cn.lj.shishicai.entity.Bet;
import cn.lj.shishicai.entity.BetDto;
import cn.lj.shishicai.entity.ChipInInfo;
import cn.lj.shishicai.entity.User;
import cn.lj.shishicai.entity.User.UserType;
import cn.lj.shishicai.repository.AgentDao;
import cn.lj.shishicai.repository.BetDao;
import cn.lj.shishicai.repository.IBaseDao;
import cn.lj.shishicai.service.account.SessionUser;
@Service
public class BetService extends ABaseService<Bet, Integer>{
    @Autowired
    private BetDao betDao;
    
    @Autowired
    private AgentDao agentDao;
    
	@Override
	protected IBaseDao<Bet, Integer> getEntityDAO() {
		return betDao;
	}

	@Transactional(readOnly=false)
	public void saveBet(BetDto betDto) {
		
		//假设当前只有broker可以下单,所以当前用户只能是broker
		Agent broker = agentDao.findOne(SessionUser.getUserId());
		Agent agent = agentDao.findOne(broker.getParentId());
		
		//broker剩余的信用额度
		BigDecimal totalBrokerCreditRemain = broker.getCredit();
		Date now = new Date();
		Bet bet = null;
		List<ChipInInfo> chipInInfoList = betDto.getChipInInfoList();
		for(ChipInInfo chipInInfo : chipInInfoList){
			bet = new Bet();
			bet.setGameId(betDto.getGameId());
			//bet.setSequence(sequence);
			bet.setType(betDto.getBallId());
			bet.setContent(chipInInfo.getBallContent());
			Integer n = Integer.valueOf(chipInInfo.getBallContent().replaceAll("X", ""));
			bet.setParam1(n/10); //取十位数
			bet.setParam2(n%10); //取个位数
			bet.setBetAmount(chipInInfo.getDownMoney());
			//broker剩余的信用额度
			totalBrokerCreditRemain = totalBrokerCreditRemain.subtract(chipInInfo.getDownMoney());
			
			//当前broker的上级代理赔付数据
			bet.setAgentId(agent.getId()); 
			bet.setAgentPaidRate(agent.getPaidRate().subtract(broker.getPaidRate()));
			bet.setAgentPaidAmount(new BigDecimal(0));
			//当前broker的赔付数据
			bet.setBrokerId(broker.getId());
			bet.setBrokerPaidRate(broker.getPaidRate());
			bet.setBrokerPaidAmount(new BigDecimal(0));
			
			bet.setFlag((byte)0); //默认未开奖
			bet.setCreateTime(now);
			//保存投注
			betDao.save(bet);
		}
		
		//更新broker的信用额度
		broker.setCredit(totalBrokerCreditRemain);
		agentDao.save(broker);
	}
}
