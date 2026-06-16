========================================================================
PRUEBA TECNICA E2E - AUTOMATIZACION DEMOBLAZE CON SERENITY BDD
========================================================================

Este proyecto contiene la automatización de la prueba funcional E2E para el flujo de compra en la página de Demoblaze (https://www.demoblaze.com/), desarrollado bajo el patrón de diseño Screenplay utilizando Serenity BDD, Cucumber y Java.

------------------------------------------------------------------------
1. REQUISITOS PREVIOS
------------------------------------------------------------------------
Antes de ejecutar las pruebas, asegúrese de tener instalado en su equipo:
- Java JDK 17 o superior.
- Apache Maven 3.9 o superior.
- Navegador Google Chrome.
- Acceso a internet (para la descarga automática de dependencias y ejecución de pruebas E2E contra el sitio web).

------------------------------------------------------------------------
2. ESTRUCTURA DEL PROYECTO
------------------------------------------------------------------------
El proyecto se organiza bajo el patrón Screenplay de la siguiente manera:
- Features (Gherkin):
  src/test/resources/features/compra/demoblaze_compra.feature
- Step Definitions:
  src/test/java/starter/stepdefinitions/DemoblazeStepDefinitions.java
- UI Targets:
  src/test/java/starter/ui/ (Mapeo de localizadores y selectores de la página)
- Tasks (Tareas de Actor):
  src/test/java/starter/tasks/ (Acciones complejas como AddProduct o CompletePurchase)
- Interactions:
  src/test/java/starter/interactions/ (Interacciones de bajo nivel como AcceptAlert)

------------------------------------------------------------------------
3. INSTRUCCIONES DE EJECUCION
------------------------------------------------------------------------
Siga los siguientes pasos para ejecutar las pruebas locales:

Paso 1: Abrir la terminal de comandos o consola en la raíz del proyecto.
Paso 2: Ejecutar el siguiente comando para limpiar, compilar y ejecutar los escenarios de prueba:
   
   mvn clean verify

Paso 3: (Opcional) Si desea ejecutar la prueba viendo la interfaz gráfica del navegador (modo no-headless),
   abra el archivo 'src/test/resources/serenity.conf' y cambie la propiedad:
   
   headless.mode = false

------------------------------------------------------------------------
4. VISUALIZACION DE REPORTES
------------------------------------------------------------------------
Serenity BDD genera reportes altamente detallados y dinámicos al finalizar la ejecución.

Para abrir el reporte generado:
1. Navegue a la carpeta: target/site/serenity/
2. Abra el archivo 'index.html' en cualquier navegador web.
3. Aquí podrá ver el paso a paso detallado de la ejecución, capturas de pantalla tomadas automáticamente y tiempos de respuesta.
========================================================================
