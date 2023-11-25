
package context;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.jsp.tagext.TryCatchFinally;


public class DBContext {
	public static Connection getConnection()
			throws ClassNotFoundException, SQLException {
			return SQLServerConnection.initializeDatabase();
		}
    
    
}
 