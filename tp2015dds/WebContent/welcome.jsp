<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="tp2015dds.beans.Usuario"%>
<%@page import="tp2015dds.beans.Grupo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1 style="font-weight: bold; font-size: 20px;">Bienvenidos al
		sistema de jsps y servlets :</h1>
	<fieldset>
		<p style="font-weight: bold; font-size: 20px;">
		<% Usuario usuario=((Usuario) session.getAttribute("usuarioLogeado"));%>
			Usuario:
			<%=usuario.getUsuario()%>
			<br /> Nombre:
			<%=usuario.getNombre()%>
			<br /> Password(pasar a sha):
			<%=usuario.getPassword()%>
			<br /> Edad:
			<%=usuario.getEdad()%>
			<br /> Altura:
			<%=usuario.getAltura()%>
			<br /> Sexo:
			<%=usuario.getSexo()%>
			<br />
		</p>
	</fieldset>
	<% Set <Grupo> gruposJSP = (usuario.getGrupos()); %>
	
	<form name="addForm" action="eshop" method="POST">
		<input type="hidden" name="do_this" value="add">
		Grupos: 
		<select name=grupo>
		<% 
 		for (Grupo grupo : gruposJSP) {
			out.println("<option>"+grupo.getGrupo()+"</option>");
			
		}%>
		
		
		</select> Quantity: <input type="text" name="qty" size="3" value="1"> <input
			type="submit" value="Add to Cart">

	</form>



</body>
</html>