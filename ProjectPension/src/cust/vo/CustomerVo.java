package cust.vo;

public class CustomerVo {
	private int cust_num;
	private String cust_name;
	private String birth;
	private String tel;
	private int res_count;
	private int cancel_count;
	public CustomerVo() {}
	public CustomerVo(int cust_num, String cust_name, String birth, String tel, int res_count, int cancel_count) {
		super();
		this.cust_num = cust_num;
		this.cust_name = cust_name;
		this.birth = birth;
		this.tel = tel;
		this.res_count = res_count;
		this.cancel_count = cancel_count;
	}
	public CustomerVo(String name, String tel, String birth) {
		this.cust_name = name;
		this.tel = tel;
		this.birth = birth;
	}
	public CustomerVo(String name, String tel) {
		this.cust_name = name;
		this.tel = tel;
		
	}
	public int getCust_num() {
		return cust_num;
	}
	public void setCust_num(int cust_num) {
		this.cust_num = cust_num;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getRes_count() {
		return res_count;
	}
	public void setRes_count(int res_count) {
		this.res_count = res_count;
	}
	public int getCancel_count() {
		return cancel_count;
	}
	public void setCancel_count(int cancel_count) {
		this.cancel_count = cancel_count;
	}
	@Override
	public String toString() {
		return "CustomerVo [cust_num=" + cust_num + ", cust_name=" + cust_name + ", birth=" + birth + ", tel=" + tel
				+ ", res_count=" + res_count + ", cancel_count=" + cancel_count + "]";
	}
	
}
