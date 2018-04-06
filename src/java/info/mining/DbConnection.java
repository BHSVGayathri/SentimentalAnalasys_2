package info.mining;



import java.sql.*;


public class DbConnection {

	Connection con;

	public Connection getConnections() {

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sentimental","root","root");
		

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;

	}
}
