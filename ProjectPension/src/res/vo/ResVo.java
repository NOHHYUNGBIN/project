package res.vo;

public class ResVo {
	private String res_date;
	private int room_num;
	private int res_num;
	private int cust_num;
	private String room_name;
	private int checked;

	public ResVo() {}

	public ResVo(String res_date, int room_num, int res_num, int cust_num, String room_name, int checked) {
		this.res_date = res_date;
		this.room_num = room_num;
		this.res_num = res_num;
		this.cust_num = cust_num;
		this.room_name = room_name;
		this.checked = checked;
	}

	public ResVo(String res_date, int room_num, int res_num, int cust_num, String room_name) {
		
		this.res_date = res_date;
		this.room_num = room_num;
		this.res_num = res_num;
		this.cust_num = cust_num;
		this.room_name = room_name;
	}

	public ResVo(String res_date, String room_name) {
		this.res_date = res_date;
		this.room_name = room_name;
	}
	
	public ResVo(String res_date, int rum_num, String rum_name, int checked) {
		this.res_date = res_date;
		this.room_num = rum_num;
		this.room_name = rum_name;
		this.checked = checked;
	}

	public ResVo(int resNum, int custNum) {
		this.res_num = resNum;
		this.cust_num = custNum;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getRes_num() {
		return res_num;
	}

	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}

	public int getCust_num() {
		return cust_num;
	}

	public void setCust_num(int cust_num) {
		this.cust_num = cust_num;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	public  String  toJSON() {
		String  fmt = "";
		fmt    +=  "{";
		fmt    +=  "\"res_date\" : \"%s\",";
		fmt    +=  "\"room_num\" : \"%d\",";
		fmt    +=  "\"room_name\" : \"%s\",";
		fmt    +=  "\"checked\" : \"%d\"";
		fmt    +=  "}";
		String json = String.format(fmt, 
				res_date, room_num, room_name, checked);
		return  json;
	}
	public  String  toJSON2() {
		String  fmt = "";
		fmt    +=  "{";
		fmt    +=  "\"res_num\" : \"%d\",";
		fmt    +=  "\"cust_num\" : \"%d\"";
		fmt    +=  "}";
		String json = String.format(fmt, 
				res_num, cust_num);
		return  json;
	}

	@Override
	public String toString() {
		return "ResVo [res_date=" + res_date + ", room_num=" + room_num + ", res_num=" + res_num + ", cust_num="
				+ cust_num + ", room_name=" + room_name + ", checked=" + checked + "]";
	}


	
}

	
