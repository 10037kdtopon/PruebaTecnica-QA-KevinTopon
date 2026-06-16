@smoke @user @delete
Feature: PetStore API - Eliminar usuario
  Como tester de QA
  Quiero eliminar un usuario existente
  Para validar el endpoint DELETE /user/{username}

  Background:
    * url baseUrl
    * def userData = call read('classpath:api/helpers/generate-user.js')
    * def createPayload = userData.createPayload

  Scenario: Eliminar el usuario y verificar que ya no existe
    # Precondicion: crear usuario
    Given path 'user'
    And request createPayload
    When method post
    Then status 200

    # ENTRADA: DELETE /user/{username}
    Given path 'user', userData.username
    When method delete
    Then status 200
    And match response contains { code: '#number', type: '#string', message: '#string' }
    And match response.code == 200
    * karate.log('SALIDA - Usuario eliminado:', userData.username)

    # Verificacion post-eliminacion: el usuario ya no debe existir
    Given path 'user', userData.username
    When method get
    Then status 404
    * karate.log('SALIDA - Confirmado: GET retorna 404 despues de DELETE')
