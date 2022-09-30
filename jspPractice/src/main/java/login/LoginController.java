package login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		resp.setContentType("text/html; charset-utf-8");
		
		String id = req.getParameter("id");
		String password = req.getParameter("passwd");
		
		LoginModel bean = new LoginModel();
		bean.setId(id);
		bean.setPassword(password);
		req.setAttribute("bean", bean);
		
		boolean status = bean.validate();
		
		if(status) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("mvc_success.jsp");
			dispatcher.forward(req, resp);
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("mvc_error.jsp");
			dispatcher.forward(req, resp);
		}
		
	}

}
