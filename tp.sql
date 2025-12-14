-- Ejercicio 1 – Crear Base de Datos
--Crear una base de datos llamada veterinaria_patitas_felices.

CREATE DATABASE veterinaria_patitas_felices;  -- Crear una base de datos
USE veterinaria_patitas_felices; -- Usar la base de datos


--Ejercicio 2 – Crear tabla duenos
-- Crear la tabla duenos con las siguientes columnas:
-- Columna Tipo Restricciones
-- id INT PRIMARY KEY, AUTO_INCREMENT
-- nombre VARCHAR(50) NOT NULL
-- apellido VARCHAR(50) NOT NULL
-- telefono VARCHAR(20) NOT NULL
-- direccion VARCHAR(100)

CREATE TABLE duenos (   -- Crear una tabla de usuarios
    id INT PRIMARY KEY AUTO_INCREMENT,    -- Columna de tipo INT para que sean numeros enteros, 
                                        --primary key para que sea con un id unico y 
                                        -- auto_increment se autoincremente automaticamente con cada ingreso.
    nombre VARCHAR(50) NOT NULL,  -- Columna de texto, obligatoria hasta (*) caracteres
    apellido VARCHAR(50) NOT NULL, -- not null para que sea obligatoria de completar
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(100)
);


-- --Ejercicio 3 – Crear tabla mascotas
-- Crear la tabla mascotas con las siguientes columnas:
-- Columna Tipo Restricciones
-- id INT PRIMARY KEY, AUTO_INCREMENT
-- nombre VARCHAR(50) NOT NULL
-- especie VARCHAR(30) NOT NULL
-- fecha_nacimiento DATE
-- id_dueno INT FOREIGN KEY → duenos.id

CREATE TABLE mascotas (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,  
    especie VARCHAR(30) NOT NULL, 
    fecha_nacimiento DATE,
    id_dueno INT, -- si este campo tuviera la caracteristica NOT NULL UNIQUE, entonces seria de relacion 1:1
    FOREIGN KEY (id_dueno) REFERENCES duenos(id)  -- Clave foránea para que cada registro de una tabla se relacione con exactamente un registro
                                                 --  de otra tabla, en este caso la tabla duenos del ej. antetior.
                                                 -- es de relacion 1:n: porque un dueño puede tener muchas mascotas.
);


-- --Ejercicio 4 – Crear tabla veterinarios
-- Crear la tabla veterinarios con las siguientes columnas:
-- Columna Tipo Restricciones
-- id INT PRIMARY KEY, AUTO_INCREMENT
-- nombre VARCHAR(50) NOT NULL
-- apellido VARCHAR(50) NOT NULL
-- matricula VARCHAR(20) NOT NULL, UNIQUE
-- especialidad VARCHAR(50) NOT NULL

CREATE TABLE veterinarios (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,  
    apellido VARCHAR(50) NOT NULL, 
    matricula VARCHAR(20) NOT NULL UNIQUE, -- UNIQUE para que no se repita la matricula de ningun veterinario
    especialidad VARCHAR(50) NOT NULL
);


-- Ejercicio 5 – Crear tabla historial_clinico
-- Crear la tabla historial_clinico con las siguientes columnas:
-- Columna Tipo Restricciones
-- id INT PRIMARY KEY, AUTO_INCREMENT
-- id_mascota INT FOREIGN KEY → mascotas.id
-- id_veterinario INT FOREIGN KEY → veterinarios.id
-- fecha_registro DATETIME NOT NULL, DEFAULT CURRENT_TIMESTAMP
-- descripcion VARCHAR(250) NOT NULL

CREATE TABLE historial_clinico (   
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_mascota INT,  -- vinculado a la tabla mascotas 
    id_veterinario INT, -- vinculado a la tabla veterinarios
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- DEFAULT CURRENT_TIMESTAMP para que se registre automaticamente la fecha y hora actual en caso que no se complete el dato.
    descripcion VARCHAR(250) NOT NULL,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id),
    FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id)
);


-- Ejercicio 6 – Insertar registros
-- Insertar:
-- ● 3 dueños con información completa
-- ● 3 mascotas, cada una asociada a un dueño
-- ● 2 veterinarios con especialidades distintas
-- ● 3 registros de historial clínico

INSERT INTO duenos (nombre, apellido, telefono, direccion) -- Insertar informacion en las tablas
VALUES
        ('Marge', 'Bouvier', '123456789', 'Calle Falsa 123'),
        ('Lisa', 'Simpson', '987654321', 'Avenida Siempre Viva 742'),
        ('Montgomery', 'Burns', '456789123', 'Avenida Mammon 1000');

INSERT INTO mascotas (nombre, especie, fecha_nacimiento, id_dueno) 
VALUES
        ('Canela', 'Cobayo', '2015-04-21', 1),
        ('Bola de Nieve', 'Gato', '2017-08-25', 2),
        ('Mr. Burns', 'Canario', '2010-09-04', 3);

INSERT INTO veterinarios (nombre, apellido, matricula, especialidad) 
    VALUES
        ('Dr. Julio', 'Hibbert', 'M12345', 'Veterinaria General'),
        ('Dr. Nick', 'Riviera', 'M67890', 'Animales Exóticos');

INSERT INTO historial_clinico (id_mascota, id_veterinario, descripcion) VALUES
(1, 2, 'Chequeo anual.'),
(2, 1, 'Vacunacion'),
(3, 2, 'Tratamiento por resfriado');


-- Ejercicio 7 – Actualizar registros
-- Realizar las siguientes actualizaciones:
-- 1. Cambiar la dirección de un dueño (por ID o nombre).
-- 2. Actualizar la especialidad de un veterinario (por ID o matrícula).
-- 3. Editar la descripción de un historial clínico (por ID).

UPDATE duenos      -- Cambiar la direccion del dueño con id 1
SET direccion = 'Avenida Siempre Viva 742'
WHERE id = 1; 

UPDATE veterinarios
SET especialidad = 'Cirugia de Animales Exoticos'
WHERE matricula = 'M67890';  

UPDATE historial_clinico
SET descripcion = 'Mordio un cable electrico.'      
WHERE id = 1;


-- Ejercicio 8 – Eliminar registros
-- 1. Eliminar una mascota (por ID o nombre).
-- 2. Verificar que se eliminen automáticamente los registros del historial clínico asociados
-- (ON DELETE CASCADE).

-- Modificar la llave foránea para aplicar ON DELETE CASCADE y ON UPDATE CASCADE
ALTER TABLE historial_clinico
ADD CONSTRAINT fk_historial_mascota_cascade -- Le damos un nombre de la nueva restricción
FOREIGN KEY (id_mascota)
REFERENCES mascotas(id)
ON DELETE CASCADE -- Evita registros "huérfanos".
ON UPDATE CASCADE; -- Se cambia el id de una mascota actualiza automáticamente id_mascota en todos los asociados

DELETE FROM mascotas    -- Eliminar la mascota con id 1
WHERE id = 1;

SELECT * FROM historial_clinico;   -- consulta si se borro el dato pedido


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
