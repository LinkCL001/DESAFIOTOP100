--1. Crear una base de datos llamada películas. (1 Punto)
CREATE DATABASE peliculas;
--2. Cargar ambos archivos a su tabla correspondiente. (1 Punto)
CREATE TABLE peliculas(
    id INT,
    pelicula VARCHAR(75),
    ano_estreno INT,
    director VARCHAR(50),
    PRIMARY KEY (id)
);
CREATE TABLE reparto(
    id_pelicula INT,
    actor VARCHAR(50),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas (id)
);

\copy peliculas FROM 'D:\peliculas.csv' csv header;
\copy reparto FROM 'D:\reparto.csv' csv header;

--3. Obtener el ID de la película “Titanic”. (1 Punto)

SELECT id FROM peliculas WHERE pelicula='Titanic';

--4. Listar a todos los actores que aparecen en la película "Titanic". (1 Puntos)

SELECT actor FROM reparto WHERE id_pelicula=2;

--5. Consultar en cuántas películas del top 100 participa Harrison Ford. (2 Puntos)

SELECT COUNT(id_pelicula) AS total FROM reparto WHERE actor='Harrison Ford';

--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título demanera ascendente. (1 punto)

SELECT pelicula,ano_estreno FROM peliculas WHERE ano_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;

--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe sernombrado para la consulta como “longitud_titulo”. (1 punto)

SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;


--8. Consultar cual es la longitud más grande entre todos los títulos de las películas.(2 punto)

SELECT pelicula, LENGTH(pelicula) FROM peliculas ORDER BY LENGTH(pelicula) DESC, pelicula DESC LIMIT 1;