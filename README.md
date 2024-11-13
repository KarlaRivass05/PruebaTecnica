# PruebaTecnica

# Proyecto de Importación de Datos desde Excel a MySQL con XAMPP y HeidiSQL

Este script fue importado con los datos desde un archivo de Excel a una base de datos MySQL usando XAMPP y HeidiSQL.

## Requisitos previos

Para ejecutar este script, necesitarás tener instalado lo siguiente:

- [XAMPP](https://www.apachefriends.org/index.html) (incluye Apache y MySQL)
- [HeidiSQL](https://www.heidisql.com/) para gestionar la base de datos MySQL
- [CSV Files](#preparación-de-los-archivos-csv) generados desde un archivo de Excel

## Instalación


1. Instalar XAMPP
2. Instalar e inciiar HeidiSQL
3. Crear una base de datos para poder ejecutar el script

### 3. **Preparación de los Archivos CSV**

1. Abrir el archivo de Excel
2. Guarda cada hoja del archivo como un archivo CSV:
   - Ve a **Archivo** → **Guardar como** y selecciona **CSV** como formato.
   - Guarda cada hoja como un archivo CSV independiente.
   
### 4. **Importar los Archivos CSV en HeidiSQL**

1. Abre HeidiSQL y selecciona la base de datos donde deseas importar los datos.
2. En la barra de herramientas, selecciona la opción **Archivo** → **Importar archivo de texto**.
   ![image](https://github.com/user-attachments/assets/6c03270b-afee-4073-9854-d539ab3b3138)

3. Selecciona uno de los archivos CSV generados y agregar d ela siguiente manera.
![image](https://github.com/user-attachments/assets/f667c3ef-262d-4484-be12-d0351d945b37)

Esto se para cada pagina de escel con los datos y primero se agrega los datos que no tienen relacion alguna

### 5. **Ejecutar el Script**

Una vez que se importaron los archivos CSV a la base de datos, puedes ejecutar el script, sin embargo para evitar errores e inconvenientes ejecutar las consultas una a una.

