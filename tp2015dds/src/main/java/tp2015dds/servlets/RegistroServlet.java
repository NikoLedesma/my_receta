package tp2015dds.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tp2015dds.beans.Usuario;


public class RegistroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {				
		RequestDispatcher view = request.getRequestDispatcher("gola.jsp");
		view.forward(request, response);	
	}

/*
 * Importante, se debe validar si no existe el id del usuario
 */
	private Usuario crearUsuario(HttpServletRequest request){
		
		String[] condiciones=request.getParameterValues("condicion");		
		if(condiciones==null)
			System.out.println("no hay condiciones");
		else{
			int i;
			for(i=0;i<condiciones.length;i++){
				System.out.println("condicion:"+condiciones[i]);
			}			
			System.out.println("condicion:"+condiciones.length);
		
		}
		Usuario usuario= new Usuario();
		usuario.setUsuario(request.getParameter("usuario"));
		usuario.setPassword(request.getParameter("password"));
		usuario.setNombre(request.getParameter("nombre"));
		Float altura=Float.parseFloat(request.getParameter("altura"));
		usuario.setAltura(altura);
		Integer edad= Integer.parseInt(request.getParameter("edad"));
		usuario.setEdad(edad);
		String auxSexo=request.getParameter("sex");
		char sexo=' ';
		sexo=(auxSexo.equals("masculino"))?'M':'F';
		usuario.setSexo(sexo);
		return usuario;
	}

	
}




















