package pension.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cust.dao.CustomerDao;
import cust.vo.CustomerVo;
import pension.base.Action;
import res.dao.ResDao;
import room.dao.RoomDao;
import room.vo.RoomVo;

public class MenuActionResv implements Action {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");		
		String birth = request.getParameter("birth");	
		String room = request.getParameter("room_code");
		int roomCode = Integer.parseInt(room.substring(0, 3));
		RoomDao roomDao = new RoomDao();
		RoomVo rvo = roomDao.getRoomCode(roomCode);
		String in_date = request.getParameter("rdate");
		int headcount =  Integer.parseInt(request.getParameter("headcount"));		
		int cost =  Integer.parseInt(request.getParameter("totalpay"));

		
		CustomerDao cDao = new CustomerDao();
		int custNum = cDao.getCustInfo(name, tel);
		
		if(custNum == 0) {
			CustomerVo custVo = new CustomerVo(name,tel,birth);
			cDao.insertCust(custVo);
			custNum = cDao.getCustInfo(name, tel);
		}
		int roomnum = rvo.getRoom_code();
		ResDao rDao = new ResDao();
		rDao.insertResv(roomnum, custNum, in_date, headcount, cost);
		
		int res_num = rDao.getResNum(roomnum,custNum, in_date);
		
		rDao.setOutDate(res_num);
		
		request.setAttribute("resnum", res_num);
		request.setAttribute("custnum", custNum);
		System.out.println(res_num);
		System.out.println(custNum);
				
		String         path     = "/view/checkresv.jsp?resnum="+res_num+"&custnum="+custNum;
		        
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}
