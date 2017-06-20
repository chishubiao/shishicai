package cn.lj.shishicai.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the operate_log database table.
 * 
 */
@Entity
@Table(name="operate_log")
@NamedQuery(name="OperateLog.findAll", query="SELECT o FROM OperateLog o")
public class OperateLog implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String operator;

	private String record;

	private byte type;

	public OperateLog() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}

	public byte getType() {
		return this.type;
	}

	public void setType(byte type) {
		this.type = type;
	}

}