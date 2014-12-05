package Entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Recipe_Staple {
	private Connection conn;
	private int recipe_no;
	private int staple_no;
//	private String volume;
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getStaple_no() {
		return staple_no;
	}
	public void setStaple_no(int staple_no) {
		this.staple_no = staple_no;
	}
//	public String getVolume() {
//		return volume;
//	}
//	public void setVolume(String volume) {
//		this.volume = volume;
//	}
	
	public Recipe_Staple(Connection conn, int recipe_no) {
		this.conn = conn;
		this.recipe_no=recipe_no;
	}
	
//	public Recipe_Staple(Connection conn, int recipe_no, int staple_no) {
//		this.conn = conn;
//		try {
//			String sqlLogin = "Select * from recipe_staple where recipe_no=? and staple_no=?;";
//			PreparedStatement pLogin = conn.prepareStatement(sqlLogin);
//			pLogin.setInt(1, recipe_no);
//			pLogin.setInt(2, staple_no);
//			ResultSet rsLogin = pLogin.executeQuery();
//			if (rsLogin.next()) {
//				setRecipe_no(rsLogin.getInt("recipe_no"));
//				setStaple_no(rsLogin.getInt("staple_no"));
////				setVolume(rsLogin.getString("volume"));	
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
//	public Recipe_Staple(Connection conn, int recipe_no, int staple_no,
//			String volume) {
//		super();
//		this.conn = conn;
//		this.recipe_no = recipe_no;
//		this.staple_no = staple_no;
//		this.volume = volume;
//	}
	public Recipe_Staple(Connection conn, int recipe_no, int staple_no) {
		super();
		this.conn = conn;
		this.recipe_no = recipe_no;
		this.staple_no = staple_no;

	}
	
	public boolean createRow() {
		try {
			String sqlCre = "insert into recipe_staple value(?,?)";
			PreparedStatement pCre = conn.prepareStatement(sqlCre, 1);
			pCre.setInt(1, recipe_no);
			pCre.setInt(2, staple_no);
//			pCre.setString(3, volume);
			int row = pCre.executeUpdate();
	
			if (row==1) {
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
	
//	public boolean editRow(){
//		try {
//			String sqlDel="update recipe_staple set volume=? where recipe_no=? and staple_no=?";
//			PreparedStatement pDel=conn.prepareStatement(sqlDel);
//			pDel.setString(1, this.volume);
//			pDel.setInt(2, this.recipe_no);
//			pDel.setInt(3, this.staple_no);
//
//			
//			
//			System.out.println(pDel.executeUpdate());
//			return pDel.executeUpdate()!=0?false:true;
//		
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return false;
//	}
	
	public boolean deleteRow() {
		try {
			String sqlDel = "delete from recipe_staple where recipe_no=? and staple_no=?";
			PreparedStatement pDel = conn.prepareStatement(sqlDel);
			pDel.setInt(1, recipe_no);
			pDel.setInt(2, staple_no);

			System.out.println(pDel.executeUpdate());
			return pDel.executeUpdate() != 0 ? false : true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteAllRecipeRow() {
		try {
			String sqlDel = "delete from recipe_staple where recipe_no=?";
			PreparedStatement pDel = conn.prepareStatement(sqlDel);
			pDel.setInt(1, recipe_no);

			System.out.println(pDel.executeUpdate());
			return pDel.executeUpdate() != 0 ? false : true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
}
