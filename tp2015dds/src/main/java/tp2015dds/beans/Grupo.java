package tp2015dds.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="grupo")
public class Grupo {
	@Id
	@Column(name="id_grupo")
	private String grupo;
	
//	private Usuario unUsuario;

	public String getGrupo() {
		return grupo;
	}

	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}

//	public Usuario getUnUsuario() {
//		return unUsuario;
//	}
//
//	public void setUnUsuario(Usuario unUsuario) {
//		this.unUsuario = unUsuario;
//	}
//	
}
