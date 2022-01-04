package pension.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pension.base.Action;
import room.dao.RoomDao;
import room.vo.RoomVo;

public class MenuActionRoomInfo implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int room_num   =  Integer.parseInt(request.getParameter("roomnum"));

		String         path     = "/view/roominfo.jsp?roomnum="+room_num;
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}
