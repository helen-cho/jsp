package model;

public class TestDB {

	public static void main(String[] args) {
		StuDAOImpl dao=new StuDAOImpl();
		boolean result=dao.delete("96414404");
		System.out.println("결과:" + result);
	}

}
