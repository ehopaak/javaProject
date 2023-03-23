package com.shinhan.oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// 23.03.13 1교시 Oracle DB연결
// 23.03.13 2교시 Oracle DB연결
public class OracleConnectTest {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		String sql = "select * from EMPLOYEES";
//		1. driver load
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("1. driver load 성공");
//		2. Connection
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "hr";
		String pw = "hr";
		Connection conn = DriverManager.getConnection(url, userId, pw);
		System.out.println("2. Connection 성공");
//		3. statement를 통해서 SQL전송
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			System.out.println(rs.getInt(1));
			System.out.println(rs.getString(2));
			System.out.println(rs.getString(3));
			System.out.println(rs.getInt("salary"));
			System.out.println("------------------");
		}
		rs.close();
		st.close();
		conn.close();
	}
}