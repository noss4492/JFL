package kr.co.jhta.bookDBCollector;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MakeConnection {
	private static MakeConnection mc ;
	private final static String DRIVER = "oracle.jdbc.driver.OracleDriver"; 
	private final static String URL =  "jdbc:oracle:thin:@orcl.ckyvzseloumz.ap-northeast-2.rds.amazonaws.com:1521:orcl";
	private final static String USER = "admin";
	private final static String PASSWORD= "tigertiger";
	//orcl.ckyvzseloumz.ap-northeast-2.rds.amazonaws.com
	Connection conn = null;
	
	private MakeConnection() {
	}
	
	public static MakeConnection getInstance() {
		if(mc==null) {
			mc = new MakeConnection();
		}
		return mc ;
	}
	
	public Connection getConnection() {
		if(conn == null) {
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
				
			} catch (ClassNotFoundException e) {
				System.out.println("driver class not found ");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("can not make a DB connection");
				e.printStackTrace();
			}
		}
		return conn;
	}
	

	
}
