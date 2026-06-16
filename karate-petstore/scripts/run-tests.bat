@echo off
setlocal
cd /d "%~dp0.."

echo ============================================================
echo  PetStore User API - Ejecucion de pruebas Karate
echo ============================================================
echo.

where java >nul 2>&1
if errorlevel 1 (
    echo ERROR: Java no encontrado. Instale JDK 17+ y agreguelo al PATH.
    exit /b 1
)

where mvn >nul 2>&1
if errorlevel 1 (
    echo ERROR: Maven no encontrado. Instale Maven 3.8+ y agreguelo al PATH.
    exit /b 1
)

echo [1/2] Ejecutando pruebas...
call mvn clean test -q
if errorlevel 1 (
    echo.
    echo RESULTADO: FALLIDO - Revise los logs arriba.
    exit /b 1
)

echo.
echo [2/2] Generando reporte Cucumber HTML...
call mvn verify -q -DskipTests
if errorlevel 1 (
    echo ADVERTENCIA: No se pudo generar reporte Cucumber. Las pruebas si pasaron.
)

echo.
echo ============================================================
echo  RESULTADO: EXITOSO
echo  Reporte Karate:  target\karate-reports\karate-summary.html
echo  Reporte Cucumber: target\cucumber-html-reports\overview-features.html
echo ============================================================

endlocal
