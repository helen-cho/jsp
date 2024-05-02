package model;

import java.util.ArrayList;
import java.sql.*;
import java.text.*;

public class BBSDAOImpl implements BBSDAO{
	Connection con=Database.CON;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy년MM월dd일 HH:mm:ss");
	
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
				vo.setBdate(sdf.format(rs.getTimestamp("bdate")));
				vo.setUname(rs.getString("uname"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContents(rs.getString("contents"));
				array.add(vo);
				//System.out.println(vo.toString());
			}
		}catch(Exception e) {
			System.out.println("게시판목록:" + e.toString());
		}
		return array;
	}

	@Override
	public void insert(BBSVO vo) {
		try {
			String sql="insert into bbs(title,contents,writer) values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContents());
			ps.setString(3, vo.getWriter());
			ps.execute();
		}catch(Exception e) {
			System.out.println("등록:" + e.toString());
		}
	}

	@Override
	public BBSVO read(int bid) {
		BBSVO vo=new BBSVO();
		try {
			String sql="select * from view_bbs where bid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, bid);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setBid(rs.getInt("bid"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setBdate(sdf.format(rs.getTimestamp("bdate")));
				vo.setUname(rs.getString("uname"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContents(rs.getString("contents"));
				//System.out.println(vo.toString());
			}
		}catch(Exception e) {
			System.out.println("게시글정보:" + e.toString());
		}
		return vo;
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
