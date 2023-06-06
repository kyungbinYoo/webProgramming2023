package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.guest;

public class guestDAO {
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
	
	// DB 연결을 가져오는 메서드, DBCP를 사용하는 것이 좋음
	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"jwbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public List<guest> getAll() throws Exception {
		Connection conn = open();
		List<guest> guestList = new ArrayList<>();
		
		String sql = "select aid,name,email, PARSEDATETIME(date,'yyyy-MM-dd HH:mm:ss.SSSSSS') as cdate,content from guest";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try(conn; pstmt; rs) {
			while(rs.next()) {
				guest g = new guest();
				g.setAid(rs.getInt("aid"));
				g.setName(rs.getString("name"));
				g.setEmail(rs.getString("email"));
				g.setDate(rs.getString("cdate")); 
				g.setContent(rs.getString("content"));
				
				guestList.add(g);
			}
			return guestList;			
		}
	}
	
	public guest getGuestById(int aid) throws SQLException {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    guest g = null;

	    try {
	        conn = open();
	        String sql = "SELECT * FROM guest WHERE aid = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, aid);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            g = new guest();
	            g.setAid(aid);
	            g.setName(rs.getString("name"));
	            g.setEmail(rs.getString("email"));
	            g.setDate(rs.getString("date"));
	            g.setContent(rs.getString("content"));
	            g.setPassword(rs.getString("password"));
	            g.setMessage(rs.getString("message"));
	        }
	    } finally {
	        // 리소스 해제
	        if (rs != null) {
	            rs.close();
	        }
	        if (pstmt != null) {
	            pstmt.close();
	        }
	        if (conn != null) {
	            conn.close();
	        }
	    }

	    return g;
	}

	
	public void addguest(guest g) throws Exception {
		Connection conn = open();
		
		String sql = "insert into guest(name, email, date, content, password, message ) values(?, ?, CURRENT_TIMESTAMP(), ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setString(1, g.getName());
			pstmt.setString(2, g.getEmail());
			pstmt.setString(3, g.getContent());
			pstmt.setString(4, g.getPassword());
			pstmt.setString(5, g.getMessage());
			pstmt.executeUpdate();
		}
	}
	
	public void updateguest(guest g) throws Exception {
	    Connection conn = open();
	    
	    String sql = "update guest set name = ?, email = ?,date= CURRENT_TIMESTAMP(), content = ?,message = ?, password = ? where aid = ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    
	    try (conn; pstmt) {
	        pstmt.setString(1, g.getName());
	        pstmt.setString(2, g.getEmail());
	        pstmt.setString(3, g.getContent());	        
	        pstmt.setString(4, g.getMessage());
	        pstmt.setString(5, g.getPassword());
	        pstmt.setInt(6, g.getAid()); 
	        
	        pstmt.executeUpdate();
	    }
	}

	
}
