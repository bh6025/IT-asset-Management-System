package Dao;

import Dto.LogDto;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Controller.DBConnect;

public class LogDao {
	private DBConnect dbConnect = null;
	private Connection con = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void insertLogDao(String code){
		
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
			
			temp = new LogDto(code, to, rs.getString(3), rs.getString(4));
			logs.add(temp);
		}

		dbConnect.close(con, stmt, pstmt, rs);
		return logs;
	}
	public void deleteLogDao(String code) {
		
	}
}
