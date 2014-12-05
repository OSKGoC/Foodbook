package Entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class Staple {
	private Connection conn;
	private int no;
	private String name;
	private String note;
	private String picture;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Staple(Connection conn, String name, String note, String picture) {

		this.conn = conn;
		this.name = name;
		this.note = note;
		this.picture = picture;
	}

	public Staple(Connection conn, int no) {
		this.conn = conn;
		try {
			String sqlLogin = "Select * from staple where no=?;";
			PreparedStatement pLogin = conn.prepareStatement(sqlLogin);
			pLogin.setInt(1, no);
			ResultSet rsLogin = pLogin.executeQuery();
			if (rsLogin.next()) {
				setNo(rsLogin.getInt("no"));
				setName(rsLogin.getString("name"));
				setNote(rsLogin.getString("note"));
				setPicture(rsLogin.getString("picture"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// Base
	public boolean createRow() {
		try {
			String sqlCre = "insert into staple value(null,?,?,?)";
			PreparedStatement pCre = conn.prepareStatement(sqlCre, 1);
			pCre.setString(1, name);
			pCre.setString(2, note);
			pCre.setString(3, picture);
			int row = pCre.executeUpdate();
			ResultSet generatedKeys = pCre.getGeneratedKeys();
			if (generatedKeys.next()) {
				setNo(generatedKeys.getInt(1));
				return true; 
			} else {
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
			String sqlDel="update staple set name=?,note=?,picture=? where no=?";
			PreparedStatement pDel=conn.prepareStatement(sqlDel);
			pDel.setString(1, this.name);
			pDel.setString(2, this.note);
			pDel.setString(3, this.picture);
			pDel.setInt(4, no);
			
			
			System.out.println(pDel.executeUpdate());
			return pDel.executeUpdate()!=0?false:true;
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteRow() {
		try {
			String sqlDel = "delete from staple where no=?";
			PreparedStatement pDel = conn.prepareStatement(sqlDel);
			pDel.setInt(1, no);

			System.out.println(pDel.executeUpdate());
			return pDel.executeUpdate() != 0 ? false : true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
