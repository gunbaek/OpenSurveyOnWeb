package MyBean.DB;

import java.sql.*;

/**
 * �����ͺ��̽� ���ᰴü�� �������� Ŭ����
 * @author 
 */
public class DbCon {
		//mydb ��ſ� �ڽ��� DB �̸����� ������Ѱ�, �ʿ��ϸ� ���ڵ���ĵ� �����մϴ�.
	final static String DB_URL = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=euckr";	
	final static String DB_USER = "admin";
	final static String DB_PASSWORD= "1234";

	static  {
		/* jdbc ����̹� �ε��� �� ���� ����Ǹ� �ȴ�.
		 * DbCon ���� ȣ��� �� ���� ����ȴ�.
		 */
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {

			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * Ŀ�ؼ��� �����´�.
	 * @return Connection
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	}
}
