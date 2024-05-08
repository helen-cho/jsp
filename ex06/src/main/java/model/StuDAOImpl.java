package model;

import java.util.ArrayList;
import java.sql.*;

public class StuDAOImpl implements StuDAO{
	Connection con=Database.CON;
	
	@Override
	public ArrayList<StuVO> list(QueryVO vo) {
		ArrayList<StuVO> array=new ArrayList<StuVO>();
		try {
			String sql="select * from view_stu";
			sql += " where " + vo.getKey() +  " like ?";
			sql += " order by scode desc";
			sql += " limit ?, ?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() + "%");
			ps.setInt(2, (vo.getPage()-1) * vo.getSize());
			ps.setInt(3, vo.getSize());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				StuVO stu=new StuVO();
				stu.setScode(rs.getString("scode"));
				stu.setSname(rs.getString("sname"));
				stu.setSdept(rs.getString("dept"));
				stu.setAdvisor(rs.getString("advisor"));
				stu.setPname(rs.getString("pname"));
				stu.setBirthday(rs.getString("birthday"));
				stu.setYear(rs.getInt("year"));
				System.out.println(stu.toString());
				array.add(stu);
			}
		}catch(Exception e) {
			System.out.println("학생목록:" + e.toString());
		}
		return array;
	}

	@Override
	public int total(QueryVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}