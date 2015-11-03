package tp2015dds.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="condicion")
public class Condicion implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7308663537743379807L;

@Id
@Column(name="id_condicion")	
private String id_nombre;

	
public String getIdNombre() {
	return id_nombre;
}


public void setIdNombre(String nombre) {
	this.id_nombre = nombre;
}
	
	
	
	
	
	
	
	
}
