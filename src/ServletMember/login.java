package ServletMember;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.websocket.Session;

import Entity.Member;
import Helper.reqHelper;

/**
 * Servlet implementation class login
 */
@WebServlet("/login.u")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		if (request.getParameter("logout").equals("yes"))
		{
			ss.setAttribute("id",null);
			ss.setAttribute("role",null);
			response.sendRedirect("index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession ss = request.getSession();
		
		
		
		PrintWriter out = response.getWriter();
		Connection conn=(Connection) getServletContext().getAttribute("conn");
		Member m = new Member(conn,request.getParameter("id"),request.getParameter("pass"));
		
		System.out.println(request.getParameter("id")+" : "+request.getParameter("pass"));
		
		if (m.getNo()!=-1){
			System.out.println(m.getId()+" Login Successful "+m.getRole());
			ss.setAttribute("member_no",m.getNo());
			ss.setAttribute("id",m.getId());
			ss.setAttribute("role", m.getRole());
			response.sendRedirect("index.jsp");
			
		}
		else{
			System.out.println("Login Failed");
			response.sendRedirect("ErrorPage.jsp?message=UserName or Password Invalid&url=login.jsp");
		}
	}

}
