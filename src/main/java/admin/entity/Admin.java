package admin.entity;

import java.sql.Timestamp;

public class Admin {
	private Integer id;
	private String adminname;
	private String password;
	private String phone;
	private String address;
	private int priority;
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	private Timestamp createtime;
	private Timestamp updatetime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getTemp1() {
		return temp1;
	}

	public void setTemp1(String temp1) {
		this.temp1 = temp1;
	}

	public String getTemp2() {
		return temp2;
	}

	public void setTemp2(String temp2) {
		this.temp2 = temp2;
	}

	public String getTemp3() {
		return temp3;
	}

	public void setTemp3(String temp3) {
		this.temp3 = temp3;
	}

	public String getTemp4() {
		return temp4;
	}

	public void setTemp4(String temp4) {
		this.temp4 = temp4;
	}

	public String getTemp5() {
		return temp5;
	}

	public void setTemp5(String temp5) {
		this.temp5 = temp5;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public Timestamp getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Timestamp updatetime) {
		this.updatetime = updatetime;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", adminname=" + adminname + ", password=" + password + ", phone=" + phone
				+ ", address=" + address + ", priority=" + priority + ", temp1=" + temp1 + ", temp2=" + temp2
				+ ", temp3=" + temp3 + ", temp4=" + temp4 + ", temp5=" + temp5 + ", createtime=" + createtime
				+ ", updatetime=" + updatetime + "]";
	}
}
