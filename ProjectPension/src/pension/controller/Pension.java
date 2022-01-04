package pension.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pension.base.Action;
import pension.base.ActionFactory;

@WebServlet("/pension")
public class Pension extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {
		requestFunc(request, response);
	}

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response)
					throws ServletException, IOException {
		requestFunc(request, response);
	}

	private void requestFunc(HttpServletRequest request, 
			HttpServletResponse response) 
				throws ServletException, IOException {
		
		// 넘어온 한글처리
		request.setCharacterEncoding("UTF-8");
		String   command       =  request.getParameter("cmd");
		
		//System.out.println("command:" + command);
		
		// 이동할 주소를 결정하는 클래스
	    ActionFactory  fac     =  new ActionFactory();
	    Action         action  =  fac.getAction( command );

		action.execute(request, response);
	}

}




