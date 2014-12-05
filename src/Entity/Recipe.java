package Entity;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Recipe {
	private Connection conn;
	private int no;
	private String name;
	private String note;
	private String kind;
	private String how_to;
	private Date date_add;
	private String picture;
	private int member_no;
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
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getHow_to() {
		return how_to;
	}
	public void setHow_to(String how_to) {
		this.how_to = how_to;
	}
	public Date getDate_add() {
		return date_add;
	}
	public void setDate_add(Date date_add) {
		this.date_add = date_add;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public Recipe(Connection conn, String name, String note,
			String kind, String how_to, String picture,
			int member_no) {
		this.conn = conn;

		this.name = name;
		this.note = note;
		this.kind = kind;
		this.how_to = how_to;
		this.picture = picture;
		this.member_no = member_no;
	}
	
	public Recipe(Connection conn, int no) {
		this.conn = conn;
		try {
			String sqlLogin = "Select * from recipe where no=?;";
			PreparedStatement pLogin = conn.prepareStatement(sqlLogin);
			pLogin.setInt(1, no);
			ResultSet rsLogin = pLogin.executeQuery();
			if (rsLogin.next()) {
				setNo(rsLogin.getInt("no"));
				setName(rsLogin.getString("name"));
				setNote(rsLogin.getString("note"));
				setKind(rsLogin.getString("kind"));
				setHow_to(rsLogin.getString("how_to"));
				setDate_add(rsLogin.getDate("date_add"));
				setPicture(rsLogin.getString("picture"));
				setMember_no(rsLogin.getInt("member_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean createRow() {
		try {
			String sqlCre = "insert into recipe value(null,?,?,?,?,now(),?,?)";
			PreparedStatement pCre = conn.prepareStatement(sqlCre, 1);
			pCre.setString(1, name);
			pCre.setString(2, note);
			pCre.setString(3, kind);
			pCre.setString(4, how_to);
			pCre.setString(5, picture);
			pCre.setInt(6, member_no);
			
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
			String sqlDel="update recipe set name=?,note=?,kind=?,how_to=?,picture=? where no=?";
			PreparedStatement pDel=conn.prepareStatement(sqlDel);
			pDel.setString(1, name);
			pDel.setString(2, note);
			pDel.setString(3, kind);
			pDel.setString(4, how_to);
			pDel.setString(5, picture);
			pDel.setInt(6, no);
			
			
			System.out.println(pDel.executeUpdate());
			return pDel.executeUpdate()==0?false:true;
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteRow() {
		try {
			String sqlDel = "delete from recipe where no=?";
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
