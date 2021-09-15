package goods.entity;

import java.sql.Timestamp;

public class Goods {
	private String id;
	private String coursename;
	private double singleprice;
	private double youhui;
	private String fenlei;
	private String img;
	private int kucunliang;
	private double jinjia;
	private String jianjie;
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	private Timestamp createtime;
	private Timestamp updatetime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public double getSingleprice() {
		return singleprice;
	}

	public void setSingleprice(double singleprice) {
		this.singleprice = singleprice;
	}

	public double getYouhui() {
		return youhui;
	}

	public void setYouhui(double youhui) {
		this.youhui = youhui;
	}

	public String getFenlei() {
		return fenlei;
	}

	public void setFenlei(String fenlei) {
		this.fenlei = fenlei;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getKucunliang() {
		return kucunliang;
	}

	public void setKucunliang(int kucunliang) {
		this.kucunliang = kucunliang;
	}

	public double getJinjia() {
		return jinjia;
	}

	public void setJinjia(double jinjia) {
		this.jinjia = jinjia;
	}

	public String getJianjie() {
		return jianjie;
	}

	public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
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
		return "Goods [id=" + id + ", coursename=" + coursename + ", singleprice=" + singleprice + ", youhui=" + youhui
				+ ", fenlei=" + fenlei + ", img=" + img + ", kucunliang=" + kucunliang + ", jinjia=" + jinjia
				+ ", jianjie=" + jianjie + ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3=" + temp3 + ", temp4="
				+ temp4 + ", temp5=" + temp5 + ", createtime=" + createtime + ", updatetime=" + updatetime + "]";
	}

}
