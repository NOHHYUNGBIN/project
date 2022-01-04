package pension.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pension.base.Action;
import room.dao.RoomDao;
import room.vo.RoomVo;

public class MenuActionResvForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String         path     = "/view/resvform.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}
