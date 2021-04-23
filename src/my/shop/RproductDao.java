package my.shop;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.xml.ws.soap.MTOM;

import com.oreilly.servlet.MultipartRequest;

public class RproductDao {
	
	private static RproductDao instance;
	private Connection conn= null;
	
	private RproductDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection() ;

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static RproductDao getInstance() {
		if(instance == null) {
			instance = new RproductDao();
		}
		
		return instance;
	}
	
	public int insertRproduct(MultipartRequest mr) throws SQLException{
		PreparedStatement pstmt = null;
		String sql = "insert into roomproduct values(rpseq.nextval,?,?,?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		
		String pname = mr.getParameter("pname");
		String pcategory = mr.getParameter("pcategory");
		String pcompany = mr.getParameter("pcompany");
		String pimage = mr.getFilesystemName("pimage");
		String pqty = mr.getParameter("pqty");
		String price = mr.getParameter("price");
		String pcontents = mr.getParameter("pcontents");
		String pref = mr.getParameter("pref");
		String point = mr.getParameter("point");
	
		
		pstmt.setString(1, pname);
		pstmt.setString(2, pcategory);
		pstmt.setString(3, pcompany);
		pstmt.setString(4, pimage);
		pstmt.setString(5, pqty);
		pstmt.setString(6, price);
		pstmt.setString(7, pcontents);
		pstmt.setString(8, pref);
		pstmt.setString(9, point);

		
		/*
		 * this.pno=pno; this.pname = pname; this.pcategory = pcategory; this.pcompany =
		 * pcompany; this.pimage = pimage; this.pqty = pqty; this.price = price;
		 * this.pcontents = pcontents; this.point = point; this.pref = pref;
		 */
		//==========이 아래는 뭔지 모르겠는데 그냥 따라씀
		/*
		 * Date d = new Date(0); SimpleDateFormat sdf = new
		 * SimpleDateFormat("yyyy-MM-dd"); String today = sdf.format(d);
		 * pstmt.setString(10, today);
		 */
		int cnt = pstmt.executeUpdate();

		pstmt.close();

		return cnt;
		
	}
	
	public ArrayList<RproductBean> getAllRproducts() throws SQLException{
		
		ArrayList<RproductBean> arr = new ArrayList<RproductBean>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from roomproduct order by pno";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int pno = rs.getInt(1);
			String pname = rs.getString(2);
			String pcategory = rs.getString(3);
			String pcompany = rs.getString(4);
			String pimage = rs.getString(5);
			int pqty = rs.getInt(6);
			int price = rs.getInt(7);
			String pcontents = rs.getString(8);
			String pref = rs.getString(9);
			int point = rs.getInt(10);
			
			RproductBean rpbean = new RproductBean(pno, pname, pcategory, pcompany,pimage, 
					pqty, price, pcontents, pref, point, 0, 0, 0);
			
			arr.add(rpbean);
			
		}
		pstmt.close();
		return arr;
		
		
	}
	
	public int deleteRproduct(String pno) throws SQLException{
		PreparedStatement pstmt = null;
		int cnt = -1;
		String sql = "delete from roomproduct where pno=?";
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1, pno);
		cnt = pstmt.executeUpdate();
		pstmt.close();
		return cnt;
		
	}
	
	public int updateRproduct(MultipartRequest mr) {
		
		String pcategory = mr.getParameter("pcategory");
		String pname = mr.getParameter("pname");
		String pimage2 = mr.getParameter("pimage2");
		String pimage = mr.getOriginalFileName("pimage");
		
		if(pimage == null) {
			if(pimage2 != null) { // 기존꺼가 지워지지 않음
				pimage = pimage2;
			}
		}
		
		String pcompany = mr.getParameter("pcompany");
		String pqty = mr.getParameter("pqty");
		String price = mr.getParameter("price");
		String pcontents = mr.getParameter("pcontents");
		String pref = mr.getParameter("pref");
		String point = mr.getParameter("point");
		String pno = mr.getParameter("pno");
		
		PreparedStatement pstmt = null;
		
		int cnt = -1;
		
		String sql = "update roomproduct set pname=?, pcategory=?, "+
					"pcompany=?, pimage=?, pqty=?, price=?, pcontents=?, "+
					"pref=?, point=? where pno=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pname);
			pstmt.setString(2, pcategory);
			pstmt.setString(3, pcompany);
			pstmt.setString(4, pimage);
			pstmt.setInt(5, Integer.parseInt(pqty));
			pstmt.setInt(6, Integer.parseInt(price));
			pstmt.setString(7, pcontents);
			pstmt.setString(8, pref);
			pstmt.setInt(9, Integer.parseInt(point));
			pstmt.setInt(10, Integer.parseInt(pno));
			
			cnt = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
		}finally {
			try {
				pstmt.close();
			}catch(SQLException e) {
				
			}
		}
		
		return cnt;
		
	}
	
	public RproductBean selectByPno(String pno) throws SQLException{
		RproductBean rpbean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from roomproduct where pno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pno);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			int pno2=rs.getInt(1);
			String pname = rs.getString(2);
			String pcategory = rs.getString(3);
			String pcompany = rs.getString(4);
			String pimage = rs.getString(5);
			int pqty= rs.getInt(6);
			int price= rs.getInt(7);
			String pcontents = rs.getString(8);
			String pref = rs.getString(9);
			int point = rs.getInt(10);
			rpbean = new RproductBean(pno2, pname, pcategory, pcompany, 
					pimage, pqty, price, pcontents, pref, point, 0, 0, 0);
			
			
		}
		pstmt.close();
		
		
		return rpbean;
		
	}
	
	public ArrayList<RproductBean> selectByPpref(String ppref) throws SQLException{
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RproductBean> lists = new ArrayList<RproductBean>();
		String sql = "select * from roomproduct where pref=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, ppref);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			int pno= rs.getInt(1);
			String pname = rs.getString(2);
			String pcategory = rs.getString(3);
			String pcompany = rs.getString(4);
			String pimage = rs.getString(5);
			int pqty = rs.getInt(6);
			int price = rs.getInt(7);
			String pcontents = rs.getString(8);
			String pref = rs.getString(9);
			int point = rs.getInt(10);
			RproductBean rpbean = new RproductBean(pno, pname, pcategory,
					pcompany, pimage, pqty, price, pcontents, pref,point, 0, 0, 0);
			
			lists.add(rpbean);
		}
		pstmt.close();
		return lists;
		
	}
	
	public ArrayList<RproductBean> selectByRcategory(String catname) throws SQLException{
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RproductBean> lists = new ArrayList<RproductBean>();
		
		String sql = "select * from roomproduct where pcategory= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, catname);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int pno= rs.getInt(1);
			String pname = rs.getString(2);
			String pcategory = rs.getString(3);
			String pcompany = rs.getString(4);
			String pimage = rs.getString(5);
			int pqty = rs.getInt(6);
			int price = rs.getInt(7);
			String pcontents = rs.getString(8);
			String pref = rs.getString(9);
			int point = rs.getInt(10);
			
			RproductBean rpbean = new RproductBean(pno, pname, pcategory,
					pcompany, pimage, pqty, price, pcontents, pref,point, 0, 0, 0);
			
			lists.add(rpbean);
		}
		rs.close();
		pstmt.close();
		
		return lists;
		
	}
	
	
}
