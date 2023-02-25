
<br/>
<div align="center">

<h1 align="center"><b> AE1-ABPRO<br/>
 Modulo 3 Java</b></h1>
<h2 align="center">Primer trabajo de duplas aplicando MySql 📝</h2>
<img src="https://github.com/BarbaraCarvajal/AE1-ABPRO/blob/master/giphy.gif">

<b>Autores</b>
<br/>

[Bárbara Carvajal](https://github.com/BarbaraCarvajal)
<br />
[Consuelo Magaña](https://github.com/MagaLop)
<br />


<br/>
</div>

### PROBLEMA
Una empresa de asesorías en prevención de riesgos necesita contar con un sistema de información que le permita administrar los principales procesos que se llevan a cabo en ella día a día.
En base a ello, identificaremos como unos de sus principales procesos, “Capacitación”, proceso que manejará una serie de datos tales como los siguientes:
- Identificador: obligatorio, número interno de la capacitación manejado por la empresa
- RUT cliente: obligatorio, tipo texto largo máximo 15 caracteres.
- Día: texto, día de la semana.
- Hora: texto, largo máximo 5. Debe tener formato HH:MM.
- Lugar: obligatorio, máximo 50 caracteres.
- Duración: obligatorio, número; el valor representa minutos
- Cantidad de asistentes: número

### DESARROLLO
En base a lo anterior, realice las siguientes operaciones:
• Cree una base de datos que estará asociada al proyecto que realizará a lo largo de esta unidad.
• Acceda a la base de datos a través de MySQL
• Cree la tabla Capacitación; use tipos de dato number o varchar2 según sea el caso. Cuide asimismo el largo máximo permitido de los campos y los campos que admiten valores nulos.
• Ingrese manualmente a la tabla a lo menos 10 registros.

#### Realice las siguientes consultas sobre la tabla:
1. Una consulta que obtenga todos los registros de la tabla sin filtro alguno, mostrando las columnas identificador, hora, dia y rut de cliente (en ese orden).
2. Una consulta que obtenga todas las capacitaciones que duran una hora, y que tuvieron más de 30 asistentes. Debe desplegar todas las columnas sin un orden solicitado.
3. Una consulta que obtenga las capacitaciones realizadas por el cliente de RUT 1-9 o 2-7, y que el lugar es “La Florida”. Despliegue todas las columnas en el orden contrario a su definición original.
4. Una consulta que obtenga todas las capacitaciones que han durado más de media hora, pero menos de una hora y media, o bien que sus asistentes es menos que 10 personas. Se pide mostrar el identificador de una tabla, y los campos indicados en la consulta.
5. Una consulta que obtenga las capacitaciones de los lunes, miércoles y viernes, que tengan más de 50 asistentes y que hayan durado menos de media hora. Debe desplegar los campos que estime prudente.
