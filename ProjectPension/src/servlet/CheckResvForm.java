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


@WebServlet("/checkresvform")
public class CheckResvForm extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ResDao rDao = new ResDao();
		List<ResVo> resList = rDao.getResCheck();
		
		String json = "[";
		for (int i = 0; i < resList.size(); i++) {
			ResVo rVo   = resList.get(i);
			json       += rVo.toJSON2();
			if( i < resList.size()-1 )
				json += ",";
		}
		json       += "]";
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
