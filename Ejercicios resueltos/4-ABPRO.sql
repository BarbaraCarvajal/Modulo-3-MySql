USE modulo3;

-- Alter Table capacitacion
ALTER TABLE `modulo3`.`capacitacion` 
CHANGE COLUMN `rutCliente` `rutCliente` VARCHAR(15) NOT NULL ,
CHANGE COLUMN `dia` `dia` VARCHAR(25) NULL DEFAULT NULL ;

-- Alter Table asistentes
ALTER TABLE `modulo3`.`asistentes` 
DROP FOREIGN KEY `capacitacion_idCapacitacion`;

ALTER TABLE `modulo3`.`asistentes` 
CHANGE COLUMN `nombres` `nombres` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `edad` `edad` INT NOT NULL ,
CHANGE COLUMN `capacitacion_idCapacitacion` `capacitacion_idCapacitacion` INT NOT NULL ;

ALTER TABLE `modulo3`.`asistentes` 
ADD CONSTRAINT `capacitacion_idCapacitacion`
  FOREIGN KEY (`capacitacion_idCapacitacion`)
  REFERENCES `modulo3`.`capacitacion` (`idCapacitacion`);

-- 1. Genere una consulta que permita insertar un registro en la tabla de capacitaciones,
-- indicando solo los campos que son obligatorios a la consulta.
INSERT INTO capacitacion (idCapacitacion, rutCliente, lugar, duracion)
VALUES (21, '17.345.678-2', 'Unab Vina del Mar', 90);

COMMIT;

-- 2. Incluya una sentencia que confirme los cambios incorporados en la sentencia anterior
SELECT * FROM capacitacion;

-- tambien puede ser: 
SELECT * FROM capacitacion WHERE idCapacitacion = 21;

/*3. Agregue una consulta o instrucción que habilite el auto guardado de instrucciones para un
total de dos sentencias.*/

SET AUTOCOMMIT=0;

/*4. Agregue dos consultas para insertar un registro en la tabla de asistentes en cada una.
Incluya en la consulta todos los campos de la tabla en orden descendente respecto de cómo aparece en la definición de la tabla.
Asocie estos registros a la capacitación creada en el ítem 1 de este ejercicio. */

INSERT INTO asistentes 
(capacitacion_idCapacitacion, edad, nombres)
VALUES
(2, 23, 'camila ignacia'),
(6, 18, 'hugo boss');
