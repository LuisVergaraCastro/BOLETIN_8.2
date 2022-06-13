--Boletin 8.2
--Consultas sobre una sola Tabla con agregados
--Escribe el código SQL necesario para realizar las siguientes operaciones
--sobre la base de datos "pubs”
USE pubs

--1. Numero de libros que tratan de cada tema
SELECT type, COUNT(*) AS [Nº DE LIBROS] FROM titles GROUP BY type
--2. Número de autores diferentes en cada ciudad y estado
SELECT COUNT(*) AS [Nº DE AUTORES], city, state FROM authors GROUP BY city, state
--3. Nombre, apellidos, nivel y antigüedad en la empresa de los empleados con un nivel entre 100 y 150.
SELECT fname, lname, job_lvl, DATEDIFF(YEAR,hire_date,CURRENT_TIMESTAMP) AS ANTIGUEDAD FROM employee WHERE job_lvl BETWEEN 100 AND 150
--4. Número de editoriales en cada país. Incluye el país.
SELECT COUNT(*) AS [Nº DE EDITORIALES], country, ISNULL(state, ' ') AS STATE FROM publishers GROUP BY country, state
--5. Número de unidades vendidas de cada libro en cada año (title_id, unidades y año).
SELECT COUNT(*) AS [Nº DE UNIDADES VENDIDAS], title_id, YEAR(ord_date) AS AÑO FROM sales GROUP BY title_id, YEAR(ord_date)
--6. Número de autores que han escrito cada libro (title_id y numero de autores).
SELECT COUNT(au_id) AS [Nº DE AUTORES], title_id FROM titleauthor GROUP BY title_id
--7. ID, Titulo, tipo y precio de los libros cuyo adelanto inicial (advance) tenga un valor superior a $7.000,
--ordenado por tipo y título
SELECT title_id, title, type, price FROM titles WHERE advance >= 7000 ORDER BY type, title