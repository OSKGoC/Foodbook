package Helper;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowPic
 */
@WebServlet("/ShowPic")
public class ShowPic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowPic() {
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
		String path = request.getParameter("path");

		try {

			response.setContentType("image/png");
			ServletOutputStream out;
			out = response.getOutputStream();
			FileInputStream flinp = new FileInputStream(path);
			BufferedInputStream buffinp = new BufferedInputStream(flinp);
			BufferedOutputStream buffoup = new BufferedOutputStream(out);
			int ch = 0;
			while ((ch = buffinp.read()) != -1) {
				buffoup.write(ch);
			}
			buffinp.close();
			flinp.close();
			buffoup.close();
			out.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			path = reqHelper.defPic;
			response.setContentType("image/png");
			ServletOutputStream out;
			out = response.getOutputStream();
			FileInputStream flinp = new FileInputStream(path);
			BufferedInputStream buffinp = new BufferedInputStream(flinp);
			BufferedOutputStream buffoup = new BufferedOutputStream(out);
			int ch = 0;
			while ((ch = buffinp.read()) != -1) {
				buffoup.write(ch);
			}
			buffinp.close();
			flinp.close();
			buffoup.close();
			out.close();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
