package cn.lj.shishicai.entity;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ChipInInfo {
	
	@JsonProperty("BallContent")
	private String ballContent;
	
	@JsonProperty("DownMoney")
	private BigDecimal downMoney;

	public String getBallContent() {
		return ballContent;
	}

	public void setBallContent(String ballContent) {
		this.ballContent = ballContent;
	}

	public BigDecimal getDownMoney() {
		return downMoney;
	}

	public void setDownMoney(BigDecimal downMoney) {
		this.downMoney = downMoney;
	}

}
