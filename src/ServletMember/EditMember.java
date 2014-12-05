package ServletMember;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Member;

/**
 * Servlet implementation class EditMember
 */
@WebServlet("/EditMember.u")
public class EditMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditMember() {
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
		if (request.getParameter("delete").equals("yes")) {
			int no = Integer.parseInt(request.getParameter("no"));
			Connection conn = (Connection) getServletContext().getAttribute("conn");
			Member m = new Member(conn, no);
			if (m.deleteRow()){
				response.sendRedirect("member.jsp");
			}
			else {
				response.sendRedirect("ErrorPage.jsp?message=cannot Delete&url=user.jsp");
			}
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("no"));
		String id = request.getParameter("id");
		String p = request.getParameter("p");
		String email = request.getParameter("email");
		String role = request.getParameter("role");

		Connection conn = (Connection) getServletContext().getAttribute("conn");
		Member m = new Member(conn, no);
		if (!p.equals(""))
			m.setPass(p);
		if (!email.equals(""))
			m.setEmail(email);
		if (!role.equals(""))
			m.setRole(role);

		if (m.editRow()){
			response.sendRedirect("member.jsp");
		}else {
			response.sendRedirect("ErrorPage.jsp?message=Can't Edit&url=user.jsp");
		}

	}

}
