 CREATE DATABASE disenioDB;
 
 USE disenioDB;
 	
 CREATE TABLE usuario(
 	id_usuario VARCHAR(30) NOT NULL, /*AUTO_INCREMENT va con @GeneratedValue*/
 	nombre_usuario VARCHAR(30) NOT NULL,
 	sexo_usuario CHAR(1) NOT NULL,
 	edad_usuario INT NOT NULL,
 	altura_usuario FLOAT NOT NULL,
 	password_usuario VARCHAR(40)NOT NULL,
 	PRIMARY KEY (id_usuario)
 	);
 	 		
CREATE TABLE grupo(
 id_grupo VARCHAR(30) NOT NULL,
 PRIMARY KEY (id_grupo)
 );
 
 CREATE TABLE usuarioxgrupo(
	id_usuarioX VARCHAR(30) NOT NULL,
  	id_grupoX VARCHAR(30) NOT NULL,
  	PRIMARY KEY (id_usuarioX,id_grupoX),
 	FOREIGN KEY (id_usuarioX) REFERENCES usuario(id_usuario),
  	FOREIGN KEY (id_grupoX) REFERENCES grupo(id_grupo) 	
  	);
 
 
  	
INSERT INTO usuario(id_usuario,nombre_usuario,sexo_usuario,edad_usuario,altura_usuario,password_usuario)
VALUES ('pepe','JOSE','M',34,1.84,'pepe');

/*SET @usuario_id = LAST_INSERT_ID();*/
INSERT IGNORE INTO grupo(id_grupo) VALUES ('losgordos');
/*SET @grupo_id = LAST_INSERT_ID();*/
INSERT INTO usuarioxgrupo(id_usuarioX,id_grupoX) VALUES('pepe', 'losgordos');


INSERT IGNORE INTO grupo(id_grupo) VALUES ('losflacos');
/*SET @grupo_id = LAST_INSERT_ID();*/
INSERT INTO usuarioxgrupo(id_usuarioX,id_grupoX) VALUES('pepe', 'losflacos');


INSERT IGNORE INTO grupo(id_grupo) VALUES ('losanabolicos');
/*SET @grupo_id = LAST_INSERT_ID();*/
INSERT INTO usuarioxgrupo(id_usuarioX,id_grupoX) VALUES('pepe', 'losanabolicos');	


  	
  	/*
  	 SET @grupo_id = LAST_INSERT_ID();
INSERT INTO usuarioxgrupo(id_usuarioX,id_grupoX) VALUES(@usuario_id, @grupo_id);


INSERT IGNORE INTO grupo(id_grupo,usuario_id) VALUES ('losflacos');
SET @grupo_id = LAST_INSERT_ID();
INSERT INTO usuarioxgrupo(id_usuarioX,id_grupoX) VALUES(@usuario_id, @grupo_id);

INSERT IGNORE INTO grupo(id_grupo,usuario_id) VALUES ('losanabolicos');
SET @grupo_id = LAST_INSERT_ID();
INSERT INTO usuarioxgrupo(id_usuarioX,id_grupoX) VALUES(@usuario_id, @grupo_id);
  	 */
  	
	
	/*
	Consulta del join
		SELECT * FROM usuario u
		INNER JOIN usuarioxgrupo x ON(u.id_usuario=x.id_usuarioX)
		INNER JOIN grupo g ON(x.id_grupoX=g.id_grupo)	
	*/
  	/*
 INSERT INTO usuario(id_usuario,nombre_usuario,sexo_usuario,edad_usuario,altura_usuario,password_usuario)
 VALUES ('pepe','JOSE','M',34,1.84,'pepe'); 	
 	
 INSERT INTO grupo(id_grupo,usuario_id)
 VALUES ('losgordos','pepe'); 	 	
 	*/
 	
	
	
	CREATE TABLE condicion(
	id_condicion VARCHAR(30) NOT NULL,
	PRIMARY KEY(id_condicion)
	);
	
	INSERT INTO condicion(id_condicion)
		VALUE ("HIPERTENSO");
	
	INSERT INTO condicion(id_condicion)
		VALUE ("DIABETICO");
	
	INSERT INTO condicion(id_condicion)
		VALUE ("CELIACIO");
	
	
	CREATE TABLE condicionxusuario(
		id_condicionX VARCHAR(30) NOT NULL,
		id_usuarioX VARCHAR(30) NOT NULL,
		PRIMARY KEY(id_condicionX,id_usuarioX),
		FOREIGN KEY (id_condicionX) REFERENCES condicion(id_condicion),
		FOREIGN KEY (id_usuarioX) REFERENCES usuario(id_usuario)
	);
	
	
INSERT INTO condicionxusuario(id_condicionX,id_usuarioX) VALUES('HIPERTENSO', 'pepe');
INSERT INTO condicionxusuario(id_condicionX,id_usuarioX) VALUES	('DIABETICO','pepe');
	
	
 
 	
 	









 	
 	