-- crear Base de datos
CREATE SCHEMA `modulo3` ;

-- crear tabla capacitacion
CREATE TABLE `modulo3`.`capacitacion` (
  `idCapacitacion` INT NOT NULL,
  `rutCliente` VARCHAR(15) NOT NULL,
  `dia` VARCHAR(25) NULL,
  `hora` VARCHAR(5) NULL,
  `lugar` VARCHAR(50) NOT NULL,
  `duracion` INT NOT NULL,
  `cantAsistentes` INT NULL,
  PRIMARY KEY (`idCapacitacion`));
  
  -- crear tabla asistente
CREATE TABLE `modulo3`.`capacitacion` (
 `idAsistentes` INT NOT NULL,
 `nombres` VARCHAR(100) NULL,
  `edad` INT NULL,
  `capacitacion_idCapacitacion` INT NULL,
  PRIMARY KEY (`idAsistentes`));
  
  -- agregar FK
  ALTER TABLE `modulo3`.`asistentes` 
ADD INDEX `capacitacion_idCapacitacion_idx` (`capacitacion_idCapacitacion` ASC) VISIBLE;
;
ALTER TABLE `modulo3`.`asistentes` 
ADD CONSTRAINT `capacitacion_idCapacitacion`
  FOREIGN KEY (`capacitacion_idCapacitacion`)
  REFERENCES `modulo3`.`capacitacion` (`idCapacitacion`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

 
/* 1. Haga las consultas necesarias para convertir las llaves primarias de cada tabla en campos autonuméricos. 
ALTER TABLE asistentes
MODIFY idAsistentes INT AUTO_INCREMENT; */


-- Para capacitaciones primero eliminar la clave foranea 

ALTER TABLE asistentes
DROP FOREIGN KEY capacitacion_idCapacitacion;

-- Luego agregamos la modificación auto incremental

ALTER TABLE capacitacion
MODIFY idCapacitacion INT AUTO_INCREMENT;

-- Y luego lo volvemos a agregar


ALTER TABLE asistentes
ADD CONSTRAINT capacitacion_idCapacitacion
FOREIGN KEY (capacitacion_idCapacitacion)
REFERENCES capacitacion(idcapacitacion);

/* 2. Genere 3 consultas que permitan ingresar datos sobre la tabla Capacitación, sin asignar el campo idcapacitacion en la consulta misma. */

INSERT INTO capacitacion
(rutCliente, dia, hora, lugar, duracion, cantAsistentes)
VALUES
('12.988.343-8', 'martes','10:30' ,'municiapalidad quilpue', 60, 20),
('10.454.222-0', 'lunes','12:30', 'Duoc Vinia del mar', 45, 5),
('79.233.989-2', 'miercoles','13:20', 'Santa Maria', 20, 10);

/* 3. Genere 5 consultas que permitan ingresar datos sobre la xtabla Asistentes, sin asignar elcampo idasistente en la consulta misma. */

insert into asistentes (nombres, edad, capacitacion_idCapacitacion)
values
("Maria Jose Quintanilla", 28, 1),
("Karen Paola", 32, 3),
("Marciake", 25, 4),
("Profesor Rosa", 58, 2),
("Cat-Dog", 66, 1);

/* 4. Realice una consulta que permita establecer una restricción de tipo única sobre el campo nombres de la tabla Asistentes.

ALTER TABLE Asistentes
ADD CONSTRAINT nombres_unicos UNIQUE (nombres);
*/

/* 5. Realice una consulta que permita actualizar los campos dia a “01/01/2020” y hora a “00:00” de la tabla capacitación, para todos aquellos registros tales que el día y la hora son igual a un valor nulo. */ 


UPDATE capacitacion
SET dia = '01/01/2020', hora = '00:00'
WHERE dia IS NULL AND hora IS NULL;

/*
6. Realice una consulta que permita eliminar todas aquellas capacitaciones que no tienen asistentes. Esto es, aquellas capacitaciones con el campo cantidadasistentes igual a 0, y sin registros relacionados en la tabla
*/
DELETE FROM capacitacion
WHERE cantasistentes = 0 AND idCapacitacion NOT IN (SELECT capacitacion_idCapacitacion FROM asistentes);