package pension.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pension.base.Action;
import res.dao.ResDao;

public class MenuActionCancelResv implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resNum = Integer.parseInt(request.getParameter("resnum"));
		int custNum = Integer.parseInt(request.getParameter("custnum"));
		
		ResDao rDao = new ResDao();
		rDao.cancelResv(resNum);
		
		String         path     = "/view/checkresv.jsp?resnum="+resNum+"&custnum="+custNum;
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}
