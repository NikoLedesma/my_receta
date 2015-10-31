<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logueo de Usuario</title>
<script type="text/javascript" >
	function carga(){
		document.getElementById("usuario").focus();
	}
	
	function validarDatos(){
		var usuario = document.getElementById("usuario");
		var password = document.getElementById("password");
		
		
		if ((usuario.value ==  "" || usuario.value == '' || usuario.value == null) &&
				(password.value ==  "" || password.value == '' || password.value == null)){
			alert("Ingresa tu usuario y password");
			usuario.focus();
			return false;
		}		
		else if (usuario.value ==  "" || usuario.value == '' || usuario.value == null){
			alert("Ingresa tu usuario");
			usuario.focus();
			return false;
		} else if (password.value ==  "" || password.value == '' || password.value == null){
			alert("Ingresa tu password");
			password.focus();
			return false;
		  } 
		else return true;		
	}
</script>

<style>
a {
    color: #FF99FF;
}
</style>




</head>
<body onload="carga();" background='images/food-wallpaper.jpg'>
	<form action="loginWeb.jr" method="POST"
		onsubmit="return validarDatos();">
		<table align="center">
			<img border="0" src="images/login.jpg" alt="log">
			<tr>
				<td style="font-weight: bold;size=20px;color:white;" colspan="2">Ingresa tu
					usuario y tu Contraseña</td>
			</tr>
			<tr>
				<td style="font-weight: bold;size=12px; color:white;  " align="right">Usuario
					:</td>
				<td><input type="text" name="usuario" id="usuario"></td>
			</tr>
			<tr>
				<td style="font-weight: bold;size=12px;color:white" align="right">Password
					:</td>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr >
				<td align="left"><input type="button" value="Cancelar"></td>
				<td align="center"><input type="submit" value="Aceptar"></td>
			</tr>
			<tr >
				<td colspan="2" align="center"><a href="/tp2015dds/registro.jsp" >Registrarse </a> </td>
			</tr>
		</table>	

	</form>	
		
</body>
</html>