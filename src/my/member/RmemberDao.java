package my.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RmemberDao {
	
	private Connection conn = null;
	
	private static RmemberDao instance = null;
	
	private RmemberDao() throws Exception{
		System.out.println("RmemberDao()");
		
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); 
		conn = ds.getConnection();
		System.out.println("conn:" + conn);
	
	}
	
	public static RmemberDao getInstance() throws Exception{ //싱글톤 인스턴스 함수
		if(instance == null) {
			instance = new RmemberDao();
		}
		System.out.println("instance:" + instance);
		return instance;
	}
	
	
	public RmemberBean getRmemberInfo(String id, String pw) throws SQLException{
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from roommember where id=? and password=?";
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setString(1, id) ;
		pstmt.setString(2, pw) ;
		
		rs = pstmt.executeQuery() ;
		
		RmemberBean rmember = null;
		
		if(rs.next()) {
			rmember = getRmemberBean(rs);
		}
		
		return rmember;
	}

	private RmemberBean getRmemberBean(ResultSet rs) throws SQLException{
		
		RmemberBean rmember = new RmemberBean();
		
		rmember.setNo(rs.getInt("no"));
		rmember.setName(rs.getString("name"));
		rmember.setId(rs.getString("id"));
		rmember.setPassword(rs.getString("password"));
		rmember.setGender(rs.getString("gender"));
		rmember.setAge(rs.getString("age"));
		rmember.setHp1(rs.getString("hp1"));
		rmember.setHp2(rs.getString("hp2"));
		rmember.setHp3(rs.getString("hp3"));
		rmember.setEmail(rs.getString("email"));
		rmember.setCountry(rs.getString("country"));
		rmember.setPref(rs.getString("pref"));
		
		return rmember;
	}
	
	public int insertRdata(RmemberBean rmember) throws SQLException{
		
		PreparedStatement pstmt=null;
		
		String sql=
				"insert into roommember(no, name, id, password, gender, age, hp1, hp2, hp3, email, country, pref) ";
		sql+= "values(rmseq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		int cnt = -1;
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, rmember.getName());
		pstmt.setString(2, rmember.getId());
		pstmt.setString(3, rmember.getPassword());
		pstmt.setString(4, rmember.getGender());
		pstmt.setString(5, rmember.getAge());
		pstmt.setString(6, rmember.getHp1());
		pstmt.setString(7, rmember.getHp2());
		pstmt.setString(8, rmember.getHp3());
		pstmt.setString(9, rmember.getEmail());
		pstmt.setString(10, rmember.getCountry());
		pstmt.setString(11, rmember.getPref());
		
		cnt = pstmt.executeUpdate();
		
		return cnt;
		
	}
	
	public boolean searchId(String userid) throws SQLException{
		System.out.println("userid:" + userid);
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		boolean flag = false;
		String sql = "select id from roommember where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userid);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			flag = true;
		}
		
		return flag;
	}//
	
	public RmemberBean getMemberByHp(String name, String hp2, String hp3) throws SQLException{
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RmemberBean member = null;
		String sql = "select * from roommember where name=? and hp2=? and hp3=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, hp2);
		pstmt.setString(3, hp3);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			member = getRmemberBean(rs);
		}
		return member;
	}
	
	public RmemberBean getMemberByIdAndName(String id, String name, String hp2, String hp3) throws SQLException{
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RmemberBean member = null;
		
		String sql = "select * from roommember where id=? and name=? and hp2=? and hp3=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, hp2);
		pstmt.setString(4, hp3);
		
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			member = getRmemberBean(rs);
		}
		
		return member;

		
	}
	
	public RmemberBean selectByRmno(int rmno) throws SQLException{
		RmemberBean rmbean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= "select * from roommember where no=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rmno);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			int rmno2 = rs.getInt(1);
			String name = rs.getString(2);
			String id = rs.getString(3);
			String password = rs.getString(4);
			String gender = rs.getString(5);
			String age = rs.getString(6);
			String hp1 = rs.getString(7);
			String hp2 = rs.getString(8);
			String hp3 = rs.getString(9);
			String email = rs.getString(10);
			String country = rs.getString(11);
			String pref = rs.getString(12);
	
			rmbean = new RmemberBean(rmno2, name, id, password, gender, age, hp1, hp2, hp3, email, country, pref);

		}
		pstmt.close();
		
		return rmbean;
		
	}
	
	
	public int updateRmember(String name, String id, String password, String gender, String age, String hp1, String hp2, String hp3, String email, String country, String pref, int rmno) throws SQLException {
		
		PreparedStatement pstmt = null;
		int cnt = -1;
		
		System.out.println("===============");
		System.out.println(rmno + " / "+name+ " / "+ id+ " / "+ password+ " / "+ gender+ " / "+age+ " / "+ hp1+ " / "+ hp2+ " / "+hp3+ " / "+ email+ " / "+country+ " / "+ pref);
		
		String sql = "update roommember set name=?, id=?, password=?, gender=?, "+
					"age=?, hp1=?, hp2=?, hp3=?, email=?, country=?, pref=? where no=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, password);
			pstmt.setString(4, gender);
			pstmt.setString(5, age);
			pstmt.setString(6, hp1);
			pstmt.setString(7, hp2);
			pstmt.setString(8, hp3);
			pstmt.setString(9, email);
			pstmt.setString(10, country);
			pstmt.setString(11, pref);
			pstmt.setInt(12, rmno);
			
			cnt=pstmt.executeUpdate();
			
			System.out.println("cnt: "+cnt);
		
		}catch(SQLException e) {
			
		}finally {
			try {
				pstmt.close();
			}catch(SQLException e) {
				
			}
		}
		
		return cnt;
		
	}
}
