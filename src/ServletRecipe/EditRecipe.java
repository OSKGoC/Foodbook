package ServletRecipe;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Entity.Recipe;
import Entity.Recipe_Staple;
import Entity.Staple;
import Helper.reqHelper;

/**
 * Servlet implementation class EditRecipe
 */
@WebServlet("/EditRecipe.u")
@MultipartConfig
public class EditRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditRecipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if (request.getParameter("delete").equals("yes")) {
			int no = Integer.parseInt(request.getParameter("no"));
			Connection conn = (Connection) getServletContext().getAttribute("conn");
			Recipe r = new Recipe(conn, no);
			if (r.deleteRow()){
				response.sendRedirect("recipe.jsp");
			}else {
				response.sendRedirect("ErrorPage.jsp?message=Cannot Delete Recipe&url=recipe.jsp");
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dir = reqHelper.pathDir+"recipe\\";
		File folderExisting = new File(dir);  
		if (!folderExisting.exists()){
			folderExisting.mkdir();
		}
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String note = request.getParameter("note");
		String kind = request.getParameter("kind");
		String how_to = request.getParameter("how_to");
		String[] staple = request.getParameterValues("staple");
		String[] volume = request.getParameterValues("volume");
		
		
		
		

		Connection conn = (Connection) getServletContext().getAttribute("conn");
		Recipe r = new Recipe(conn, no);
		if (!name.equals(""))
			r.setName(name);
		if (!note.equals(""))
			r.setNote(note);
		if (!kind.equals(""))
			r.setKind(kind);
		if (!how_to.equals(""))
			r.setHow_to(how_to);
	
		
		try{
			Part filePart = request.getPart("picture");
			System.out.println(filePart);
			String filename =getFilename(filePart);
			InputStream filecontent = filePart.getInputStream();
			File f = new File(dir + filename);
			FileOutputStream fos = new FileOutputStream(f);
			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = filecontent.read(bytes)) != -1) {
				fos.write(bytes, 0, read);
			}
			fos.close(); 
			r.setPicture(f.getPath());
		}catch (Exception e ){
			
		}
			
		
		
		if (r.editRow()){
			Recipe_Staple rAllDel = new Recipe_Staple(conn, r.getNo());
			rAllDel.deleteAllRecipeRow();
//			for (int i=0;i<staple.length;i++){
//				
//				Recipe_Staple rs = new Recipe_Staple(conn, r.getNo(), Integer.parseInt(staple[i]),volume[i]);
//				rs.createRow();
//			}
			if (staple!=null){
			
				for(String s : staple){
					Recipe_Staple rs = new Recipe_Staple(conn, r.getNo(),Integer.parseInt(s));
					rs.createRow();
			}
			}
			response.sendRedirect("recipe.jsp");
		}else {
			response.sendRedirect("ErrorPage.jsp?message=Cannot Edit Recipe&url=recipe.jsp");
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
