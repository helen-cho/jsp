package model;

public class TestDB {

	public static void main(String[] args) {
		StuDAOImpl dao=new StuDAOImpl();
		QueryVO vo=new QueryVO();
		vo.setPage(2);
		vo.setSize(2);
		vo.setKey("dept");
		vo.setWord("전산");
		dao.list(vo);
	}

}
