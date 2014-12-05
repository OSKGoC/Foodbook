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

import Entity.Staple;
import Helper.reqHelper;

/**
 * Servlet implementation class CreStaple
 */
@WebServlet("/CreStaple.u")
@MultipartConfig
public class CreStaple extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreStaple() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String dir = reqHelper.pathDir+"staple\\";
		File folderExisting = new File(dir);  
		if (!folderExisting.exists()){
			folderExisting.mkdir();
		}

		Connection conn=(Connection) getServletContext().getAttribute("conn");
		

		String name = request.getParameter("name");
		String note = request.getParameter("note");

		Part filePart = request.getPart("picture");
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
		
		Staple s = new Staple(conn, name, note, f.getPath());
		
		if (s.createRow()){
			response.sendRedirect("staple.jsp");
		}else {
			response.sendRedirect("ErrorPage.jsp?message=Cannot Create Staple&url=staple.jsp");
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
