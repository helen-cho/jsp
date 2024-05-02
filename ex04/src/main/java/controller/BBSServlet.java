package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.*;

@WebServlet(value={"/bbs/list.json", "/bbs/list", "/bbs/insert", "/bbs/read", "/bbs/delete", "/bbs/update"})
public class BBSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    BBSDAOImpl dao=new BBSDAOImpl();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		RequestDispatcher dis=request.getRequestDispatcher("/home.jsp");
		
		switch(request.getServletPath()) {
		case "/bbs/list":
			request.setAttribute("pageName", "/bbs/list.jsp");
			dis.forward(request, response);
			break;
		case "/bbs/list.json":
			Gson gson=new Gson();
			out.print(gson.toJson(dao.list()));
			break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
