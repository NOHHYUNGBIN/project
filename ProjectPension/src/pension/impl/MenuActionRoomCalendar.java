package pension.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pension.base.Action;

public class MenuActionRoomCalendar implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNum = Integer.parseInt(request.getParameter("roomnum"));
		System.out.println(roomNum);
		
		String         path     = "/view/roomcalendar.jsp?roomnum="+roomNum;
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}
