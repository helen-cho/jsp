package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.*;

@WebServlet(value="/enroll/list.json")
public class EnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ErollDAO dao=new ErollDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		switch(request.getServletPath()) {
		case "/enroll/list.json": //테스트 /enroll/list.json?scode=92414029
			Gson gson=new Gson();
			out.print(gson.toJson(dao.list(request.getParameter("scode"))));
			break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
