package Dao;

import Dto.AssetDto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Controller.DBConnect;

public class AssetDao {
	private DBConnect dbConnect = null;
	private Connection con = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 모든 자산 받아오기
	public ArrayList<AssetDto> showAssetDao() throws Exception {
		dbConnect = new DBConnect();
		con = dbConnect.connect();

		ArrayList<AssetDto> assets = new ArrayList<AssetDto>();
		AssetDto temp;

		String sql = "select * from asset;";

		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);

		//db에서 자산을 arraylist에 저장하여 반환
		while (rs.next()) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date to = transFormat.parse(rs.getString(3));
			
			temp = new AssetDto(rs.getString(1), rs.getString(2), to, rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getString(8));
			assets.add(temp);
		}

		dbConnect.close(con, stmt, pstmt, rs);
		return assets;
	}
	
	// 등록하려는 자산 등록
	public void registerAssetDao(String category, String assetName, String productName, String regiState, String location, String userID) throws Exception{
		dbConnect = new DBConnect();
		con = dbConnect.connect();
		
		Date today = new Date();
		String sequence = getSequence();
		
		SimpleDateFormat formatter1 = new SimpleDateFormat ( "yyyyMMdd");
		String today1 = formatter1.format ( today );
		
		SimpleDateFormat formatter2 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		String today2 = formatter2.format ( today );
		
		// 자산 테이블에 등록
		String sql = "insert into asset values ('"
				+category+ today1 + sequence + "','"
				+category + "','"
				+ today2 + "','"
				+assetName + "','"
				+productName + "','"
				+userID + "','"
				+regiState + "','"
				+location + "');";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		// 자산 등록시 로그 테이블에도 저장
		sql = "insert into log values ('"
				+category+ today1 + sequence + "','"
				+ today2 + "','"
				+regiState + "','"
				+userID + "','"
				+location + "');";
		
		stmt.executeUpdate(sql);
		
		dbConnect.close(con, stmt, pstmt, rs);
	}
	
	// 같은 날짜에 등록된 자산이 몇 개 있는지 알아봄. sequence를 구하기 위하여
	public String getSequence() throws Exception{
		dbConnect = new DBConnect();
		con = dbConnect.connect();
		int count;
		
		Date today = new Date();
		
		SimpleDateFormat formatter1 = new SimpleDateFormat ( "yyyy-MM-dd");
		String today1 = formatter1.format ( today );
		
		String sql = "SELECT COUNT(*) FROM asset WHERE regiDatetime BETWEEN '"+today1+" 00:00:00' AND '"+today1+" 23:59:59';";

		System.out.println(sql);
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		rs.next();
		count = rs.getInt("COUNT(*)");
		
		if(count < 10){
			return "00000" + Integer.toString(count);
		}else if(count < 100){
			return "0000" + Integer.toString(count);
		}else if(count < 1000){
			return "000" + Integer.toString(count);
		}else if(count < 10000){
			return "00" + Integer.toString(count);
		}else if(count < 100000){
			return "0" + Integer.toString(count);
		}else{
			return Integer.toString(count);
		}
	}

	public void deleteAssetDao(String code) throws Exception {
		dbConnect = new DBConnect();
		con = dbConnect.connect();

		String sql = "delete from asset where code ='" + code + "';";
		
		stmt = con.createStatement();
		stmt.executeUpdate(sql);
		
		dbConnect.close(con, stmt, pstmt, rs);
	}
}
