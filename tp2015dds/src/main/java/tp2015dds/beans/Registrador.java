package tp2015dds.beans;

import tp2015dds.daos.UsuarioDao;

public class Registrador {
	public void registrarUsuario(Usuario user){
	UsuarioDao usuarioDao = new UsuarioDao();
	usuarioDao.insertar(user);
	}	
}
