package model;

public class DBTest {

	public static void main(String[] args) {
		//UserDAO dao=new UserDAO();
		//UserVO vo=dao.read("blue");
		//System.out.println(vo.toString());
		
		CartDAO dao=new CartDAO();
		dao.list("red");
	}

}
