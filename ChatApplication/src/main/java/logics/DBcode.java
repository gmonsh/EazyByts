package logics;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;

public class DBcode {
 String url="jdbc:mysql://localhost:3306/ChatApplication";
 String username="root";
 String password = "Adi@1234";
 Connection conn;
 
 public DBcode() throws SQLException,ClassNotFoundException{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 conn=DriverManager.getConnection(url,username,password);
 }
 
 public int addUser(String un,String pass) throws SQLException{
	 String query = "insert into users(username,password) values(?,?)";
	 PreparedStatement pst = conn.prepareStatement(query);
	 pst.setString(1, un);
	 pst.setString(2, pass);
	 int res = pst.executeUpdate();
	 return res;
 }
 public boolean isValid(String un,String pass) throws SQLException{
	 boolean valid=false;
	 String query="select id from users where username=? and password=?";
	 PreparedStatement pst=conn.prepareStatement(query);
	 pst.setString(1, un);
	 pst.setString(2, pass);
	 ResultSet rs = pst.executeQuery();
	 while(rs.next()) {
		 valid=!valid;
	 }
	 return valid;
 }
 public int getUserId(String un,String pass) throws SQLException{
	 String query="select id from users where username=? and password=?";
	 PreparedStatement pst=conn.prepareStatement(query);
	 pst.setString(1, un);
	 pst.setString(2, pass);
	 ResultSet rs = pst.executeQuery();
	 if(rs.next()) {
		 return rs.getInt("id");
	 }
	 else {
		 return -1;
	 }
 }
 public int addMessage(int uID,String uname,String message)throws SQLException
 {
	 String query = "insert into messages(user_id,username,message) values(?,?,?)";
	 PreparedStatement pst = conn.prepareStatement(query);
	 pst.setInt(1, uID);
	 pst.setString(2, uname);
	 pst.setString(3, message);
	 int res = pst.executeUpdate();
	 return res;
 }
 public Vector<Messages> display() throws SQLException
 {
	 Vector<Messages> ms = new Vector<Messages>(); 
	 String query = "SELECT * FROM messages ORDER BY timestamp";
	 PreparedStatement pst=conn.prepareStatement(query);
	 ResultSet rs = pst.executeQuery();
	 while(rs.next()) {
		 int id=rs.getInt(1);
		 String user = rs.getString(3);
		 String msg = rs.getString(4);
		 Timestamp ts = rs.getTimestamp(5);

		 Messages s = new Messages(id,user,msg,ts);
		 ms.add(s);
	 }
	 return ms;
 }
 public int deleteMessage(int msgId) throws SQLException
 {
	 String query="delete from users where id=?";
	 PreparedStatement pst= conn.prepareStatement(query);
     pst.setInt(1,msgId);
     int res=pst.executeUpdate();
     return res;
 }
}
