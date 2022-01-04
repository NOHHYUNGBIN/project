package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import room.dao.RoomDao;
import room.vo.RoomVo;


@WebServlet("/getroomlist")
public class GetRoomList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RoomDao rDao =new RoomDao();
		List<RoomVo> roomList = rDao.getRoomList();
		
		String xml = "<roomlist>";
		for (RoomVo rvo : roomList) {
			xml += rvo.toXML();
			
		}
		xml += "</roomlist>";
		response.setContentType("application/xml;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(xml);
		out.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
