package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

@WebServlet(value={"/user/login", "/user/mypage", "/user/join"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserDAO dao=new UserDAO();   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis=request.getRequestDispatcher("/home.jsp");
		switch(request.getServletPath()) {
		case "/user/login":
			request.setAttribute("pageName", "/user/login.jsp");
			break;
		case "/user/mypage":
			break;
		case "/user/join":
			break;
		}
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		switch(request.getServletPath()) {
		case "/user/login":
			String uid=request.getParameter("uid");
			String upass=request.getParameter("upass");
			System.out.println(uid + ":" + upass);
			
			int result=0;
			UserVO vo=dao.read(uid);
			if(vo.getUid() != null) {
				if(upass.equals(vo.getUpass())) {
					result=1;
				}else {
					result=2;
				}
			}
			out.print(result);
			break;
		}
	}
}









