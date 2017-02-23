package Dao;

import Dto.UserDto;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;

import Controller.DBConnect;

public class UserDao {
	private DBConnect dbConnect = null;
	private Connection con = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int loginDao(String id, String pw) throws Exception{
		dbConnect = new DBConnect();
		con = dbConnect.connect();
		int flag = 0;
		
		String sql = "select * from user;";
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		// 로그인 시도한 user의 등급이 master, administer, member 중 무엇인지 파악
		while(rs.next()) {
			if(rs.getString(1).equals(id) && rs.getString(2).equals(pw)) {
				if(Integer.parseInt(rs.getString(3)) == 1){
					flag = 1;
					break;
				}else if(Integer.parseInt(rs.getString(3)) == 2){
					flag = 2;
					break;
				}else{
					flag = 3;
					break;
				}
			}	
		}
		System.out.println("login");
		dbConnect.close(con, stmt, pstmt, rs);
		
		return flag;
	}
	
	public ArrayList<UserDto> showAllUserDao() throws Exception{
		dbConnect = new DBConnect();
		con = dbConnect.connect();
		
		ArrayList<UserDto> users = new ArrayList<UserDto>();
		UserDto temp;
		
		String sql = "select * from user;";
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			temp = new UserDto(rs.getString(1), rs.getString(2), Integer.parseInt(rs.getString(3)), rs.getString(4));
			users.add(temp);
		}
		
		dbConnect.close(con, stmt, pstmt, rs);
		return users;
	}
	
	public void gradeUpDao(String id) throws Exception{
		dbConnect = new DBConnect();
		con = dbConnect.connect();
		
		String sql = "select grade from user where id ='" + id + "';";
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		rs.next();
		
		if(rs.getInt("grade") == 3){
			sql = "update user set grade = "+2+" where id ='" + id + "';";
			stmt.executeUpdate(sql);
		}else if(rs.getInt("grade") == 2){
			sql = "update user set grade = "+1+" where id ='" + id + "';";
			stmt.executeUpdate(sql);
		}
		
		dbConnect.close(con, stmt, pstmt, rs);
	}
	
	public void gradeDownDao(String id) throws Exception{
		dbConnect = new DBConnect();
		con = dbConnect.connect();
		
		String sql = "select grade from user where id ='" + id + "';";
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		rs.next();
		
		if(rs.getInt("grade") == 1){
			sql = "update user set grade = "+2+" where id ='" + id + "';";
			stmt.executeUpdate(sql);
		}else if(rs.getInt("grade") == 2){
			sql = "update user set grade = "+3+" where id ='" + id + "';";
			stmt.executeUpdate(sql);
		}
		
		dbConnect.close(con, stmt, pstmt, rs);
	}
	public void deleteUserDao(String id) throws Exception{
		dbConnect = new DBConnect();
		con = dbConnect.connect();

		String sql = "delete from user where id ='" + id + "';";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		dbConnect.close(con, stmt, pstmt, rs);
		
	}
}
