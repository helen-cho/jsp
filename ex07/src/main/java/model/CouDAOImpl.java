package model;

import java.util.ArrayList;
import java.sql.*;

public class CouDAOImpl implements CouDAO{
	Connection con=Database.CON;
	
	@Override
	public ArrayList<CouVO> list(QueryVO vo) {
		ArrayList<CouVO> array=new ArrayList<CouVO>();
		try {
			String sql="select * from view_cou";
			sql += " where " + vo.getKey() + " like ?";
			sql += " limit ?, ?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() + "%");
			ps.setInt(2, (vo.getPage()-1) * vo.getSize());
			ps.setInt(3, vo.getSize());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CouVO cou=new CouVO();
				cou.setLcode(rs.getString("lcode"));
				cou.setLname(rs.getString("lname"));
				cou.setHours(rs.getInt("hours"));
				cou.setRoom(rs.getString("room"));
				cou.setInstructor(rs.getInt("instructor"));
				cou.setPersons(rs.getInt("persons"));
				cou.setPname(rs.getString("pname"));
				System.out.println(cou.toString());
				array.add(cou);
			}
		}catch(Exception e) {
			System.out.println("강좌목록:" + e.toString());
		}
		return array;
	}

}
