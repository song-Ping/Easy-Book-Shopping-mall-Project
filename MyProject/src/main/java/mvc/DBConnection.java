package mvc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

		public static Connection getConnection() throws SQLException, ClassNotFoundException {
			
			Connection conn = null;
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:study";
			String user = "system";
			String password = "12345";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
			return conn;
		}
}
