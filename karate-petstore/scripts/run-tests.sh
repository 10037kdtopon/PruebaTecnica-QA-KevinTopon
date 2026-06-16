#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "============================================================"
echo " PetStore User API - Ejecucion de pruebas Karate"
echo "============================================================"
echo

command -v java >/dev/null 2>&1 || { echo "ERROR: Java no encontrado."; exit 1; }
command -v mvn  >/dev/null 2>&1 || { echo "ERROR: Maven no encontrado."; exit 1; }

echo "[1/2] Ejecutando pruebas..."
mvn clean test -q

echo
echo "[2/2] Generando reporte Cucumber HTML..."
mvn verify -q -DskipTests || echo "ADVERTENCIA: Reporte Cucumber no generado."

echo
echo "============================================================"
echo " RESULTADO: EXITOSO"
echo " Reporte Karate:   target/karate-reports/karate-summary.html"
echo " Reporte Cucumber: target/cucumber-html-reports/overview-features.html"
echo "============================================================"
