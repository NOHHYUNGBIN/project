package check.vo;

public class CheckVo {
	private int res_num;
	private String cust_name;
	private String room_name;
	private int room_num;
	private String in_date;
	private int headcount;
	private int cost;
	private int checked;
	
	public CheckVo() {
	}
	
	public CheckVo(int res_num, String cust_name, String room_name, int room_num, String in_date, int headcount,
			int cost, int checked) {
		this.res_num = res_num;
		this.cust_name = cust_name;
		this.room_name = room_name;
		this.room_num = room_num;
		this.in_date = in_date;
		this.headcount = headcount;
		this.cost = cost;
		this.checked = checked;
	}

	public int getRes_num() {
		return res_num;
	}

	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

	public int getHeadcount() {
		return headcount;
	}

	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	@Override
	public String toString() {
		return "CheckVo [res_num=" + res_num + ", cust_name=" + cust_name + ", room_name=" + room_name + ", room_num="
				+ room_num + ", in_date=" + in_date + ", headcount=" + headcount + ", cost=" + cost + ", checked="
				+ checked + "]";
	}
	
}
