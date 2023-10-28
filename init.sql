DROP TABLE IF EXISTS lectores;
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS prestamos;

CREATE TABLE lectores
	(dni varchar(8),
	nombre varchar(30),
	apellidos varchar(50),
	domicilio varchar(50),
	poblacion varchar(30),
	telefono varchar(20));

ALTER TABLE lectores
	ADD CONSTRAINT PK_lectores PRIMARY KEY(dni);

CREATE TABLE libros
	(isbn varchar(20),
	titulo varchar(30),
	autor varchar(50));

ALTER TABLE libros
	ADD CONSTRAINT PK_libros PRIMARY KEY(isbn);

CREATE TABLE prestamos
	(dni varchar(8),
	isbn varchar(20),
	fecha date);

ALTER TABLE prestamos
	ADD CONSTRAINT PK_prestamos PRIMARY KEY(dni,isbn,fecha);
	
INSERT INTO lectores
VALUES('48966469','Ernesto','Raposo Belizon','Napoles 13','S.Fdo','661329767');

INSERT INTO lectores
VALUES('47946671','Franciso','Gutierrez Ochoa','Churruca 5','S.Fdo','654218961');

INSERT INTO libros
VALUES('84-7786-734-8','Fundamentos de C++','Francisco Palomo');

INSERT INTO libros
VALUES('72-2243-3972-4','Por fin C-ISO','Gerardo Igurruzaga');

INSERT INTO prestamos
VALUES('48966469','84-7786-734-8',CURRENT_DATE);

INSERT INTO prestamos
VALUES('47946671','72-2243-3972-4',CURRENT_DATE)

-- Jesús Gómez - jesus.gomeztocino@alum.uca.es