package com.shinhan.oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

// 23.03.13 1교시 Oracle DB연결
// 23.03.13 2교시 Oracle DB연결
public class OracleConnectTest2 {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		System.out.println("조회하고자하는 직원입력>>");
		Scanner sc = new Scanner(System.in);
		String inputName = sc.nextLine();
		
		String sql = " select first_name, last_name, salary, hire_date "
					+ " from employees "
					+ " where lower(first_name) =lower('"
					+ inputName
					+ "')";
//		1. driver load
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("1. driver load 성공");
		
//		2. Connection
		//String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String url = "jdbc:mysql://localhost/hr";
		String userId = "hr";
		String pw = "hr";
		Connection conn = DriverManager.getConnection(url, userId, pw);
		System.out.println("2. Connection 성공");
		
//		3. statement를 통해서 SQL전송
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			System.out.println(rs.getString(1));
			System.out.println(rs.getString(2));
			System.out.println(rs.getInt(3));
			System.out.println(rs.getDate(4));
			System.out.println("------------------");
		}
		rs.close();
		st.close();
		conn.close();
	}
}