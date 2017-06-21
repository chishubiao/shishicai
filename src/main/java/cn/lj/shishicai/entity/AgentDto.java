package cn.lj.shishicai.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class AgentDto {
    @Id
	private int id;

	private Date createTime;

	private Date lastUpdateTime;

	private String password;

	private String remark;

	private byte status;

	private byte type;

	private String username;

	private BigDecimal creditLimit;

	private BigDecimal paidRate;

	private BigDecimal credit;

	private int parentId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public byte getStatus() {
		return status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	public byte getType() {
		return type;
	}

	public void setType(byte type) {
		this.type = type;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public BigDecimal getCreditLimit() {
		return creditLimit;
	}

	public void setCreditLimit(BigDecimal creditLimit) {
		this.creditLimit = creditLimit;
	}

	public BigDecimal getPaidRate() {
		return paidRate;
	}

	public void setPaidRate(BigDecimal paidRate) {
		this.paidRate = paidRate;
	}

	public BigDecimal getCredit() {
		return credit;
	}

	public void setCredit(BigDecimal credit) {
		this.credit = credit;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public AgentDto(int id, String username, byte status,BigDecimal creditLimit, BigDecimal paidRate, BigDecimal credit) {
		super();
		this.id = id;
		this.username = username;
		this.creditLimit = creditLimit;
		this.paidRate = paidRate;
		this.credit = credit;
	}

	public AgentDto() {
		super();
	}

}
