package model;
import java.util.*;

public interface ProDAO {
	//교수목록
	public ArrayList<ProVO> list(QueryVO vo);
	
	//검색수
	public int total(QueryVO vo);
	
	//교수등록
	public void insert(ProVO vo);
	
	//교수정보
	public ProVO read(String pcode);
	
	//교수정보수정
	public void update(ProVO vo);
	
	//교수정보삭제
	public void delete(String pcode);
}
