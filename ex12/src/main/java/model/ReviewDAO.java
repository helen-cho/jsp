package model;
import java.sql.*;

public class ReviewDAO {
	Connection con=Database.CON;
	
	//리뷰등록
	public void insert(ReviewVO vo) {
		try {
			String sql="insert into review(gid, uid, content) values(?, ?, ?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, vo.getGid());
			ps.setString(2, vo.getUid());
			ps.setString(3, vo.getContent());
			ps.execute();
		}catch(Exception e) {
			System.out.println("리뷰등록:" + e.toString());
		}
	}
}
