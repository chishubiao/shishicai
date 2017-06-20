package cn.lj.shishicai.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;

/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time")
	private Date createTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_update_time")
	private Date lastUpdateTime;

	private String password;

	private String remark;

	private byte status;

	private byte type;

	private String username;

	public User() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public byte getStatus() {
		return this.status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	public byte getType() {
		return this.type;
	}

	public void setType(byte type) {
		this.type = type;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public enum UserType {
		ADMIN((byte) 1, "admin"), AGENT((byte) 2, "agent"), BROKER((byte) 3, "broker");
		byte type;
		String role;

		UserType(byte type, String role) {
			this.type = type;
			this.role = role;
		}

		public byte getType() {
			return this.type;
		}

		public String getRole() {
			return this.role;
		}

		public static UserType parse(byte type) {
			for (UserType userType : UserType.values()) {
				if (userType.getType() == type) {
					return userType;
				}
			}
			return null;
		}
	}

	public enum UserStatus {
		ACTIVE((byte) 1), LOCK((byte) 0);
		byte type;

		UserStatus(byte type) {
			this.type = type;
		}

		public byte getType() {
			return this.type;
		}

	}
}