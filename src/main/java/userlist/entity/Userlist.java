package userlist.entity;

import java.sql.Timestamp;

public class Userlist {
	private String sessionid;
	private Integer listid;
	private String userid;
	private String username;
	private String remoteaddress;
	private String remotehost;
	private String serverport;
	private String actives;
	private Timestamp createtime;
	private String temp1;
	private String temp2;

	/*
	取得客户端的用户*/
	@Override
	public String toString() {
		return "Userlist [sessionid=" + sessionid + ", listid=" + listid + ", userid=" + userid + ", username="
				+ username + ", remoteaddress=" + remoteaddress + ", remotehost=" + remotehost + ", serverport="
				+ serverport + ", actives=" + actives + ", createtime=" + createtime + ", temp1=" + temp1 + ", temp2="
				+ temp2 + "]";
	}

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}

	public String getServerport() {
		return serverport;
	}

	public void setServerport(String serverport) {
		this.serverport = serverport;
	}

	public String getActives() {
		return actives;
	}

	public void setActives(String actives) {
		this.actives = actives;
	}

	public Integer getListid() {
		return listid;
	}

	public void setListid(Integer listid) {
		this.listid = listid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRemoteaddress() {
		return remoteaddress;
	}

	public void setRemoteaddress(String remoteaddress) {
		this.remoteaddress = remoteaddress;
	}

	public String getRemotehost() {
		return remotehost;
	}

	public void setRemotehost(String remotehost) {
		this.remotehost = remotehost;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
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
}
