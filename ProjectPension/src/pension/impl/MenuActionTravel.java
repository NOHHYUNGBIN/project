package pension.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pension.base.Action;

public class MenuActionTravel implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String         path     = "/view/travel.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);


	}

}
