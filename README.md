# ParqueoApp
 Prueba Tecnica
 
 El siguiente proyecto es un ejercicio practico para una aplicación de Parqueo con base a los requerimientos solicitados.

 La solucion esta compuesta de cuatro proyectos siendo los siguientes:

## WebApp

### WebApp.Domain
Proyecto tipo clase para el modelado del dominio de Acceso a Datos utilizando EF como ORM para el mapeo y acceso a los datos.

### WebApp.Repo
Proyecto tipo clase para uso de Repositorio de Abstracción por medio de Interfases

### WebApp.Api
Proyecto tipo ASP MVC WebApi para la creacion de los servicios API Rest

### WebApp.Web
Proyecto tipo ASP MVC para la creacion de la interfaz de usuario y consumo de los servicios Api Rest
 
## Requisitos

- Microsoft Visual Studio 2022
- .Net Framework 4.7.2
- Server Express 2022 Version 16.0.1

## Instalación

Creacion de Base de Datos por medio de archivo `script.sql` en carpeta ParqueoApp\Database

Abrir Microsoft Visual Studio 2022 la solución `WebApp.sln` en carpeta ParqueoApp\WebApp y Start. La solucion esta configurada para que se ejecuten los proyectos WebApp.Api y WebApp.Web en paralero en el cual WebApp.Api iniciara el servicio API Rest desde la integracion con IIS Express utilizando la siguiente url y puerto configurado (http://localhost:52397/) y el proyecto WebApp.Web iniciara el proyecto ASP MVC como interfaz de usuario cliente para el consumo del proyecto API Rest.

## Screenshots

### Inicio

![App Screenshot](https://github.com/lvasquez/ParqueoApp/blob/main/Screenshots/Inicio.png)

### Listado

![App Screenshot](https://github.com/lvasquez/ParqueoApp/blob/main/Screenshots/listado.png)

### Ingreso

![App Screenshot](https://github.com/lvasquez/ParqueoApp/blob/main/Screenshots/Ingreso.png)

### Salida

![App Screenshot](https://github.com/lvasquez/ParqueoApp/blob/main/Screenshots/Salida.png)