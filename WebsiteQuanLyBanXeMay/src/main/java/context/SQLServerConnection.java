package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLServerConnection {
	public static Connection initializeDatabase() 
			throws SQLException, ClassNotFoundException
	{
		String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://localhost:1433";

		String dbName="WebsiteQuanLyBanXeMay";
		String dbUsername = "sa";
		String dbPassword ="K_Haruto111103";
		String connectionURL = dbURL + ";databaseName=" + dbName;
		Connection conn = null;
		try 
		{ 
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(connectionURL, dbUsername, dbPassword);
			System.out.println("connect successfully!");
		} 
		catch(Exception ex) 
		{
			System.out.println("connect failure!");
			ex.printStackTrace();
		}
		return conn;
	}
}
