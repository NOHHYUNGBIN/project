package pension.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pension.base.Action;

public class MenuActionCheckResv implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String         path     = "/view/checkresv.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}
