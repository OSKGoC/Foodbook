package ServletMember;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Member;
import Helper.reqHelper;

/**
 * Servlet implementation class register
 */
@WebServlet("/register.u")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
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
		PrintWriter out = response.getWriter();
		Connection conn=(Connection) getServletContext().getAttribute("conn");
		//System.out.println(conn);
		String id = request.getParameter("id");
		String p = request.getParameter("pass");
		String email = request.getParameter("email");
		String role = request.getParameter("role");
		Member m = new Member(conn,id,p,email,role);
		if (m.createRow()){
			//System.out.println(m.getNo()+ "Register Success");
			System.out.println("Register Success");
			response.sendRedirect("register.jsp?reg_ok=1");
		}
		else {
			System.out.println("Register Failed");
			response.sendRedirect("ErrorPage.jsp?message=UserName Already exist&url=register.jsp");
		}
		
	}

}


