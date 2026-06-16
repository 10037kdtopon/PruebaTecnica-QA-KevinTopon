@smoke @user @create
Feature: PetStore API - Crear usuario
  Como tester de QA
  Quiero crear un usuario en PetStore
  Para validar el endpoint POST /user

  Background:
    * url baseUrl
    * def userData = call read('classpath:api/helpers/generate-user.js')
    * def createPayload = userData.createPayload
    * karate.log('ENTRADA - Datos generados para creacion:', createPayload)

  Scenario: Crear un usuario con datos validos
    # ENTRADA: POST /user con cuerpo JSON del usuario
    Given path 'user'
    And request createPayload
    When method post
    Then status 200
    And match response contains { code: '#number', type: '#string', message: '#string' }
    And match response.code == 200
    * karate.log('SALIDA - Usuario creado. ID retornado:', response.message)
