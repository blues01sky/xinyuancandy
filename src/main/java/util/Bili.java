package util;

public class Bili {
	private String shengfen;
	private int shuliang;

	public String getShengfen() {
		return shengfen;
	}

	public void setShengfen(String shengfen) {
		this.shengfen = shengfen;
	}

	public int getShuliang() {
		return shuliang;
	}

	public void setShuliang(int shuliang) {
		this.shuliang = shuliang;
	}

	@Override
	public String toString() {
		return "Bili [shengfen=" + shengfen + ", shuliang=" + shuliang + "]";
	}

}
