package MyBean.DB;

import java.sql.*;

/**
 * 데이터베이스 연결객체를 가져오는 클래스
 * @author 
 */
public class DbCon {
		//mydb 대신에 자신의 DB 이름으로 변경시켜고, 필요하면 앤코딩방식도 지정합니다.
	final static String DB_URL = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=euckr";	
	final static String DB_USER = "admin";
	final static String DB_PASSWORD= "1234";

	static  {
		/* jdbc 드라이버 로딩은 한 번만 실행되면 된다.
		 * DbCon 최초 호출시 한 번만 실행된다.
		 */
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {

			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * 커넥션을 가져온다.
	 * @return Connection
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	}
}
