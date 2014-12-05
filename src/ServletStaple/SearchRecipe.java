package ServletStaple;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchRecipe
 */
@WebServlet("/SearchRecipe.u")
public class SearchRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchRecipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = (Connection) getServletContext().getAttribute("conn");
		String[] staple = request.getParameterValues("staple");
		ArrayList<ArrayList<String>> allRecipes=new ArrayList<ArrayList<String>>();
		ArrayList<String> tungMod=new ArrayList<String>();
		try {
			Statement stmt = conn.createStatement();
			for (String s :staple) {
				ArrayList<String> recipes=new ArrayList<String>();
				String sql="select * from recipe_staple where staple_no='"+s+"';";
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()){
					String r_no =rs.getString("recipe_no");
					recipes.add(r_no);
					if (!tungMod.contains(r_no)){
						tungMod.add(r_no);
						System.out.println("tungMod = "+r_no);
					}
				
				}
				allRecipes.add(recipes);
			}
			ArrayList<String> meeKob=new ArrayList<String>();
			ArrayList<String> kadPai=new ArrayList<String>();
			for (String r : tungMod){
				if (searchForAll(r,allRecipes)){
						meeKob.add(r);
						System.out.println("meekob = "+r);
				}else{
						kadPai.add(r);
						System.out.println("kadpai = "+r);
				}
			}
			request.setAttribute("meeKob", meeKob);
			request.setAttribute("kadPai", kadPai);
			request.getRequestDispatcher("resultMenu.jsp").forward(request, response);;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean searchForAll(String x ,ArrayList<ArrayList<String>> xx){
		for (ArrayList<String> rec : xx){
			if (!rec.contains(x)){
				return false;
			}
		}
		return true;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
