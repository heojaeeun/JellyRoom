package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RcategoryDao {
	
	private static RcategoryDao instance;
	private Connection conn = null;
	
	private RcategoryDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); 
			conn = ds.getConnection();
			System.out.println("conn:" + conn);
			
		} catch (NamingException e) {
			e.printStackTrace();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//
	
	public static RcategoryDao getInstance() {
		
		if(instance == null) {
			instance = new RcategoryDao();
		}
		
		return instance;
	}
	
	public ArrayList<RcategoryBean> getAllRcategory() throws SQLException{
		
		ArrayList<RcategoryBean> lists = new ArrayList<RcategoryBean>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from roomcat order by catno asc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			RcategoryBean rcbean = new RcategoryBean();
			rcbean.setCatno(rs.getInt("catno"));
			rcbean.setCatname(rs.getString("catname"));
			lists.add(rcbean);
		}
				
		rs.close();
		pstmt.close();
		return lists;
	}
	
	public int insertRcategory(RcategoryBean rcbean) {
		PreparedStatement pstmt = null;
		String sql = "insert into roomcat values(rcseq.nextval,?)";
		int cnt = -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  rcbean.getCatname());
			cnt = pstmt.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(pstmt != null) {
					pstmt.close();
				}
			}catch(SQLException e) {
				
			}
		}
		
		return cnt;
		
	}//
	
	public int deleteRcategory(String catno) {
		PreparedStatement pstmt = null;
		int cnt = -1;
		String sql= "delete from roomcat where catno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(catno));
			cnt = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
			}catch(SQLException e) {
				
			}
		}
		return cnt;
	}
	
	
}
