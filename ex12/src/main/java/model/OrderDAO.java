package model;
import java.sql.*;

public class OrderDAO {
	Connection con=Database.CON;
	//주문상품 등록
	public void insert(OrderVO vo) {
		try {
			String sql="insert into orders(pid,gid,price,qnt) values(?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, vo.getPid());
			ps.setString(2, vo.getGid());
			ps.setInt(3, vo.getPrice());
			ps.setInt(4, vo.getQnt());
			ps.execute();
		}catch(Exception e) {
			System.out.println("주문상품 등록");
		}
	}
	
	//주문자정보 등록
	public void insert(PurchaseVO vo) {
		try {
			String sql="insert into purchase(pid,uid,rname,rphone,raddress1,raddress2,sum) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, vo.getPid());
			ps.setString(2, vo.getUid());
			ps.setString(3, vo.getUname());
			ps.setString(4, vo.getPhone());
			ps.setString(5, vo.getAddress1());
			ps.setString(6, vo.getAddress2());
			ps.setInt(7, vo.getSum());
			ps.execute();
		}catch(Exception e) {
			System.out.println("주문자정보 등록");
		}
	}
}
