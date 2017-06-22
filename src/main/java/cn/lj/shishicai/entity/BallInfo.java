package cn.lj.shishicai.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

public class BallInfo {

	@JsonProperty("BallId")
	Integer ballId =7;// 7
	@JsonProperty("BallContent")
	String ballContent; // "0XX0"
	@JsonProperty("Rate")
	Double rate = 96.0; // "96.0000"
	@JsonProperty("RateDvalue")
	Double rateDvalue = 0.0; // 0.0000
	@JsonProperty("Status")
	String status = "0"; // 0
	@JsonProperty("MinChip")
	Double minChip = 1.0; // 1.0000
	@JsonProperty("SingleChipLimit")
	Double singleChipLimit = 1000.0;// 1000.0000

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

	public Double getMinChip() {
		return minChip;
	}

	public void setMinChip(Double minChip) {
		this.minChip = minChip;
	}

	public Double getSingleChipLimit() {
		return singleChipLimit;
	}

	public void setSingleChipLimit(Double singleChipLimit) {
		this.singleChipLimit = singleChipLimit;
	}

}
