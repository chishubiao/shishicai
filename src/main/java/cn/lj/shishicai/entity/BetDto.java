package cn.lj.shishicai.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class BetDto {

	@JsonProperty("OpeeningId")
	private String opeeningId;

	@JsonProperty("BallId")
	Integer ballId;

	@JsonProperty("Mode")
	private Integer mode;

	@JsonProperty("LstCHipInInfo")
	private List<ChipInInfo> chipInInfoList;

	public String getOpeeningId() {
		return opeeningId;
	}

	public void setOpeeningId(String opeeningId) {
		this.opeeningId = opeeningId;
	}

	public Integer getBallId() {
		return ballId;
	}

	public void setBallId(Integer ballId) {
		this.ballId = ballId;
	}

	public Integer getMode() {
		return mode;
	}

	public void setMode(Integer mode) {
		this.mode = mode;
	}

	public List<ChipInInfo> getChipInInfoList() {
		return chipInInfoList;
	}

	public void setChipInInfoList(List<ChipInInfo> chipInInfoList) {
		this.chipInInfoList = chipInInfoList;
	}

}
