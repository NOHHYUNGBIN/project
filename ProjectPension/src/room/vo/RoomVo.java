package room.vo;

public class RoomVo {
	private int room_code;
	private String room_name;
	private int room_num;
	private String room_type;
	private int room_person;
	private int room_maxperson;
	private int room_week_cost;
	private int room_weekend_cost;

	public RoomVo() {

	}

	public RoomVo(int room_code, String room_name, int room_num, String room_type, int room_person, int room_maxperson,
			int room_week_cost, int room_weekend_cost) {
		this.room_code = room_code;
		this.room_name = room_name;
		this.room_num = room_num;
		this.room_type = room_type;
		this.room_person = room_person;
		this.room_maxperson = room_maxperson;
		this.room_week_cost = room_week_cost;
		this.room_weekend_cost = room_weekend_cost;
	}

	public int getRoom_code() {
		return room_code;
	}

	public void setRoom_code(int room_code) {
		this.room_code = room_code;
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

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public int getRoom_person() {
		return room_person;
	}

	public void setRoom_person(int room_person) {
		this.room_person = room_person;
	}

	public int getRoom_maxperson() {
		return room_maxperson;
	}

	public void setRoom_maxperson(int room_maxperson) {
		this.room_maxperson = room_maxperson;
	}

	public int getRoom_week_cost() {
		return room_week_cost;
	}

	public void setRoom_week_cost(int room_week_cost) {
		this.room_week_cost = room_week_cost;
	}

	public int getRoom_weekend_cost() {
		return room_weekend_cost;
	}

	public void setRoom_weekend_cost(int room_weekend_cost) {
		this.room_weekend_cost = room_weekend_cost;
	}

	@Override
	public String toString() {
		return "RoomVo [room_code=" + room_code + ", room_name=" + room_name + ", room_num=" + room_num + ", room_type="
				+ room_type + ", room_person=" + room_person + ", room_maxperson=" + room_maxperson
				+ ", room_week_cost=" + room_week_cost + ", room_weekend_cost=" + room_weekend_cost + "]";
	}

	public String toXML() {

		String fmt = "<room>";
		fmt += "	<room_code>%d</room_code>";
		fmt += "	<room_name>%s</room_name>";
		fmt += "	<room_num>%d</room_num>";
		fmt += "	<room_type>%s</room_type>";
		fmt += "	<room_person>%d</room_person>";
		fmt += "	<room_maxperson>%d</room_maxperson>";
		fmt += "	<room_week_cost>%d</room_week_cost>";
		fmt += "	<room_weekend_cost>%d</room_weekend_cost>";
		fmt += "</room>";
		String xml = String.format(fmt, room_code, room_name, room_num, room_type, room_person, room_maxperson,
				room_week_cost, room_weekend_cost);

		return xml;
	}
	
	public  String  toJSON() {
		String  fmt = "[";
		fmt    +=  "{";
		fmt    +=  "\"room_code\" : \"%d\",";
		fmt    +=  "\"room_name\" : \"%s\",";
		fmt    +=  "\"room_num\" : \"%d\",";
		fmt    +=  "\"room_type\" : \"%s\",";
		fmt    +=  "\"room_person\" : \"%d\",";
		fmt    +=  "\"room_maxperson\" : \"%d\",";
		fmt    +=  "\"room_week_cost\" : \"%d\",";
		fmt    +=  "\"room_weekend_cost\" : \"%d\"";
		fmt    +=  "}";
		fmt    +=  "]";
		String json = String.format(fmt, room_code, room_name, room_num, room_type, room_person, room_maxperson,
				room_week_cost, room_weekend_cost);

		return  json;
	}

}
