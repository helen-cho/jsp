package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(value={"/bbs/list", "/bbs/insert", "/bbs/read", "/bbs/delete", "/bbs/update"})
public class BBSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis=request.getRequestDispatcher("/home.jsp");
		switch(request.getServletPath()) {
		case "/bbs/list":
			request.setAttribute("pageName", "/bbs/list.jsp");
			dis.forward(request, response);
			break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
