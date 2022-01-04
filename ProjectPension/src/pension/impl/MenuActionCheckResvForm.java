package pension.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.classfile.Attribute;

import cust.dao.CustomerDao;
import cust.vo.CustomerVo;
import pension.base.Action;

public class MenuActionCheckResvForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resNum = Integer.parseInt(request.getParameter("resnum"));
		String name = request.getParameter("custname");
		String tel = request.getParameter("tel");
		CustomerDao cDao = new CustomerDao();
		int custNum= cDao.getCustInfo(name, tel);
	
		String         path     = "/view/checkresvform.jsp?resnum="+resNum+"&custnum="+custNum;
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}
