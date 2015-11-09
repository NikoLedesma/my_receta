<%@page import="tp2015dds.daos.GeneralDao"%>
<%@page import="tp2015dds.beans.Condicion"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registracion de usuario</title>


<script>
	function camposCompletos() {
		var usuario = document.getElementById("usuario");
		var nombre = document.getElementById("nombre");
		var password = document.getElementById("password");
		var altura = document.getElementById("altura");
		var edad = document.getElementById("edad");

		if (usuario.value == "" || password.value == "" || altura.value == ""
				|| edad.value == "" || nombre.value == "") {
			alert("Faltan completar los campos");
			usuario.focus();
			return false;
		} else
			return true;

	}

	function isInt(x) {
		return (x % 1 == 0);
	}

	function camposValidos() {

		var usuario = document.getElementById("usuario");
		var nombre = document.getElementById("nombre");
		var password = document.getElementById("password");
		var altura = document.getElementById("altura");
		var edad = document.getElementById("edad");

		var valorEdad = parseInt(edad.value);
		var valorAltura = parseInt(altura.value);

		var str = "";
		var flag = false;
		if (isNaN(valorEdad)) {
			var auxST = str.concat("La edad no es un valor entero\n");
			str = auxST;
			flag = true;
		}

		if (isNaN(valorAltura)) {
			var auxST = str.concat("El valor de la altura no es correcto\n");
			str = auxST;
			flag = true;
		}

		if (flag) {
			alert(str);
			return (!flag);
		}

	}

	function verificarCampos() {
		return (camposCompletos() && camposValidos()) 
		
	}
	
	
	
	function radioCheck(){
		var valoresRad = document.getElementsByName("sex");
		var sex_valor=document.getElementById("sexo");
		for (i=0;i<valoresRad.length;i++){
			if(valoresRad[i].checked==true){
				
				sex_valor.value=valoresRad[i].value;
				alert(sex_valor.value);
			}
		}
		
		
	}
	
	
	
	function allCheck(){
		var checkboxes = document.getElementsByName("condicion");
		var i=0;
		for(;i<checkboxes.length;i++){
			if(checkboxes[i].checked)
				alert(checkboxes[i].value);			
		}
	}
	
	
</script>


<style> 
#tablita{
    border: 2px solid #a1a1a1;
    padding: 10px 40px; 
    background: #dddddd;
    width: 350px;
    border-radius: 25px;
    box-shadow: -13px 17px 18px -7px rgba(0,0,0,0.63);
}
</style>



</head>
<body background='images/register.jpg'>

<input type="hidden" id="sexo">

<h1 align="center">Registro de usuario</h1>
	
	
	<% 
	List <Condicion> condiciones;
	GeneralDao generalDao=new GeneralDao();
	condiciones=generalDao.leerTodasLasCondiciones();		
	%>
		
	<form action="registrado.jr" method="POST" onsubmit="return camposValidos();">
		<table align="center" id="tablita">
			<tr>
				<td style="font-weight: bold; size =20px; color: black;" colspan="3">Registrese
					e ingrese los campos</td>
			</tr>
			<tr>
				<td style="font-weight: bold; size =12px; color: black;"
					align="right">Usuario*:</td>
				<td colspan="2"><input type="text" name="usuario" id="usuario"></td>
			</tr>
			<tr>
				<td style="font-weight: bold; size =12px; color: black"
					align="right">Password*:</td>
				<td colspan="2"><input type="password" name="password"
					id="password"></td>
			</tr>

			<tr>
				<td style="font-weight: bold; size =12px; color: black"
					align="right">Nombre*:</td>
				<td colspan="2"><input type="text" name="nombre" id="nombre"></td>
			</tr>


			<tr>
				<td style="font-weight: bold; size =12px; color: black"
					align="right">Altura*:</td>
				<td colspan="2"><input type="text" name="altura" id="altura"></td>
			</tr>

			<tr>
				<td style="font-weight: bold; size =12px; color: black"
					align="right">Edad*:</td>
				<!--  <td colspan="2"><input type="text" name="edad" id="edad" ></td> -->

				<td colspan="2"><select name="edad">
						<%
							int i;
							for (i = 18; i < 70; i++) {
								out.println("<option>" + i + "</option>");
							}
						%>
				</select></td>

			</tr>

			<tr>

				<td style="font-weight: bold; size =12px; color: black"
					align="right">Sexo*:</td>
				<td><input type="radio" name="sex" value="masculino">Hombre<br></td>
				<td><input type="radio" name="sex" value="femenino" checked>Mujer<br></td>
			</tr>

			<tr>
				<td style="font-weight:bold;size=14px;color:black" align="center" colspan="3">Condiciones</td>
			</tr>	
				
			<!--<tr>
				<td><input type="checkbox" name="condicion" value="celiaco">Celiacio</td>
				<td> <input type = "checkbox" name="condicion" value="diabetico">Diabetico</td>
				<td><input type="checkbox" name="condicion" value="hipertenso">Hipertenso</td> 
			</tr>-->	
				<%
				i=3;
				
				for (Condicion condicion : condiciones){
					
					if(i==3){
						out.print("<tr>");
						i=0;
					}
					i++;
					String auxName=condicion.getIdNombre().toLowerCase();
					out.println("<td><input type=\"checkbox\" name=\"condicion\" value="+auxName+">"+auxName+"</td>");			
					if(i==3){
						out.print("</tr>");			
					}
					
				}
				
				if(i!=3)
					out.print("</tr>");
				
				
				
				%>								
			<tr>
				<td><input type="button" value="Cancelar"></td>
				<td><input type="submit" value="Aceptar" onClick="radioCheck()"></td>
			</tr>
			
			<tr>
				<td><input type="button" value="Ver checked's" onClick="allCheck()"></td>
			</tr>
		</table>
		
	</form>

</body>
</html>