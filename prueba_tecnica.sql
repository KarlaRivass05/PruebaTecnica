-- Crear la base de datos llamada "prueba"

USE prueba;

SELECT * FROM usuarios;
SELECT * FROM roles;

/* script de tablas creadas automaticamente a la hora de importar los datos de excel
CREATE TABLE usuarios(
	`nombre_completo` VARCHAR(30) NOT NULL,
	`fecha_nacimiento` DATE NOT NULL,
	`correo` VARCHAR(40) NOT NULL,
	`documento_identidad` VARCHAR(10) NOT NULL,
	`fecha_ingreso` VARCHAR(20) NOT NULL,
	`rolId` TINYINT NOT NULL
)

CREATE TABLE roles (
	`rolId` TINYINT NOT NULL,
	`rol_nombre` VARCHAR(10) NOT NULL
)
*/

-- colocar id a la tabla 

ALTER TABLE usuarios
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

-- Agregar una nueva columna llamada "edad" de tipo INT a la tabla "usuarios"
ALTER TABLE usuarios
ADD COLUMN edad INT;

-- Actualizar la columna "edad" calculando la diferencia entre el año actual y el año de "fecha_nacimiento"
UPDATE usuarios
SET edad = YEAR(CURDATE()) - YEAR(fecha_nacimiento);

-- Agregar una nueva columna llamada "mayoria_edad" de tipo BOOLEAN a la tabla "usuarios"
ALTER TABLE usuarios 
ADD COLUMN mayoria_edad BOOLEAN;

-- Actualizar la columna "mayoria_edad" estableciendo TRUE(1) si "edad" es mayor o igual a 18, de lo contrario FALSE(0)
UPDATE usuarios
SET mayoria_edad = (edad >= 18);

-- Agregar una nueva columna llamada "antiguedad" de tipo INT a la tabla "usuarios"
ALTER TABLE usuarios
ADD COLUMN antiguedad INT;

-- Actualizar la columna "antiguedad" calculando la diferencia entre el año actual y el año de "fecha_ingreso"
UPDATE usuarios
SET antiguedad = YEAR(CURDATE()) - YEAR(fecha_ingreso);

-- Seleccionar los valores de "documento_identidad" y contar cuántas veces se repiten, mostrando solo aquellos con duplicados
SELECT documento_identidad, COUNT(*) AS duplicados
FROM usuarios 
GROUP BY documento_identidad 
HAVING COUNT(*) > 1;
-- hacer un join a la misma tabla para elimianr los duplicados, se eliminarán las filas con el id más alto, conservando la fila con el id más bajo
DELETE c1 FROM usuarios c1
JOIN usuarios c2 
WHERE
    c1.documento_identidad = c2.documento_identidad AND
    c1.id > c2.id;

-- Identificar fechar con valores no validos
SELECT nombre_completo, fecha_ingreso, antiguedad FROM usuarios WHERE fecha_ingreso >= YEAR(CURRENT_DATE) || fecha_ingreso = 'invalid-date' ; 

-- Cambiar para que aparezca nombre de rol en lugar de id
SELECT 
    usuarios.nombre_completo,
    usuarios.fecha_nacimiento,
    usuarios.correo,
    usuarios.documento_identidad,
     usuarios.fecha_ingreso,
    roles.rol_nombre AS rol,
    usuarios.edad,
    usuarios.mayoria_edad,
    usuarios.antiguedad
FROM usuarios
JOIN roles ON usuarios.rolId = roles.rolId;

-- Verificar validacion de correo 
SELECT correo
FROM usuarios
WHERE correo REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

-- agregar campos de nombre y apellido
ALTER TABLE usuarios
ADD COLUMN nombre VARCHAR(50),
ADD COLUMN apellido VARCHAR(50);

-- actualizar los campos separando el nombre 
UPDATE usuarios
SET 
  nombre = SUBSTRING_INDEX(nombre_completo, ' ', 1), 
  apellido = SUBSTRING_INDEX(nombre_completo, ' ', -1); 
