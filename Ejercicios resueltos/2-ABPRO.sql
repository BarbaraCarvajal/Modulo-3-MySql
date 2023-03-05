/*Cree una base de datos que estará asociada al proyecto que realizará a lo largo de esta
unidad. Puede hacerlo de forma manual usando los tipos de datos y claves foráneas
usadasen la imagen anterior, o bien puede usar el script adjunto al final del enunciado.
- Ingrese manualmente a la tabla Capacitación a lo menos 5 registros, mientras que en la
tabla Asistentes debe ingresar manualmente al menos 10 registros, asociados a
diferentes registros de capacitaciones.
*/
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

  -- insertar columnas
  
use modulo3;
insert into capacitacion (idCapacitacion, rutCliente, dia, hora, lugar, duracion, cantAsistentes)
values 
(1, "17.355.848-1", "lunes", "15:00", "Unab", 60, 15),
(2,"20.067.238-0", "martes", "16:00", "UPLA", 45, 20),
(3,"24.361.222-5", "miercoles", "17:00", "Unab", 120, 50),
(4,"18.942.234-k", "jueves", "12:00", "UFSM", 60, 30),
(5,"20.348.718-2", "sabado", "9:00", "UC", 180, 50),
(6,"1.284.648-7", "lunes", "10:00", "Unab", 120, 30),
(7,"6.750.958-7", "martes", "11:00", "UC", 45, 10),
(8,"6.677.542-7", "miercoles", "12:00", "UFSM", 60, 20),
(9,"17.949.679-1", "jueves", "15:00", "Unab", 180, 25),
(10,"14.843.818-7", "viernes", "", "UPLA",45, 15),
(11, "17.789.848-1", "lunes", "15:00", "La Florida", 60, 70),
(12,"15.344.298-7", "martes", "16:00", "Quilpue", 8, 20),
(13, "12.355.238-0", "miercoles", "15:00", "La Florida", 60, 55),
(14,"20.555.218-2", "martes", "16:00", "Quilpue", 8, 31),
(15, "19.546.673-8", "sabado", "9:00", "La Florida", 60, 70),
(16,"14.426.874-k", "sabado", "8:00", "Vina del Mar", 60, 20),
(17, "9.364.569-k", "viernes", "10:00", "La Florida", 29, 55),
(18,"13.714.941-0", "miercoles", "11:00", "Valparaiso",20, 51),
(19, "1-9", "domingo", "9:00", "La Florida", 50, 70),
(20,"2-7", "lunes", "8:00", "Vina del Mar", 45, 20);

select * from capacitacion;

use modulo3;
insert into asistentes (idAsistentes, nombres, edad, capacitacion_idCapacitacion)
values
(1, "Consuelo Magana", 30, 1),
(2,"Barbara Carvajal", 29, 2),
(3,"Ana Espinoza", 31, 3),
(4,"Rodrigo Soto", 29, 4),
(5,"Manuel Rodriguez", 28, 5),
(6,"Maria de la Rosa ", 39, 5),
(7,"Camilo Monsalves", 45, 7),
(8,"Camila Cid", 20, 3),
(9,"Vicente Poblete",40, 3),
(10,"Romina Cornejo", 45, 3); 

-- 1. Una consulta que despliegue todas las capacitaciones realizadas un lunes, que hayan
-- durado menos de una hora y media.

select * from capacitacion where dia = "lunes" and duracion < 90;

-- 2.Una consulta que despliegue el listado de asistentes, mostrando el apellido y el nombre,
-- y el RUT del cliente, lugar y duración de la capacitación a la que asistió.

select asistentes.nombres, capacitacion.rutCliente, capacitacion.lugar, capacitacion.duracion
from  asistentes inner join capacitacion
on asistentes.capacitacion_idCapacitacion = capacitacion.idCapacitacion;

/* 3.Una consulta que despliegue el listado de capacitaciones mostrando RUT del cliente, día
y hora, tales que la cantidad de asistentes registrada en el campo cantAsistentes no
coincidacon la cantidad existente en la tabla Asistentes.
// utilizando una subconsulta para que cuente la cantidad de asistentes registrados 
en la tabla asistentes para cada capacitación y poder compararla con la cantidad de asistentes registrada 
en la tabla capacitacion.
la consulta muestra el RUT del cliente, día y hora de las capacitaciones. 
La cantidad de asistentes registrada en la tabla capacitacion es diferente de la cantidad de asistentes registrada
 en la tabla asistentes.//
*/

select capacitacion.rutCliente, capacitacion.dia, capacitacion.hora from capacitacion 
where capacitacion.cantAsistentes <> (select count(*) from asistentes
    where asistentes.capacitacion_idCapacitacion = capacitacion.idCapacitacion);
    
/* 4. Una consulta que muestre el listado de capacitaciones que tengan más de tres
asistentes registrados en la tabla respectiva. De la tabla de capacitaciones debe mostrar
el lugar, la duración, el día y la hora... sirve para el 4 tb*/

select capacitacion.lugar, capacitacion.duracion, capacitacion.dia, capacitacion.hora from capacitacion 
where (select count(*) from asistentes 
    where asistentes.capacitacion_idCapacitacion = capacitacion.idCapacitacion) > 3;

    
    


