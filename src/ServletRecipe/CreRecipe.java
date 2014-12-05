package ServletRecipe;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import Entity.Recipe;
import Entity.Recipe_Staple;
import Helper.reqHelper;

/**
 * Servlet implementation class CreRecipe
 */
@WebServlet("/CreRecipe.u")
@MultipartConfig
public class CreRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreRecipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dir = reqHelper.pathDir+"recipe\\";
		File folderExisting = new File(dir);  
		if (!folderExisting.exists()){
			folderExisting.mkdir();
		}

		Connection conn=(Connection) getServletContext().getAttribute("conn");
		

		String name = request.getParameter("name");
		String note = request.getParameter("note");
		String kind = request.getParameter("kind");
		String how_to = request.getParameter("how_to");
		String member_noS = request.getParameter("member_no");
		String[] staple = request.getParameterValues("staple");
		String[] volume = request.getParameterValues("volume");

		Integer member_no=null;
		System.out.println(member_noS);
		if (member_noS!=null)
			member_no=Integer.parseInt(member_noS);
		

		Part filePart = request.getPart("picture");
		String filename = getFilename(filePart);
		InputStream filecontent = filePart.getInputStream();
		File f = new File(dir + filename);
		FileOutputStream fos = new FileOutputStream(f);
		int read = 0;
		byte[] bytes = new byte[1024];

		while ((read = filecontent.read(bytes)) != -1) {
			fos.write(bytes, 0, read);
		}
		fos.close(); 
		
		String picture = f.getPath();
		
		Recipe r = new Recipe(conn, name, note, kind, how_to,picture, member_no);
		
		
		
		if (r.createRow()){
//			for (int i=0;i<staple.length;i++){
//				Recipe_Staple rs = new Recipe_Staple(conn, r.getNo(), Integer.parseInt(staple[i]),volume[i]);
//				rs.createRow();
//			}
			if (staple!=null){
				for(String s :staple){
					Recipe_Staple rs= new Recipe_Staple(conn,r.getNo(),Integer.parseInt(s));
					rs.createRow();
				}
			}
			response.sendRedirect("recipe.jsp");
		}else {
			response.sendRedirect("ErrorPage.jsp?message=Cannot Create Recipe&url=recipe.jsp");
		}
	}

	private static String getFilename(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String filename = cd.substring(cd.indexOf('=') + 1).trim()
						.replace("\"", "");
				return filename.substring(filename.lastIndexOf('/') + 1)
						.substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
			}
		}
		return null;
	}
	

}
