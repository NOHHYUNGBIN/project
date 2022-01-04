package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import res.dao.ResDao;
import res.vo.ResVo;


@WebServlet("/getcalendar")
public class GetCalendar extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResDao rDao = new ResDao();
		List<ResVo> resList = rDao.getResList();
		String xml  = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		xml        += "<rows>";
		for (ResVo bookVo : resList) {
	
		}
		xml        += "</rows>";
		
		PrintWriter out = response.getWriter();
		out.print( xml );
		out.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
