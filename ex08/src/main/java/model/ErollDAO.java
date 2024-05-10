package model;
import java.util.*;
import java.sql.*;

public class ErollDAO {
	Connection con=Database.CON;
	
	//특정학생의 수강신청목록
	public ArrayList<EnrollVO> list(String scode){
		ArrayList<EnrollVO> array=new ArrayList<EnrollVO>();
		try {
			String sql="select * from view_enr_cou where scode=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, scode);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				EnrollVO vo=new EnrollVO();
				vo.setScode(rs.getString("scode"));
				vo.setLcode(rs.getString("lcode"));
				vo.setLname(rs.getString("lname"));
				vo.setHours(rs.getInt("hours"));
				vo.setRoom(rs.getString("room"));
				vo.setPcode(rs.getString("instructor"));
				vo.setPersons(rs.getInt("persons"));
				vo.setCapacity(rs.getInt("capacity"));
				vo.setEdata(rs.getString("edate"));
				vo.setGrade(rs.getInt("grade"));
				vo.setPname(rs.getString("pname"));
				System.out.println(vo.toString());
				array.add(vo);
			}
		}catch(Exception e) {
			System.out.println("수강신청목록:" + e.toString());
		}
		return array;
	}
}
