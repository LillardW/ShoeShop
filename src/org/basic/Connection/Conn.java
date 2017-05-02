package org.basic.Connection;

import java.sql.*;

public class Conn {
	public static Connection getConnection() {
		Connection con = null;
		String drive = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/shop?useUnicode=true&amp;characterEncoding=UTF-8";
		String username = "root";
		String password = "123456";

		try {
			Class.forName(drive);
			con = (Connection) DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static void release(Connection con) {
		if (con != null)
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public static void release(PreparedStatement pstmt) {

		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public static void release(ResultSet rs) {

		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}
