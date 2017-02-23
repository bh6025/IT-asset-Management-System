package Controller;
import java.sql.*;

public class DBConnect {
	
	public Connection connect() throws Exception {
		Connection conn = null;

		String url = "jdbc:mysql://localhost:3306/miji?useUnicode=true&characterEncoding=euckr";
		String id = "root";
		String pw = "920603";

		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);
		}catch(SQLException se){
			se.printStackTrace();   
		}catch(Exception e){
			e.printStackTrace();
		}
		
		System.out.println("DB OPENED");
		return conn;
		
	}

	public void close(Connection con, Statement stmt, PreparedStatement pstmt, ResultSet rs){
		try{
			if(rs!=null) rs.close(); 
			if(stmt!=null) stmt.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch(SQLException se){
			se.printStackTrace();   
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("DB CLOSED");
	}
}