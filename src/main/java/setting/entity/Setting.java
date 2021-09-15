package setting.entity;

import java.sql.Timestamp;

public class Setting {
	private String id;
	private String adminname;
	private String pagetype;
	private int startpage;
	private int count;
	private String gonggao;
	private String footgoogao;
	private String footphone;
	private String footaddress;
	private String footemail;
	private String quicklinik;
	private String userquick;
	private String quickaddress;
	private String temp1;
	// 选择一个一个用户
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	private String temp6;
	private String temp7;
	private Timestamp createtime;
	private Timestamp updatetime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public String getPagetype() {
		return pagetype;
	}

	public void setPagetype(String pagetype) {
		this.pagetype = pagetype;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getGonggao() {
		return gonggao;
	}

	public void setGonggao(String gonggao) {
		this.gonggao = gonggao;
	}

	public String getFootgoogao() {
		return footgoogao;
	}

	public void setFootgoogao(String footgoogao) {
		this.footgoogao = footgoogao;
	}

	public String getFootphone() {
		return footphone;
	}

	public void setFootphone(String footphone) {
		this.footphone = footphone;
	}

	public String getFootaddress() {
		return footaddress;
	}

	public void setFootaddress(String footaddress) {
		this.footaddress = footaddress;
	}

	public String getFootemail() {
		return footemail;
	}

	public void setFootemail(String footemail) {
		this.footemail = footemail;
	}

	public String getQuicklinik() {
		return quicklinik;
	}

	public void setQuicklinik(String quicklinik) {
		this.quicklinik = quicklinik;
	}

	public String getUserquick() {
		return userquick;
	}

	public void setUserquick(String userquick) {
		this.userquick = userquick;
	}

	public String getQuickaddress() {
		return quickaddress;
	}

	public void setQuickaddress(String quickaddress) {
		this.quickaddress = quickaddress;
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

	public String getTemp6() {
		return temp6;
	}

	public void setTemp6(String temp6) {
		this.temp6 = temp6;
	}

	public String getTemp7() {
		return temp7;
	}

	public void setTemp7(String temp7) {
		this.temp7 = temp7;
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
		return "Setting [id=" + id + ", adminname=" + adminname + ", pagetype=" + pagetype + ", startpage=" + startpage
				+ ", count=" + count + ", gonggao=" + gonggao + ", footgoogao=" + footgoogao + ", footphone="
				+ footphone + ", footaddress=" + footaddress + ", footemail=" + footemail + ", quicklinik=" + quicklinik
				+ ", userquick=" + userquick + ", quickaddress=" + quickaddress + ", temp1=" + temp1 + ", temp2="
				+ temp2 + ", temp3=" + temp3 + ", temp4=" + temp4 + ", temp5=" + temp5 + ", temp6=" + temp6 + ", temp7="
				+ temp7 + ", createtime=" + createtime + ", updatetime=" + updatetime + "]";
	}

}
