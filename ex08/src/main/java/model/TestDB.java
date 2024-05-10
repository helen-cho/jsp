package model;

public class TestDB {

	public static void main(String[] args) {
		CouDAOImpl dao=new CouDAOImpl();
//		QueryVO vo=new QueryVO();
//		vo.setKey("lname");
//		vo.setWord("리");
//		vo.setPage(1);
//		vo.setSize(2);
//		dao.list(vo);
//		System.out.println("검색수:" + dao.total(vo));
		//dao.read("N223");
		System.out.println("N223 삭제결과:" + dao.delete("N223"));
		System.out.println("C421 삭제결과:" + dao.delete("C421"));
	}

}
