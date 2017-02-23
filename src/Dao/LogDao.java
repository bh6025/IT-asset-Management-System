package Dao;

import Dto.LogDto;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.websocket.Session;

import Controller.DBConnect;

public class LogDao {
	private DBConnect dbConnect = null;
	private Connection con = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void insertLogDao(String code, String modiState, String id, String modiLocation) throws Exception{
		dbConnect = new DBConnect();
		con = dbConnect.connect();
      	
		Date today = new Date();

		SimpleDateFormat formatter2 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		String today2 = formatter2.format ( today );

		// 로그 테이블에 저장
		String sql = "insert into log values ('"
				+ code + "','"
				+ today2 + "','"
				+ modiState + "','"
				+ id + "','"
				+modiLocation + "');";
		
		stmt = con.createStatement();		
		stmt.executeUpdate(sql);
		
		// asset 테이블에 asset 최신상태 갱신
		sql = "update asset set regiState = '"+modiState+"', location = '" + modiLocation +"' where code ='" + code + "';";
		stmt.executeUpdate(sql);
		
		dbConnect.close(con, stmt, pstmt, rs);
	}
	
	public ArrayList<LogDto> assetLogDao(String code) throws Exception{
		dbConnect = new DBConnect();
		con = dbConnect.connect();

		ArrayList<LogDto> logs = new ArrayList<LogDto>();
		LogDto temp;

		String sql = "select * from log where code = '"+ code + "';";

		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date to = transFormat.parse(rs.getString(2));
			
			temp = new LogDto(code, to, rs.getString(3), rs.getString(4), rs.getString(5));
			logs.add(temp);
		}

		dbConnect.close(con, stmt, pstmt, rs);
		return logs;
	}
	public void deleteLogDao(String code) throws Exception {
		dbConnect = new DBConnect();
		con = dbConnect.connect();

		String sql = "delete from log where code ='" + code + "';";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		dbConnect.close(con, stmt, pstmt, rs);
	}
}
