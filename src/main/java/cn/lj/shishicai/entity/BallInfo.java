package cn.lj.shishicai.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@NamedQuery(name="BallInfo.findAll", query="SELECT a FROM BallInfo a")
public class BallInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@JsonProperty("Id")
	private int id;
	

	@JsonProperty("BallId")
	Integer ballId;
	

	@JsonProperty("BallContent")
	String ballContent;
	
	@Transient
	@JsonProperty("Rate")
	BigDecimal rate; // "96.0000"
	
	@Transient
	@JsonProperty("RateDvalue")
	Double rateDvalue = 0.0; // 0.0000
	
	@Transient
	@JsonProperty("Status")
	String status = "0"; // 0
	
	@Transient
	@JsonProperty("MinChip")
	BigDecimal minChip; // 1.0000
	
	@Transient
	@JsonProperty("SingleChipLimit")
	BigDecimal singleChipLimit;// 1000.0000

	public Integer getBallId() {
		return ballId;
	}

	public void setBallId(Integer ballId) {
		this.ballId = ballId;
	}

	public String getBallContent() {
		return ballContent;
	}

	public void setBallContent(String ballContent) {
		this.ballContent = ballContent;
	}

	

	public Double getRateDvalue() {
		return rateDvalue;
	}

	public void setRateDvalue(Double rateDvalue) {
		this.rateDvalue = rateDvalue;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public BigDecimal getRate() {
		return rate;
	}

	public void setRate(BigDecimal rate) {
		this.rate = rate;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
}
