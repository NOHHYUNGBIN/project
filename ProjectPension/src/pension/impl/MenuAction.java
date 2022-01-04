package pension.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pension.base.Action;

public class MenuAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resnum = 0;
		int custnum = 0;
		String res = request.getParameter("resnum");
		String cust = request.getParameter("custnum");
		if(res!=null) {
			resnum = Integer.parseInt(res);
			custnum = Integer.parseInt(cust);
			request.setAttribute("resnum", resnum);
			request.setAttribute("custnum", custnum);
		}
		
		String         path     = "/view/index.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}
