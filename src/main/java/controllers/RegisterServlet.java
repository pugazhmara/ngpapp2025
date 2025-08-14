package controllers;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import dao.RegisterDao;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.RegisterModel;

/**
 * Servlet implementation class RegisterServlet
 */
//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String  name=request.getParameter("uname");
		String  pass=request.getParameter("pass");
		String  email=request.getParameter("email");
		String  mobile=request.getParameter("mobile");
		String  pin=request.getParameter("pin");
		RegisterModel rg=new RegisterModel();
		rg.setName(name);
		rg.setEmail(email);
		rg.setMobile(mobile);
		rg.setPass(pass);
		rg.setPin(pin);
		RegisterDao rd=new RegisterDao();
		if(rd.register(rg)) {
			response.sendRedirect("\\NGPWEBAPP\\views\\LoginView.jsp");
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
