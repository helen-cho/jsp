package model;

import java.sql.*;
import java.text.*;
import java.util.ArrayList;

public class ProDAOImpl implements ProDAO{
	Connection con=Database.CON;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public ArrayList<ProVO> list(QueryVO vo) {
		ArrayList<ProVO> array=new ArrayList<ProVO>();
		try {
			String sql="select * from professors";
			sql += " where " + vo.getKey() + " like ?";
			sql += " limit ?, ?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() + "%");
			ps.setInt(2, (vo.getPage()-1) * vo.getSize());
			ps.setInt(3, vo.getSize());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ProVO pro=new ProVO();
				pro.setPcode(rs.getString("pcode"));
				pro.setPname(rs.getString("pname"));
				pro.setDept(rs.getString("dept"));
				pro.setTitle(rs.getString("title"));
				pro.setHiredate(sdf.format(rs.getTimestamp("hiredate")));
				pro.setSalary(rs.getInt("salary"));
				System.out.println(pro.toString());
				array.add(pro);
				
			}
		}catch(Exception e) {
			System.out.println("교수목록:" + e.toString());
		}
		return array;
	}

	@Override
	public int total(QueryVO vo) {
		int total=0;
		try {
			String sql="select count(*) from professors";
			sql+=" where " + vo.getKey() + " like ?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() + "%");
			ResultSet rs=ps.executeQuery();
			if(rs.next()) total=rs.getInt("count(*)");
		}catch(Exception e) {
			System.out.println("검색수:" + e.toString());
		}
		return total;
	}

	@Override
	public void insert(ProVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ProVO read(String pcode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(ProVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String pcode) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getCode() {
		String code="";
		try {
			String sql="select max(pcode)+1 code from professors";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) code=rs.getString("code");
		}catch(Exception e) {
			System.out.println("새코드:" + e.toString());
		}
		return code;
	}
}


