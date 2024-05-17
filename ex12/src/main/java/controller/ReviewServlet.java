package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

@WebServlet(value={"/review/insert"})
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ReviewDAO dao=new ReviewDAO();   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		switch(request.getServletPath()) {
		case "/review/insert":
			ReviewVO vo=new ReviewVO();
			vo.setGid(request.getParameter("gid"));
			vo.setUid(request.getParameter("uid"));
			vo.setContent(request.getParameter("content"));
			dao.insert(vo);
			break;
		}
	}
}
