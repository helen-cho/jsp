package model;

public class DBTest {
	public static void main(String[] args) {
		BBSDAOImpl dao=new BBSDAOImpl();
		//dao.list();
		//dao.read(2);
		//System.out.println("갯수..........." + dao.total());
		//dao.list(1, 3, "리액트");
		System.out.println("red 갯수:" + dao.total("red"));
	}
}
