package cn.lj.shishicai.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the agent database table.
 * 
 */
@Entity
@NamedQuery(name="Agent.findAll", query="SELECT a FROM Agent a")
public class Agent implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	@Column(name="paid_rate")
	private BigDecimal paidRate;

	private BigDecimal credit;

	@Column(name="parent_id")
	private int parentId;
	@Column(name="min_chip")
	private BigDecimal minChip;
	@Column(name="single_chip_limit")
	private BigDecimal singleChipLimit;

	public Agent() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public BigDecimal getPaidRate() {
		return paidRate;
	}

	public void setPaidRate(BigDecimal paidRate) {
		this.paidRate = paidRate;
	}

	public BigDecimal getCredit() {
		return this.credit;
	}

	public void setCredit(BigDecimal credit) {
		this.credit = credit;
	}

	public int getParentId() {
		return this.parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public BigDecimal getMinChip() {
		return minChip;
	}

	public void setMinChip(BigDecimal minChip) {
		this.minChip = minChip;
	}

	public BigDecimal getSingleChipLimit() {
		return singleChipLimit;
	}

	public void setSingleChipLimit(BigDecimal singleChipLimit) {
		this.singleChipLimit = singleChipLimit;
	}

}