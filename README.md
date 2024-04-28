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

### Pantalla de Inicio

Pantalla de inicio de la aplicación.

![App Screenshot](https://github.com/lvasquez/ParqueoApp/blob/main/Screenshots/Inicio.png)

### Pantalla de Listado

Se despliega el listado de todos los vehiculos ingresados con la Tarifa actual si aplica o no.

![App Screenshot](https://github.com/lvasquez/ParqueoApp/blob/main/Screenshots/listado.png)

### Pantalla de Ingreso

Se ingresa unicamente la Placa y si es un vehiculo Oficial o no.

![App Screenshot](https://github.com/lvasquez/ParqueoApp/blob/main/Screenshots/Ingreso.png)

### Pantalla de Salida

Se ingresa unicamente el numero de Placa y se calculo de forma automatica y en tiempo real la Tarifa la cual es un campo de lectura unicamente.

![App Screenshot](https://github.com/lvasquez/ParqueoApp/blob/main/Screenshots/Salida.png)