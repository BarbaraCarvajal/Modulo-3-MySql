/*• Cree una base de datos que estará asociada al proyecto que realizará a lo largo de esta unidad.
• Acceda a la base de datos a través de MySQL
• Cree la tabla Capacitación; use tipos de dato number o varchar2 según sea el caso. Cuide
asimismo el largo máximo permitido de los campos y los campos que admiten valores nulos.
• Ingrese manualmente a la tabla a lo menos 10 registros.
*/

-- crear Base de datos
CREATE SCHEMA `m3abpro1` ;

-- crear tabla
CREATE TABLE `m3abpro1`.`capacitacion` (
  `idCapacitacion` INT NOT NULL,
  `rutCliente` VARCHAR(15) NOT NULL,
  `dia` VARCHAR(10) NULL,
  `hora` VARCHAR(5) NULL,
  `lugar` VARCHAR(50) NOT NULL,
  `duracion` INT NOT NULL,
  `cantAsistentes` INT NULL,
  PRIMARY KEY (`idCapacitacion`));
  
  -- insertar columnas
use m3abpro1;
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

-- 1. Una consulta que obtenga todos los registros de la tabla sin filtro alguno, mostrando las
--    columnas identificador, hora, dia y rut de cliente (en ese orden).

select idCapacitacion, rutCliente hora, dia from capacitacion; 

-- 2. Una consulta que obtenga todas las capacitaciones que duran una hora, y que tuvieron más de
--    30 asistentes. Debe desplegar todas las columnas sin un orden solicitado.

select * from  capacitacion where duracion = 60 and cantAsistentes > 30;  

/* 3. Una consulta que obtenga las capacitaciones realizadas por el cliente de RUT 1-9 o 2-7,
y que el lugar es “La Florida”. Despliegue todas las columnas en el orden contrario a su
definición original.*/

select cantAsistentes, duracion,lugar,hora, dia, rutCliente from capacitacion where rutCliente = "1-9" or
rutCliente = "2-7" and lugar = "La florida";

/* 4. Una consulta que obtenga todas las capacitaciones que han durado más de media hora, 
pero menos de una hora y media, o bien que sus asistentes es menos que 10 personas. 
Se pide mostrar el identificador de una tabla, y los campos indicados en la consulta.*/

select idCapacitacion, duracion, cantAsistentes from capacitacion where duracion between 31 and 89 or cantAsistentes < 10;

-- 5. Una consulta que obtenga las capacitaciones de los lunes, miércoles y viernes, que tengan 
-- más de 50 asistentes y que hayan durado menos de media hora. Debe desplegar los campos que estime prudente.

select dia, cantAsistentes, duracion from capacitacion where cantAsistentes > 50 and duracion < 30;

  

