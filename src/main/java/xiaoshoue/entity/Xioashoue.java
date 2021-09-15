package xiaoshoue.entity;

public class Xioashoue {
	private String fenlei;
	private double liushui;
	private double lirun;
	public String getFenlei() {
		return fenlei;
	}
	public void setFenlei(String fenlei) {
		this.fenlei = fenlei;
	}
	public double getLiushui() {
		return liushui;
	}
	public void setLiushui(double liushui) {
		this.liushui = liushui;
	}
	public double getLirun() {
		return lirun;
	}
	public void setLirun(double lirun) {
		this.lirun = lirun;
	}
	@Override
	public String toString() {
		return "Xioashoue [fenlei=" + fenlei + ", liushui=" + liushui + ", lirun=" + lirun + "]";
	}
	
}
