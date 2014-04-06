package MyBean.DB;

import java.sql.*;
import MyBean.DB.*;

public class ArticleDB{
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public ArticleDB() throws SQLException {
		con = DbCon.getConnection();
	}
	public Article getRecord(String id){
		String query = "SELECT id, name, pwd, email FROM member WHERE id=?";
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, id);

		rs = pstmt.executeQuery();
		rs.next();

		rs.getString("id");
		Article art = new Article();

		art.setId(id);
		art.setName(rs.getString("name"));
		art.setPwd(rs.getString("pwd"));
		art.setEmail(rs.getString("Email"));

		return art;
		//end-of-getRecord
	}
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}	
	public void updateRecord(Article art) throws SQLException {
		String query = "UPDATE member SET name=?, pwd=?, email=?, WHERE id=?";
		
		pstmt = con.prepareStatement(query);
		pstmt.setString(1,art.getName());
		pstmt.setString(2,art.getPwd());
		pstmt.setString(3,art.getEmail());
		pstmt.setString(4,art.getId());
		
		pstmt.executeUpdate();


	}
}