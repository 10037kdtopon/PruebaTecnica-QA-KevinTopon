================================================================================
  PRUEBA TECNICA QA JUNIOR - PetStore User API con Karate
  Proyecto: karate-petstore
  API objetivo: https://petstore.swagger.io/
================================================================================

DESCRIPCION
-----------
Suite automatizada de pruebas REST que valida el ciclo de vida completo de un
usuario en la API PetStore (Swagger):

  1. Crear un usuario          -> POST   /user
  2. Buscar el usuario creado  -> GET    /user/{username}
  3. Actualizar nombre y email -> PUT    /user/{username}
  4. Buscar usuario actualizado-> GET    /user/{username}
  5. Eliminar el usuario       -> DELETE /user/{username}

REQUISITOS PREVIOS
------------------
  - Java JDK 17 o superior instalado y disponible en PATH
  - Apache Maven 3.8+ instalado y disponible en PATH
  - Conexion a Internet (la API es publica en petstore.swagger.io)

Verificar instalacion:
  java -version
  mvn -version

ESTRUCTURA DEL PROYECTO
-----------------------
  karate-petstore/
  |-- pom.xml                          -> Dependencias Maven (Karate 1.5.0)
  |-- readme.txt                       -> Este archivo
  |-- conclusiones.txt                 -> Hallazgos del ejercicio
  |-- scripts/
  |     |-- run-tests.bat              -> Ejecutar pruebas en Windows
  |     |-- run-tests.sh               -> Ejecutar pruebas en Linux/Mac
  |-- src/test/java/
        |-- karate-config.js           -> URL base, timeouts, logging
        |-- api/
              |-- TestRunner.java      -> Runner JUnit5 + generacion de reportes
              |-- user/
              |     |-- user-lifecycle.feature   -> Flujo E2E completo (principal)
              |     |-- 01-create-user.feature   -> Caso: crear usuario
              |     |-- 02-get-user.feature      -> Caso: buscar usuario
              |     |-- 03-update-user.feature   -> Caso: actualizar usuario
              |     |-- 04-get-updated-user.feature -> Caso: verificar cambios
              |     |-- 05-delete-user.feature   -> Caso: eliminar usuario
              |-- data/
              |     |-- user-create-payload.json -> Plantilla de entrada POST
              |-- schemas/
              |     |-- user.schema.json           -> Esquema JSON respuesta User
              |     |-- api-response.schema.json   -> Esquema JSON respuesta generica
              |-- helpers/
                    |-- generate-user.js         -> Generador de datos unicos (UUID)

PASO A PASO - EJECUCION EN WINDOWS
----------------------------------
  1. Abrir terminal (PowerShell o CMD).

  2. Ir a la carpeta del proyecto:
       cd ruta\a\karate-petstore

  3. Ejecutar el script de pruebas:
       scripts\run-tests.bat

     O manualmente con Maven:
       mvn clean test

  4. Esperar a que finalice. Resultado esperado:
       Tests run: 2, Failures: 0, Errors: 0

PASO A PASO - EJECUCION EN LINUX / MAC
--------------------------------------
  1. Abrir terminal.

  2. Ir a la carpeta del proyecto:
       cd /ruta/a/karate-petstore

  3. Dar permisos y ejecutar:
       chmod +x scripts/run-tests.sh
       ./scripts/run-tests.sh

     O manualmente:
       mvn clean test

PASO A PASO - EJECUCION SELECTIVA
---------------------------------
  Solo flujo E2E principal:
    mvn test -Dtest=TestRunner#testUserLifecycleE2E

  Solo suite completa con tag @smoke:
    mvn test -Dtest=TestRunner#testUserApiSuite

  Un feature individual (ejemplo):
    mvn test -Dkarate.options="classpath:api/user/01-create-user.feature"

REPORTES GENERADOS
------------------
  Tras ejecutar las pruebas se generan automaticamente:

  1. Reporte HTML Karate (detalle request/response por escenario):
       target/karate-reports/karate-summary.html

  2. Reportes individuales por feature:
       target/karate-reports/*.html

  3. JSON Cucumber (para integracion CI):
       target/karate-reports/*.json

  4. Reporte Cucumber HTML (ejecutar mvn verify):
       target/cucumber-html-reports/overview-features.html

VARIABLES Y DATOS DE PRUEBA
---------------------------
  - baseUrl: https://petstore.swagger.io/v2  (configurado en karate-config.js)
  - username: generado dinamicamente con prefijo "qa_user_" + UUID (8 chars)
  - email:    unico por ejecucion para evitar colisiones
  - password: SecurePass123!
  - Los payloads de entrada estan en src/test/java/api/data/
  - Las validaciones de salida usan esquemas JSON en src/test/java/api/schemas/

SUBIR A GITHUB (REPOSITORIO PUBLICO)
------------------------------------
  1. Crear repositorio publico en GitHub (ej: karate-petstore-qa).

  2. Inicializar git en la carpeta del proyecto:
       git init
       git add .
       git commit -m "Prueba tecnica QA: PetStore User API con Karate"
       git branch -M main
       git remote add origin https://github.com/TU_USUARIO/karate-petstore-qa.git
       git push -u origin main

  3. Verificar que el repositorio incluya readme.txt, conclusiones.txt,
     codigo fuente y NO incluya la carpeta target/ (esta en .gitignore).

CONTACTO / NOTAS
----------------
  Herramienta principal: Karate DSL (https://karatelabs.io/)
  Documentacion API:     https://petstore.swagger.io/
