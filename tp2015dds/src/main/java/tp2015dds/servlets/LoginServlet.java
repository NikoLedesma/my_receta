package tp2015dds.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import tp2015dds.beans.Condicion;
import tp2015dds.beans.Grupo;
import tp2015dds.beans.Usuario;
import tp2015dds.daos.GeneralDao;
import tp2015dds.daos.UsuarioDao;
import tp2015dds.util.HibernateUtil;

//@WebServlet("/loginWeb.jr")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("password");
		System.out.println("Usuario:" + usuario);
		System.out.println("Password:" + password);
		UsuarioDao usuarioDao = new UsuarioDao();
		Usuario usuarioEncontrado = null;
		HttpSession sessionServlet = request.getSession(true);
		
		///////////////

		///////////////
		
		try {
			usuarioEncontrado = usuarioDao.buscar(usuario);
			if(usuarioEncontrado!=null)
			System.out.println(usuarioEncontrado.getGrupos().size());
		} catch (Exception e) {
			System.out.println("Exception occured. " + e.getMessage());
			e.printStackTrace();
		} finally {
			System.out.println("ya se pregunto por el usuario en la bd");
		}

		if (!(usuarioEncontrado == null)) {

			if (password.equals(usuarioEncontrado.getPassword())) {
				sessionServlet.setAttribute("usuarioLogeado", usuarioEncontrado);
				RequestDispatcher view = request.getRequestDispatcher("welcome.jsp");
				view.forward(request, response);
			} else {
				System.out.println("El password es incorrecto");
				response.sendRedirect("login.jsp");
			}

		} else {

			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('User or password incorrect');");
			out.println("location='login.jsp';");
			out.println("</script>");
			out.close();
			//response.sendRedirect("login.jsp");// esto no va poeque tura una exception
			
		}

	}

}
