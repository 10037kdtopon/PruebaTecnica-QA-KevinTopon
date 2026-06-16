@smoke @user @update
Feature: PetStore API - Actualizar usuario
  Como tester de QA
  Quiero actualizar nombre y correo de un usuario
  Para validar el endpoint PUT /user/{username}

  Background:
    * url baseUrl
    * def userData = call read('classpath:api/helpers/generate-user.js')
    * def createPayload = userData.createPayload

  Scenario: Actualizar nombre y correo del usuario
    # Precondicion: crear usuario
    Given path 'user'
    And request createPayload
    When method post
    Then status 200

    # Obtener ID real asignado por el servidor (requerido para PUT)
    Given path 'user', userData.username
    When method get
    Then status 200
    * def userId = response.id

    # ENTRADA: PUT /user/{username} con firstName, lastName y email actualizados
    * def updatePayload =
    """
    {
      "id": #(userId),
      "username": "#(userData.username)",
      "firstName": "#(userData.updatedFirstName)",
      "lastName": "#(userData.updatedLastName)",
      "email": "#(userData.updatedEmail)",
      "password": "#(userData.password)",
      "phone": "#(userData.phone)",
      "userStatus": #(userData.userStatus)
    }
    """
    * karate.log('ENTRADA - Payload de actualizacion:', updatePayload)

    Given path 'user', userData.username
    And request updatePayload
    When method put
    Then status 200
    And match response contains { code: '#number', type: '#string', message: '#string' }
    And match response.code == 200
    * karate.log('SALIDA - Usuario actualizado. Nuevo email:', userData.updatedEmail)
