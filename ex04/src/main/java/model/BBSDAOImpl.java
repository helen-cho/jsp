package model;

import java.util.ArrayList;
import java.sql.*;

public class BBSDAOImpl implements BBSDAO{
	Connection con=Database.CON;
	
	@Override
	public ArrayList<BBSVO> list() {
		ArrayList<BBSVO> array=new ArrayList<BBSVO>();
		try {
			String sql="select * from view_bbs order by bid desc";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				BBSVO vo=new BBSVO();
				vo.setBid(rs.getInt("bid"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setBdate(rs.getString("bdate"));
				vo.setUname(rs.getString("uname"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContents(rs.getString("contents"));
				array.add(vo);
				System.out.println(vo.toString());
			}
		}catch(Exception e) {
			System.out.println("게시판목록:" + e.toString());
		}
		return array;
	}

	@Override
	public void insert(BBSVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BBSVO read(int bid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(BBSVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int bid) {
		// TODO Auto-generated method stub
		
	}
}
