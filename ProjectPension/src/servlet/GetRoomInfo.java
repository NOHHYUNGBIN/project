package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import room.dao.RoomDao;
import room.vo.RoomVo;


@WebServlet("/getroominfo")
public class GetRoomInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int roomNum = Integer.parseInt(request.getParameter("roomnum"));
		RoomDao rDao = new RoomDao();
		RoomVo rVo = rDao.getRoomInfo(roomNum);
		System.out.println(rVo);
		String xml = rVo.toXML();

		response.setContentType("application/xml;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(xml);
		out.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
