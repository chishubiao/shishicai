package cn.lj.shishicai.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CurrentRate {

	@JsonProperty("BallId")
	Integer ballId =7;// 7
	@JsonProperty("BallContent")
	String ballContent; // "0XX0"
	@JsonProperty("Rate")
	Double rate = 96.0; // "96.0000"

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

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

}
