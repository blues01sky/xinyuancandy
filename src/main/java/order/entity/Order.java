package order.entity;

import java.sql.Timestamp;

public class Order {
	private String id;
	private String orderid;
	private String name;
	private String goodsname;
	private double singleprice;
	private int goodsnum;
	private double sumprice;
	private String address;
	private String phone;
	private String zhushi;
	private String status;
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	private Timestamp createtime;
	private Timestamp updatetime;

	/*
	 * 将temp1作为这个订单的总价存储 temp2作为邮费 temp3作为用户名 temp4作为图片地址temp5作为产品id
	 * 1095*555
	 * status 1 收藏 2 购物车3商家取消订单 4 未付款 5 已付款 6用户取消订单 7商家发货 8用户确认收货
	 * 
	 */
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public double getSingleprice() {
		return singleprice;
	}

	public void setSingleprice(double singleprice) {
		this.singleprice = singleprice;
	}

	public int getGoodsnum() {
		return goodsnum;
	}

	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}

	public double getSumprice() {
		return sumprice;
	}

	public void setSumprice(double sumprice) {
		this.sumprice = sumprice;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZhushi() {
		return zhushi;
	}

	public void setZhushi(String zhushi) {
		this.zhushi = zhushi;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
		return "Order [id=" + id + ", orderid=" + orderid + ", name=" + name + ", goodsname=" + goodsname
				+ ", singleprice=" + singleprice + ", goodsnum=" + goodsnum + ", sumprice=" + sumprice + ", address="
				+ address + ", phone=" + phone + ", zhushi=" + zhushi + ", status=" + status + ", temp1=" + temp1
				+ ", temp2=" + temp2 + ", temp3=" + temp3 + ", temp4=" + temp4 + ", temp5=" + temp5 + ", createtime="
				+ createtime + ", updatetime=" + updatetime + "]";
	}

}