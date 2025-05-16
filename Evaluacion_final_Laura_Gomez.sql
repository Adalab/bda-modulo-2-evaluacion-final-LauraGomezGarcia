USE sakila; 
											-- EJERCICIOS OBLIGATORIOS --
                                            
 -- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
 
 SELECT DISTINCT title
 FROM film;
 
 -- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
 
 SELECT title
 FROM film
 WHERE rating = "PG-13" ;
 
 -- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
 
 SELECT title, description
 FROM film
 WHERE description LIKE  "%amazing%" ;
 
 -- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
 
 SELECT title, length
 FROM film
 WHERE length > 120 
 ORDER BY length;
 
 -- 5. Encuentra los nombres de todos los actores, muestralos en una sola columna que se llame nombre_actor y contenga nombre y apellido.
 
 SELECT concat(first_name," ", last_name) AS nombre_actor
 FROM actor
 ORDER BY nombre_actor;
 
 -- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
 
 SELECT first_name, last_name
 FROM actor
 WHERE last_name = "Gibson";
 
 
 -- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
 
 SELECT first_name, actor_id
 FROM actor
 WHERE actor_id BETWEEN 10 AND 20;
 
 -- 8. Encuentra el título de las películas en la tabla film que no tengan clasificacion "R" ni "PG-13".
 
 SELECT title, rating
 FROM film
 WHERE rating NOT IN ("PG-13","R") 
 ORDER BY rating;
 
 -- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
 
 SELECT rating, COUNT(film_id) AS peliculas_totales
 FROM film
 GROUP BY rating
 ORDER BY peliculas_totales DESC;
 
 -- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
 SELECT c.customer_id, c.first_name,c.last_name, COUNT(r.rental_id) AS peliculas_alquiladas
 FROM customer c
 JOIN rental r ON c.customer_id = r.customer_id
 GROUP BY c.customer_id, c.first_name,c.last_name;
 
 -- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
 
 SELECT c.name , COUNT(i.film_id) AS peliculas_alquiladas
 FROM rental r
 JOIN inventory i ON r.inventory_id = i.inventory_id
 JOIN film_category fc ON fc.film_id = i.film_id
 JOIN category c ON c.category_id = fc.category_id
 GROUP BY c.name 
 ORDER BY peliculas_alquiladas DESC;
 
 -- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
 
 SELECT rating, ROUND(AVG(length)) as duracion_media
 FROM film
 GROUP BY rating
 ORDER BY duracion_media DESC;
 
 -- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
 
 SELECT a.first_name, a.last_name, f.title
 FROM actor a
 JOIN film_actor fa ON a.actor_id = fa.actor_id
 JOIN film f ON fa.film_id = f.film_id
 WHERE f.title = "Indian Love";
 
 -- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
 
 SELECT title, description
 FROM film
 WHERE description REGEXP '\\bdog\\b|\\bcat\\b' ;
 
 -- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
 -- RESPUESTA: no hay ningun actor que no aparezca en ninguna pelicula
 
 -- RESPUESTA: No hay ningún actor que no aparezca en alguna película

 --  Consulta 1: Total de actores registrados
SELECT COUNT(DISTINCT actor_id) AS total_actores
FROM actor;

-- Consulta 2: Total de actores que han participado en al menos una película
SELECT COUNT(DISTINCT actor_id) AS total_actores
FROM film_actor;

-- Consulta 3: Actores sin películas
SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;
 
 -- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
 
 SELECT title, release_year
 FROM film
 WHERE release_year BETWEEN 2005 AND 2010
 ORDER BY release_year;
 
 -- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
 
SELECT f.title, c.name AS categoria
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Family';
 
 -- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
 
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS total_peliculas
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) > 10
ORDER BY total_peliculas DESC;

 
 -- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.

 SELECT title, rating, length
 FROM film
 WHERE length > 120 AND rating = "R"
 ORDER BY length;
 
 -- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos 
 -- y muestra el nombre de la categoría junto con el promedio de duración.
 
SELECT c.name AS categoria, ROUND(AVG(f.length),1) AS promedio_duracion
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name
HAVING AVG(f.length) > 120
ORDER BY promedio_duracion ASC;
 
 -- 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
 
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS cantidad_peliculas
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) >= 5
ORDER BY cantidad_peliculas DESC;

 
 -- 22. Encuentra el título de todas las películas que fueron alquiladas durante más de 5 días. 
 -- Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes. 
 -- Pista: Usamos DATEDIFF para calcular la diferencia entre una fecha y otra, ej: DATEDIFF(fecha_inicial, fecha_final)
 
SELECT DISTINCT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IN (
    SELECT r.inventory_id
    FROM rental r
    WHERE DATEDIFF(r.return_date, r.rental_date) > 5
);
 
 -- 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". 
 -- Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
 
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.actor_id NOT IN (
    SELECT fa.actor_id
    FROM film_actor fa
    JOIN film_category fc ON fa.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Horror'
);

 
										-- BONUS --
 
 -- 24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film con subconsultas.
 
SELECT f.title, f.length
FROM film f
WHERE f.film_id IN (
    SELECT fc.film_id
    FROM  film_category fc
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Comedy'
)
AND f.length> 180 ;

 -- 25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. 
 -- La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos. 
 -- Pista: Podemos hacer un JOIN de una tabla consigo misma, poniendole un alias diferente

SELECT 
    CONCAT(a1.first_name, ' ', a1.last_name) AS actor_1, -- Duplicamos actor para poder mostrar dos columnas con los nombres de ambos actores del dúo
    CONCAT(a2.first_name, ' ', a2.last_name) AS actor_2, -- Duplicamos actor para poder mostrar dos columnas con los nombres de ambos actores del dúo
    COUNT(*) AS peliculas_en_comun  -- Cuenta cuántas películas han compartido ese par de actores
FROM film_actor fa1 -- self-join (la tabla film_actor consigo misma)La condición fa1.actor_id < fa2.actor_id evita comparaciones duplicadas (A-B y B-A) y consigo mismo (A-A)
JOIN film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id 
JOIN actor a1 ON fa1.actor_id = a1.actor_id -- Joins de tablas de actores
JOIN actor a2 ON fa2.actor_id = a2.actor_id -- Joins de tablas de actores
GROUP BY actor_1 , actor_2 -- Columnas a mostrar
HAVING COUNT(*) >= 1 -- Criterio que sea más de una.
ORDER BY peliculas_en_comun DESC;


