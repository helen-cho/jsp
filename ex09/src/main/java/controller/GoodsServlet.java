package controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NaverAPI;
import model.*;
import model.*;

@WebServlet(value={"/goods/search", "/goods/search.json", "/goods/insert"})
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodsDAO dao=new GoodsDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		RequestDispatcher dis=request.getRequestDispatcher("/home.jsp");
		switch(request.getServletPath()) {
		case "/goods/search":
			request.setAttribute("pageName", "/goods/search.jsp");
			dis.forward(request, response);
			break;
		case "/goods/search.json":
			QueryVO vo=new QueryVO();
			vo.setWord(request.getParameter("query"));
			vo.setPage(Integer.parseInt(request.getParameter("page")));
			vo.setSize(Integer.parseInt(request.getParameter("size")));
			out.print(NaverAPI.main(vo));
			break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		switch(request.getServletPath()) {
		case "/goods/insert":
			GoodsVO vo=new GoodsVO();
			vo.setGid(request.getParameter("gid"));
			vo.setTitle(request.getParameter("title"));
			vo.setPrice(Integer.parseInt(request.getParameter("price")));
			vo.setBrand(request.getParameter("brand"));
			vo.setImage(request.getParameter("image"));
			out.print(dao.insert(vo));
			break;
		}
	}
}












