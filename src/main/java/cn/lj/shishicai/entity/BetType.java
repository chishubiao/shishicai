package cn.lj.shishicai.entity;

public enum BetType {

	T5(5, "00XX"), T6(6, "0X0X"), T7(7, "0XX0"), T8(8, "X0X0"), T9(9, "X00X"), T10(10, "XX00"), T20(20, "XXX00");

	Integer type;
	String content;

	BetType(Integer type, String content) {
		this.type = type;
		this.content = content;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
