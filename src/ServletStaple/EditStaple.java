package ServletStaple;

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

import Entity.Member;
import Entity.Staple;
import Helper.reqHelper;

/**
 * Servlet implementation class EditStaple
 */
@WebServlet("/EditStaple.u")
@MultipartConfig
public class EditStaple extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStaple() {
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
			Staple s = new Staple(conn, no);
			if (s.deleteRow()){
				response.sendRedirect("staple.jsp");
			}else {
				response.sendRedirect("ErrorPage.jsp?message=Cannot Delete Staple&url=staple.jsp");
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String dir = reqHelper.pathDir+"staple\\";
		File folderExisting = new File(dir);  
		if (!folderExisting.exists()){
			folderExisting.mkdir();
		}
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String note = request.getParameter("note");
		
		
		

		Connection conn = (Connection) getServletContext().getAttribute("conn");
		Staple s = new Staple(conn, no);
		if (!name.equals(""))
			s.setName(name);
		if (!note.equals(""))
			s.setNote(note);
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
			s.setPicture(f.getPath());
		}catch (Exception e ){
			
		}
			

		if (s.editRow()){
			response.sendRedirect("staple.jsp");
		}else {
			response.sendRedirect("ErrorPage.jsp?message=Cannot Edit Staple&url=staple.jsp");
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
