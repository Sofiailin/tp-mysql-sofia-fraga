-- Ejercicio 1 – Crear Base de Datos
--Crear una base de datos llamada veterinaria_patitas_felices.


--Ejercicio 2 – Crear tabla duenos
-- Crear la tabla duenos con las siguientes columnas:
-- Columna Tipo Restricciones
-- id INT PRIMARY KEY, AUTO_INCREMENT
-- nombre VARCHAR(50) NOT NULL
-- apellido VARCHAR(50) NOT NULL
-- telefono VARCHAR(20) NOT NULL
-- direccion VARCHAR(100)


-- --Ejercicio 3 – Crear tabla mascotas
-- Crear la tabla mascotas con las siguientes columnas:
-- Columna Tipo Restricciones
-- id INT PRIMARY KEY, AUTO_INCREMENT
-- nombre VARCHAR(50) NOT NULL
-- especie VARCHAR(30) NOT NULL
-- fecha_nacimiento DATE
-- id_dueno INT FOREIGN KEY → duenos.id


-- --Ejercicio 4 – Crear tabla veterinarios
-- Crear la tabla veterinarios con las siguientes columnas:
-- Columna Tipo Restricciones
-- id INT PRIMARY KEY, AUTO_INCREMENT
-- nombre VARCHAR(50) NOT NULL
-- apellido VARCHAR(50) NOT NULL
-- matricula VARCHAR(20) NOT NULL, UNIQUE
-- especialida
-- d
-- VARCHAR(50) NOT NULL


-- Ejercicio 5 – Crear tabla historial_clinico
-- Crear la tabla historial_clinico con las siguientes columnas:
-- Columna Tipo Restricciones
-- id INT PRIMARY KEY, AUTO_INCREMENT
-- id_mascota INT FOREIGN KEY → mascotas.id
-- id_veterinario INT FOREIGN KEY → veterinarios.id
-- fecha_registro DATETIME NOT NULL, DEFAULT CURRENT_TIMESTAMP
-- descripcion VARCHAR(250) NOT NULL


-- Ejercicio 6 – Insertar registros
-- Insertar:
-- ● 3 dueños con información completa
-- ● 3 mascotas, cada una asociada a un dueño
-- ● 2 veterinarios con especialidades distintas
-- ● 3 registros de historial clínico


-- Ejercicio 7 – Actualizar registros
-- Realizar las siguientes actualizaciones:
-- 1. Cambiar la dirección de un dueño (por ID o nombre).
-- 2. Actualizar la especialidad de un veterinario (por ID o matrícula).
-- 3. Editar la descripción de un historial clínico (por ID).


-- Ejercicio 8 – Eliminar registros
-- 1. Eliminar una mascota (por ID o nombre).
-- 2. Verificar que se eliminen automáticamente los registros del historial clínico asociados
-- (ON DELETE CASCADE).


-- Ejercicio 9 – JOIN simple
-- Consulta que muestre:
-- ● Nombre de la mascota
-- ● Especie
-- ● Nombre completo del dueño (nombre + apellido)


-- Ejercicio 10 – JOIN múltiple con historial
-- Consulta que muestre todas las entradas del historial clínico con:
-- ● Nombre y especie de la mascota
-- ● Nombre completo del dueño
-- ● Nombre completo del veterinario
-- ● Fecha de registro
-- ● Descripción
