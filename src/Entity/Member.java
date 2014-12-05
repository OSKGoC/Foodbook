package Entity;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.sql.DataSource;

public class Member {
	
	private Connection conn=null;
	//Attribute
	private int no=-1;
	private String id=null;
	private String pass=null;
	private String email=null;
	private String role=null;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public void setUnGenPass(String p) {
		this.pass = genMd5Pass(p);
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	//Cons...
	public Member(Connection conn){
		this.conn=conn;
	}
	
	public Member(Connection conn,int no){
		this.conn=conn;
		this.no=no;
		try {
			String sqlLogin="Select * from member where no=? ;";
			PreparedStatement pLogin=conn.prepareStatement(sqlLogin);
			pLogin.setInt(1, no);

			ResultSet rsLogin=pLogin.executeQuery();
			if (rsLogin.next()){
				setNo(rsLogin.getInt("no"));
				setId(rsLogin.getString("id"));
				setPass(rsLogin.getString("pass"));
				setEmail(rsLogin.getString("email"));
				setRole(rsLogin.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public Member(Connection conn,String id,String p,String email,String role){
		this.conn=conn;
		this.id=id;
		this.pass=genMd5Pass(p);
		this.email=email;
		this.role=role;
	}
	public Member(Connection conn,String id,String p){
		this.conn=conn;
		try {
			pass=genMd5Pass(p);
			String sqlLogin="Select * from member where id=? and pass=?;";
			PreparedStatement pLogin=conn.prepareStatement(sqlLogin);
			pLogin.setString(1, id);
			pLogin.setString(2, pass);
			ResultSet rsLogin=pLogin.executeQuery();
			if (rsLogin.next()){
				setNo(rsLogin.getInt("no"));
				setId(rsLogin.getString("id"));
				setPass(rsLogin.getString("pass"));
				setEmail(rsLogin.getString("email"));
				setRole(rsLogin.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//Base
	public boolean createRow(){
		try {
			String sqlCre="insert into member value(null,?,?,?,?)";
			//System.out.print(conn);
			PreparedStatement pCre=conn.prepareStatement(sqlCre,1);
			pCre.setString(1, id);
			pCre.setString(2, pass);
			pCre.setString(3, email);
			pCre.setString(4, role);
			int row=pCre.executeUpdate();
			ResultSet generatedKeys = pCre.getGeneratedKeys();
			if (generatedKeys.next()) {
	            setNo(generatedKeys.getInt(1));
	            return true;
	        }
	        else {
	            return false;
	         }
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean editRow(){
		try {
			String sqlDel="update member set pass=?,email=?,role=? where no=?";
			PreparedStatement pDel=conn.prepareStatement(sqlDel);
			pDel.setString(1, this.pass);
			pDel.setString(2, this.email);
			pDel.setString(3, this.role);
			pDel.setInt(4, no);
			
			
			System.out.println(pDel.executeUpdate());
			return pDel.executeUpdate()!=0?false:true;
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteRow(){
		try {
			String sqlDel="delete from member where no=?";
			PreparedStatement pDel=conn.prepareStatement(sqlDel);
			pDel.setInt(1, no);
			
			
			System.out.println(pDel.executeUpdate());
			return pDel.executeUpdate()!=0?false:true;
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	//Function Extra
	public String genMd5Pass(String p){
		String md5="";
		try {
			MessageDigest mdEnc = MessageDigest.getInstance("MD5");
			mdEnc.update(p.getBytes(), 0, p.length());
			md5 = new BigInteger(1, mdEnc.digest()).toString(16);	
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return md5;
	}
	
}
