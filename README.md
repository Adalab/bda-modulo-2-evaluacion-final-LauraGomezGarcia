
# Evaluación Final Módulo 2 - SQL

Este repositorio contiene las soluciones para la evaluación final del Módulo 2, que se centra en SQL.

## Descripción

La evaluación consiste en una serie de ejercicios que evalúan la comprensión y habilidades en SQL. Se utiliza la base de datos Sakila, una base de datos de ejemplo que simula una tienda de alquiler de películas. 

## Instrucciones

1.  Clonar este repositorio en tu ordenador. 
2.  Para realizar la evaluación, debes ejecutar las consultas SQL proporcionadas en el archivo `Evaluacion_final_Laura_Gomez.sql` sobre la base de datos Sakila.

## Archivos del Repositorio

Este repositorio contiene los siguientes archivos:

* `bbdd_sakila.sql`: Este archivo contiene el script para crear la base de datos Sakila. Debes ejecutar este script en tu sistema de gestión de bases de datos (como MySQL, PostgreSQL, etc.) para poder realizar las consultas.
* `Evaluacion_final_Laura_Gomez.sql`: Este archivo contiene las consultas SQL que debes ejecutar para resolver los ejercicios de la evaluación.

## Cómo Utilizar

1.  **Crear la base de datos:** Primero, ejecuta el script `bbdd_sakila.sql` en tu sistema de gestión de bases de datos para crear la base de datos Sakila.
2.  **Ejecutar las consultas:** Abre el archivo `Evaluacion_final_Laura_Gomez.sql` y ejecuta cada una de las consultas SQL en el orden en que aparecen, utilizando tu sistema de gestión de bases de datos conectado a la base de datos Sakila. 

## Base de Datos

Esta base de datos se compone de las siguientes tablas principales:

* **actor:** Información de los actores (id, nombre, apellido, última actualización).
* **address:** Detalles de las direcciones (id, dirección, distrito, ciudad, código postal, teléfono, ubicación, última actualización).
* **category:** Categorías de películas (id, nombre, última actualización).
* **city:** Información de las ciudades (id, nombre, país, última actualización).
* **country:** Nombres de los países (id, nombre, última actualización).
* **customer:** Datos de los clientes (id, tienda, nombre, apellido, email, dirección, activo, fecha de creación, última actualización).
* **film:** Detalles de las películas (id, título, descripción, año de lanzamiento, idioma, idioma original, duración alquiler, tarifa alquiler, duración, costo reemplazo, clasificación, características especiales, última actualización).
* **film\_actor:** Relación entre películas y actores (actor id, film id, última actualización).
* **film\_category:** Relación entre películas y categorías (film id, category id, última actualización).
* **inventory:** Copias individuales de películas en tiendas (id, película, tienda, última actualización).
* **language:** Idiomas disponibles (id, nombre, última actualización).
* **payment:** Pagos realizados por clientes (id, cliente, personal, alquiler, monto, fecha pago, última actualización).
* **rental:** Registros de alquileres (id, fecha alquiler, inventario, cliente, fecha devolución, personal, última actualización).
* **staff:** Información del personal de la tienda (id, nombre, apellido, dirección, email, tienda, activo, usuario, contraseña, última actualización, imagen).
* **store:** Detalles de las tiendas (id, gerente, dirección, última actualización).

## Ejercicios

Los ejercicios involucran realizar consultas SQL para obtener información de la base de datos Sakila.

## Criterios de Evaluación

* Dominar las queries básicas: `SELECT`, `UPDATE`, `DELETE`, `INSERT` 
* Dominar las funciones `GROUP BY`, `WHERE` y `HAVING`
* Dominar el uso de `JOIN`s (incluyendo `UNION` y `UNION ALL`) 
* Dominar el uso de subconsultas 
* Dominar el uso de las subconsultas correlacionadas 


