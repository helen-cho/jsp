package model;

import java.sql.*;

public class GoodsDAO {
	Connection con=Database.CON;
	
	//상품등록
	public boolean insert(GoodsVO vo) {
		try {
			String sql="insert into goods(gid, title, price, brand, image)";
			sql += " values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, vo.getGid());
			ps.setString(2, vo.getTitle());
			ps.setInt(3, vo.getPrice());
			ps.setString(4, vo.getBrand());
			ps.setString(5, vo.getImage());
			ps.execute();
			return true;
		}catch(Exception e) {
			System.out.println("상품등록:" + e.toString());
			return false;
		}
	}
}
