SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' order by apellido1, apellido2, nombre;use universidad;
SELECT apellido1, apellido2, nombre, tipo, telefono FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '1999%';
SELECT apellido1, apellido2, nombre, tipo, telefono, nif FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7; 
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p JOIN profesor pr on (p.id = pr.id_profesor) JOIN departamento d on (pr.id_departamento = d.id) order by apellido1, apellido2, p.nombre;
SELECT a.nombre, p.nif, ce.anyo_inicio, ce.anyo_fin FROM asignatura a JOIN alumno_se_matricula_asignatura asma on (a.id = asma.id_asignatura) JOIN persona p on (asma.id_alumno = p.id) JOIN curso_escolar ce on (asma.id_curso_escolar = ce.id) WHERE p.nif = '26902806M';  
SELECT d.nombre FROM persona p JOIN asignatura a ON (p.id = a.id_profesor) JOIN grado g ON (g.id = a.id_grado) JOIN profesor pr ON (p.id = pr.id_profesor) JOIN departamento d ON (d.id = pr.id_departamento) WHERE g.nombre = "Grado en Ingeniería Informática (Plan 2015)" group by d.nombre; 
SELECT DISTINCT p.nombre , p.apellido1, p.apellido2 FROM persona AS p JOIN alumno_se_matricula_asignatura asma ON (asma.id_alumno = p.id) JOIN asignatura a ON asma.id_asignatura = a.id JOIN curso_escolar ce ON (asma.id_curso_escolar = ce.id) WHERE ce.anyo_inicio = '2018' AND ce.anyo_fin = '2019';
--
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr on (p.id = pr.id_profesor) LEFT JOIN departamento d ON (pr.id_departamento = d.id) WHERE p.tipo = 'profesor';
SELECT p.nombre FROM persona p right JOIN profesor pr ON p.id = pr.id_profesor WHERE p.nombre = NULL; 
SELECT DISTINCT d.id, d.nombre, pr.id_departamento FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, a.id FROM persona p LEFT JOIN asignatura a ON (p.id = a.id_profesor) WHERE p.tipo = "profesor" AND a.id_profesor IS NULL;
SELECT * FROM asignatura WHERE id_profesor IS NULL;
SELECT DISTINCT d.id, d.nombre, ce.id FROM departamento d LEFT JOIN profesor pr ON (d.id = pr.id_departamento) LEFT JOIN asignatura a ON (pr.id_profesor = a.id_profesor) LEFT JOIN curso_escolar ce ON (a.curso = ce.id) WHERE ce.id IS NULL;
-- consultas resumen
SELECT COUNT(p.tipo) FROM persona p WHERE p.tipo = 'alumno';
SELECT count(p.fecha_nacimiento) FROM persona p WHERE p.fecha_nacimiento >= '1999-01-01' and p.fecha_nacimiento < '2000-01-01';
SELECT d.nombre, p.nombre FROM profesor pr JOIN departamento d on (pr.id_departamento = d.id) JOIN persona p on (pr.id_profesor = p.id) order by p.nombre asc;
SELECT d.nombre AS 'departamento', d.id AS 'id departamento', p.nombre FROM departamento d left JOIN profesor pr on (d.id = pr.id_departamento) left join persona p on (pr.id_profesor = p.id);
SELECT g.nombre, COUNT(a.id) AS cantidad FROM grado g LEFT JOIN asignatura a ON (g.id = a.id_grado) GROUP BY g.id ORDER BY cantidad DESC;
SELECT g.nombre, COUNT(a.id) AS cantidad FROM grado g JOIN asignatura a ON (g.id = a.id_grado) GROUP BY g.id HAVING cantidad > 40 ;
SELECT a.tipo,g.nombre, SUM(a.creditos) FROM asignatura a JOIN grado g ON (a.id_grado = g.id) GROUP by g.nombre, a.tipo;
SELECT ce.anyo_inicio, SUM(p.id) 'cantidad_alumnos' FROM persona p JOIN alumno_se_matricula_asignatura asma ON (p.id = asma.id_alumno) JOIN curso_escolar ce ON (ce.id = asma.id_curso_escolar) GROUP BY ce.id;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, a.nombre AS 'asignatura' FROM persona p left join profesor pr ON (p.id = pr.id_profesor) left JOIN asignatura a ON (pr.id_profesor = a.id_profesor) ORDER BY a.nombre, p.nombre;
SELECT * FROM persona p ORDER BY p.fecha_nacimiento DESC LIMIT 1;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, a.nombre AS 'asignatura' FROM persona p JOIN profesor pr ON (p.id = pr.id_profesor) JOIN departamento d ON (d.id = pr.id_departamento) LEFT JOIN asignatura a ON (p.id = a.id_profesor) WHERE a.id IS NULL ORDER BY p.id;
