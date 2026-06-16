@smoke @user @read
Feature: PetStore API - Buscar usuario
  Como tester de QA
  Quiero consultar un usuario por username
  Para validar el endpoint GET /user/{username}

  Background:
    * url baseUrl
    * def userData = call read('classpath:api/helpers/generate-user.js')
    * def createPayload = userData.createPayload

  Scenario: Buscar el usuario creado previamente
    # Precondicion: crear usuario para poder buscarlo
    Given path 'user'
    And request createPayload
    When method post
    Then status 200

    # ENTRADA: GET /user/{username}
    Given path 'user', userData.username
    When method get
    Then status 200
    And match response contains { id: '#number', username: '#string', email: '#string', firstName: '#string', lastName: '#string' }
    And match response.username == userData.username
    And match response.email == userData.email
    And match response.firstName == userData.firstName
    And match response.lastName == userData.lastName
    * karate.log('SALIDA - Usuario encontrado:', response)
