# 💻 TP - MySQL Veterinaria "Patitas Felices 🐾" 

## 📋 Resumen del Proyecto

Este repositorio contiene los scripts de SQL escritos para el Trabajo Intermedio sobre "base de datos" del curso de Backend Developer. 
El objetivo es diseñar e implementar un sistema de gestión de base de datos relacional para la veterinaria "Patitas Felices" utilizando MySQL.

El proyecto abarca la creación de la estructura de la base de datos, el establecimiento de las relaciones (con PK Y FK), la realización de operaciones CRUD (Crear, Leer, Actualizar, Eliminar) y la ejecución de consultas complejas (JOINs) para la gestión de dueños, mascotas, veterinarios e historial clínico.

### 💾 Estructura de la Base de Datos (Esquema Relacional)

La base de datos `veterinaria_patitas_felices` está compuesta por cinco (5) tablas principales relacionadas entre sí.

- Informacion sobre los duenos
- Informacion sobre las mascotas y quien es su dueno
- Informacion sobre los veterinario 
- Informacion sobre el historial clinico de cada mascota y que veterinario los atendio.

Operaciones CRUD Básicas 

- Donde se crearon 3 duenos diferentes, 3 mascotas, 2 veterinarios y 3 registros de historia clínica.
- Se actualizaron y eliminaron datos especificos sobre la informacion ingresada en las tablas.
- Se modifico una restriccion para que al eliminar un dato se eliminen tambien los datos relacionados automaticamente y no queden datos "huerfanos".

Consultas con JOINs 

Se realizo una consulta simple sobre quien es el dueno de que mascota , especificando tambien la especie
Y se realizo una consulta del historial clinico, pidiendo tambien : nombre y especie de la mascota, nombre completo del dueño, nombre completo del veterinario, fecha de registro y descripción. Se uso el "LEFT JOIN" que muestra todos los datos de las entradas del historial clínico sean incluidas en el resultado aunque no tenga los otros datos asociados.

#### 🚀 Requisitos Técnicos

* Motor de Base de Datos:* MySQL


👨‍💻 Sofia Ailin Fraga

📅 2025 – Diplomatura en Desarrollo Web Full Stack (UTN BA)