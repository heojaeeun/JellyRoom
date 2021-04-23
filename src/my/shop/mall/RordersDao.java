package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import my.shop.RproductBean;




public class RordersDao {
	
	Connection conn;
	public RordersDao() {
		System.out.println("RordersDao() 생성자");
		
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); 
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//
	
	public int insertOrders(ArrayList<RproductBean> cv, int rmno) throws SQLException{
		
		PreparedStatement ps = null;
		int cnt=0;
		for(int i=0; i<cv.size(); i++) {
			String sql="insert into roomorders(orderId, memno, pno, qty, amount) "
					+"values(roseq.nextval,?,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			ps.setInt(2, cv.get(i).getPno());
			ps.setInt(3, cv.get(i).getPqty());
			ps.setInt(4, cv.get(i).getTotalPrice());
			
			cnt += ps.executeUpdate();
		}
		ps.close();
		return cnt;
		
	}
	
	public ArrayList<RordersBean> getOrderList(String memid) throws SQLException{
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<RordersBean> lists = new ArrayList<RordersBean>();
		
		String sql = "select m.name mname, m.id mid, p.pname, o.qty, o.amount " + 
				"from (roommember m join roomorders o on m.no = o.memno ) join roomproduct p " + 
				"on o.pno = p.pno " + 
				"where m.id = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, memid);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			RordersBean ob = new RordersBean();
			ob.setMname(rs.getString("mname"));
			ob.setMid(rs.getString("mid"));
			ob.setPname(rs.getString("pname"));
			ob.setQty(rs.getInt("qty"));
			ob.setAmount(rs.getInt("amount"));
			lists.add(ob);
		}
		return lists;
		
	}
}
