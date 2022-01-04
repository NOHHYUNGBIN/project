package model;

public class MovieVo {
	private String mCode, mName, pName;
	private int mgrade;

	public MovieVo() {
	}




	public MovieVo(String pName) {
		this.pName = pName;
	}

	public MovieVo(String mCode, String mName, int mgrade) {
		this.mCode = mCode;
		this.mName = mName;
		this.mgrade = mgrade;

	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getMgrade() {
		return mgrade;
	}

	public void setMgrade(int mgrade) {
		this.mgrade = mgrade;
	}

	@Override
	public String toString() {
		return "MovieVo [mCode=" + mCode + ", mName=" + mName + ", pName=" + pName + ", mgrade=" + mgrade + "]";
	}

}
