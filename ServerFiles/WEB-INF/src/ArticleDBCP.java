package MyBean.DB;

import MyBean.DB.*;
import java.sql.*;
//��Ŀ�ؼ� Ǯ�� ���õ� Ŭ���� ��Ű�� import ��Ŵ
import javax.sql.DataSource;
import javax.naming.*;

public class ArticleDBCP {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	//���ν��Ͻ� ������ ���ÿ� Ŀ���� Ǯ�κ��� ������ ������ ����.
	public ArticleDBCP() throws NamingException, SQLException {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/web02cp");
		con = ds.getConnection();

	}
	
	public void updateRecord(Article art) throws SQLException {
		String query = "UPDATE member SET name=?, pwd=?, email=? WHERE id=?";

		pstmt = con.prepareStatement(query);
		
		pstmt.setString(1, art.getName());
		pstmt.setString(2, art.getPwd());
		pstmt.setString(3, art.getEmail());
		pstmt.setString(4, art.getId());

		pstmt.executeUpdate();
	}

	//�Ϸ��ڵ带 DB�� �����ϱ� ���� �޼ҵ�
	public void insertRecord(Article art) throws SQLException {
		String query = "INSERT INTO member(id, name, pwd, email) VALUE (?,?,?,?); ";
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, art.getId());
		pstmt.setString(2, art.getName());
		pstmt.setString(3, art.getPwd());
		pstmt.setString(4, art.getEmail());
		
		pstmt.executeUpdate();
	}


	public Article getRecord(String id) throws SQLException {
		String query = "SELECT id, name, pwd, email FROM member WHERE id=?";
		pstmt = con.prepareStatement(query);

		pstmt.setString(1, id);

		rs = pstmt.executeQuery();

		rs.next();

		Article art = new Article();

		art.setId(rs.getString("id"));
		art.setName(rs.getString("name"));
		art.setPwd(rs.getString("pwd"));
		art.setEmail(rs.getString("email"));
	
		return art;
	}	// end-of-getRecord()


	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}	//end-of-close()
}	// end-of-Class