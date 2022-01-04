package pension.base;

import pension.impl.MenuAction;
import pension.impl.MenuActionCalendar;
import pension.impl.MenuActionCancelResv;
import pension.impl.MenuActionCheckResv;
import pension.impl.MenuActionCheckResvForm;
import pension.impl.MenuActionMap;
import pension.impl.MenuActionResv;
import pension.impl.MenuActionResvForm;
import pension.impl.MenuActionRoomCalendar;
import pension.impl.MenuActionRoomInfo;
import pension.impl.MenuActionRooms;
import pension.impl.MenuActionTravel;

public class ActionFactory {
	
	public  Action  getAction(String command) {
		
		Action   action = null;
		switch (command) {
		// Menu
		case  "MENU":   // index
			action     =  new  MenuAction();
			break;
		case  "ROOMS":   // 방목록
			action     =  new  MenuActionRooms();
			break;
		case  "MAP":   // 찾아오시는 길
			action     =  new  MenuActionMap();
			break;
		case  "CALENDAR":   // 실시간 예약달력
			action     =  new  MenuActionCalendar();
			break;
		case  "TRAVEL":   // 실시간 예약달력
			action     =  new  MenuActionTravel();
			break;

		
		// Room
		case  "ROOMINFO":   // 방 상세
			action     =  new  MenuActionRoomInfo();
			break;
			
		//Resv
			
		case  "RESVFORM":   // 예약입력
			action     =  new  MenuActionResvForm();
			break;
		case  "RESV":   // 예약
			action     =  new  MenuActionResv();
			break;
		case  "ROOMCALENDAR":   // 객실별 예약달력
			action     =  new  MenuActionRoomCalendar();
			break;
		
		//Check
			
		case  "CHECKRESV":   // 예약
			action     =  new  MenuActionCheckResv();
			break;
		case  "CHECKRESVFORM":   // 예약
			action     =  new  MenuActionCheckResvForm();
			break;
		case  "CANCELRESV":   // 예약취소
			action     =  new  MenuActionCancelResv();
			break;
			
		default:
			break;
		}
		
		return action;
		
	} 
	
}






