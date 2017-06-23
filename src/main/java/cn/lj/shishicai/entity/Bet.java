package cn.lj.shishicai.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the bet database table.
 * 
 */
@Entity
@NamedQuery(name="Bet.findAll", query="SELECT b FROM Bet b")
public class Bet implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="agent_id")
	private int agentId;

	@Column(name="bet_amount")
	private BigDecimal betAmount;

	@Column(name="broke_id")
	private int brokeId;

	@Column(name="game_id")
	private int gameId;

	@Column(name="broker_paid_amount")
	private BigDecimal brokerPaidAmount;

	@Column(name="broker_paid_rate")
	private BigDecimal brokerPaidRate;
	
	
	@Column(name="agent_paid_amount")
	private BigDecimal agentPaidAmount;

	@Column(name="agent_paid_rate")
	private BigDecimal agentPaidRate;

	private int param1;

	private int param2;

	

	private int sequence;

	private String type;
	
	@Transient
	private BigDecimal profit;
	
	@Transient
	private BigDecimal commission;
	

	private byte flag;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	@Column(name="create_time")
	private Date createTime;

	public Bet() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAgentId() {
		return this.agentId;
	}

	public void setAgentId(int agentId) {
		this.agentId = agentId;
	}

	public BigDecimal getBetAmount() {
		return this.betAmount;
	}

	public void setBetAmount(BigDecimal betAmount) {
		this.betAmount = betAmount;
	}

	public int getBrokeId() {
		return this.brokeId;
	}

	public void setBrokeId(int brokeId) {
		this.brokeId = brokeId;
	}

	public int getGameId() {
		return this.gameId;
	}

	public void setGameId(int gameId) {
		this.gameId = gameId;
	}

	

	public int getParam1() {
		return this.param1;
	}

	public void setParam1(int param1) {
		this.param1 = param1;
	}

	public int getParam2() {
		return this.param2;
	}

	public void setParam2(int param2) {
		this.param2 = param2;
	}

	public BigDecimal getBrokerPaidAmount() {
		return brokerPaidAmount;
	}

	public void setBrokerPaidAmount(BigDecimal brokerPaidAmount) {
		this.brokerPaidAmount = brokerPaidAmount;
	}

	public BigDecimal getBrokerPaidRate() {
		return brokerPaidRate;
	}

	public void setBrokerPaidRate(BigDecimal brokerPaidRate) {
		this.brokerPaidRate = brokerPaidRate;
	}

	public BigDecimal getAgentPaidAmount() {
		return agentPaidAmount;
	}

	public void setAgentPaidAmount(BigDecimal agentPaidAmount) {
		this.agentPaidAmount = agentPaidAmount;
	}

	public BigDecimal getAgentPaidRate() {
		return agentPaidRate;
	}

	public void setAgentPaidRate(BigDecimal agentPaidRate) {
		this.agentPaidRate = agentPaidRate;
	}

	public int getSequence() {
		return this.sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public BigDecimal getProfit() {
		return profit;
	}

	public void setProfit(BigDecimal profit) {
		this.profit = profit;
	}

	public BigDecimal getCommission() {
		return commission;
	}

	public void setCommission(BigDecimal commission) {
		this.commission = commission;
	}

	public byte getFlag() {
		return flag;
	}

	public void setFlag(byte flag) {
		this.flag = flag;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}