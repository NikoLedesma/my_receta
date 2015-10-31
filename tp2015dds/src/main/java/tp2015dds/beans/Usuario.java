package tp2015dds.beans;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
//import java.sql.Date;



@Entity
@Table(name="usuario")
public class Usuario implements Serializable {


	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1432586886184006438L;
	
	private static final char femenino='F';
	private static final char masculino='M';
	
	@Id 
	@Column(name = "id_usuario")	
	private String usuario;
	
	@Column(name = "nombre_usuario")
	private String nombre;
	
	public Set<Grupo> getGrupos() {
		return grupos;
	}

	public void setGrupos(Set<Grupo> grupos) {
		this.grupos = grupos;
	}

	@Column(name = "sexo_usuario")
	private char sexo;
	
	@Column(name = "edad_usuario")
	private int edad;
	
	@Column(name = "altura_usuario")
	private float altura;
	
	@Column(name = "password_usuario")
	private String password;
	
	@ManyToMany(targetEntity=Grupo.class,cascade={CascadeType.ALL},fetch = FetchType.EAGER)//el fetch eager sirve para que cuando traiga un usuario me traiga la lista
	@JoinTable(name="UsuarioXGrupo",
				joinColumns={@JoinColumn(name = "id_usuarioX")},
				inverseJoinColumns={@JoinColumn(name="id_grupoX")})
	private Set<Grupo> grupos;
	
	
	/*
	 * select UsuarioXGrupo from 
	 * */
	
	public boolean esHombre(){
		if (sexo==masculino)
			return true;
		else return false;
	}
	
	public String getUsuario() {
		return usuario;
	}

	public char getSexo() {
		return sexo;
	}

	public void setSexo(char sexo) {
		this.sexo = sexo;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public float getAltura() {
		return altura;
	}

	public void setAltura(float altura) {
		this.altura = altura;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
