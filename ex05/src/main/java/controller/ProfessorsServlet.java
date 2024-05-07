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

@WebServlet(value={"/pro/list", "/pro/insert", "/pro/list.json", "/pro/total"})
public class ProfessorsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProDAOImpl dao=new ProDAOImpl();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		RequestDispatcher dis=request.getRequestDispatcher("/home.jsp");
		switch(request.getServletPath()) {
		case "/pro/total": //테스트 /pro/total?key=dept&word=건축
			String key1=request.getParameter("key")==null ? "pcode":
				request.getParameter("key");
			String word1=request.getParameter("word")==null ? "":
				request.getParameter("word");
			QueryVO vo1=new QueryVO();
			vo1.setKey(key1);
			vo1.setWord(word1);
			out.print(dao.total(vo1));
			break;
		case "/pro/list":
			request.setAttribute("pageName", "/pro/list.jsp");
			dis.forward(request, response);
			break;
		case "/pro/list.json": //테스트 /pro/list.json?key=dept&word=전산
			int page=request.getParameter("page")==null ? 1 :
				Integer.parseInt(request.getParameter("page"));
			int size=request.getParameter("size")==null ? 2 :
				Integer.parseInt(request.getParameter("size"));
			String key=request.getParameter("key")==null ? "pcode":
				request.getParameter("key");
			String word=request.getParameter("word")==null ? "":
				request.getParameter("word");
			
			QueryVO vo=new QueryVO();
			vo.setPage(page);
			vo.setSize(size);
			vo.setKey(key);
			vo.setWord(word);
			
			Gson gson=new Gson();
			out.print(gson.toJson(dao.list(vo)));
			break;
		case "/pro/insert":
			request.setAttribute("pageName", "/pro/insert.jsp");
			dis.forward(request, response);
			break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
