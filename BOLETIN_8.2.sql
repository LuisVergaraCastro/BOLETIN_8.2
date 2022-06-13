--Boletin 8.2
--Consultas sobre una sola Tabla con agregados
--Escribe el c�digo SQL necesario para realizar las siguientes operaciones
--sobre la base de datos "pubs�
USE pubs

--1. Numero de libros que tratan de cada tema
SELECT type, COUNT(*) AS [N� DE LIBROS] FROM titles GROUP BY type
--2. N�mero de autores diferentes en cada ciudad y estado
SELECT COUNT(*) AS [N� DE AUTORES], city, state FROM authors GROUP BY city, state
--3. Nombre, apellidos, nivel y antig�edad en la empresa de los empleados con un nivel entre 100 y 150.
SELECT fname, lname, job_lvl, DATEDIFF(YEAR,hire_date,CURRENT_TIMESTAMP) AS ANTIGUEDAD FROM employee WHERE job_lvl BETWEEN 100 AND 150
--4. N�mero de editoriales en cada pa�s. Incluye el pa�s.
SELECT COUNT(*) AS [N� DE EDITORIALES], country, ISNULL(state, ' ') AS STATE FROM publishers GROUP BY country, state
--5. N�mero de unidades vendidas de cada libro en cada a�o (title_id, unidades y a�o).
SELECT COUNT(*) AS [N� DE UNIDADES VENDIDAS], title_id, YEAR(ord_date) AS A�O FROM sales GROUP BY title_id, YEAR(ord_date)
--6. N�mero de autores que han escrito cada libro (title_id y numero de autores).
SELECT COUNT(au_id) AS [N� DE AUTORES], title_id FROM titleauthor GROUP BY title_id
--7. ID, Titulo, tipo y precio de los libros cuyo adelanto inicial (advance) tenga un valor superior a $7.000,
--ordenado por tipo y t�tulo
SELECT title_id, title, type, price FROM titles WHERE advance >= 7000 ORDER BY type, title